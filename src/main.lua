--- Main entry point for Arcadia.
-- This file wires together the core game systems and exposes the callbacks
-- used by the LOVE runtime: load, update, draw, quit, and keypressed.
--
-- The actual game logic is delegated to smaller modules:
-- maps manage the current level, group manages active sprites, player handles
-- movement/actions, chat handles dialogs, and save/load persist game state.
-- @module main
local Grill = require("grill")
local Audio = require("audio")
local Chat = require("chat")
local Maps = require("maps")
local Images = require("images")
local Interface = require("interface")

local Player = require("sprites/player")

local Save = require("save")
local Load = require("load")

local boss
local game_state = "menu"
local game_started = false
local menu_index = 1
local menu_logo
local menu_items = {
    {label = "Nuova partita", action = "new"},
    {label = "Continua", action = "continue"}
}

--- Return the screen rectangle used by one main menu item.
-- @param index number Menu item index.
-- @return number x Button x coordinate.
-- @return number y Button y coordinate.
-- @return number width Button width.
-- @return number height Button height.
local function get_menu_item_bounds(index)
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    local button_width = 260
    local button_height = 42
    local button_gap = 14
    local start_y = height / 2 + 95

    return (width - button_width) / 2,
        start_y + (index - 1) * (button_height + button_gap),
        button_width,
        button_height
end

--- Return true when a point is inside a rectangle.
-- @param px number Point x coordinate.
-- @param py number Point y coordinate.
-- @param x number Rectangle x coordinate.
-- @param y number Rectangle y coordinate.
-- @param width number Rectangle width.
-- @param height number Rectangle height.
-- @return boolean Whether the point is inside the rectangle.
local function point_in_rect(px, py, x, y, width, height)
    return px >= x and px <= x + width and py >= y and py <= y + height
end

--- Copy one save file from the initial save folder to the active save folder.
-- This helper intentionally uses the same plain files already used by the
-- save/load modules, so starting a new game behaves like the reset script.
-- @param name string Save file name without extension.
local function reset_save_file(name)
    local input = io.open("save/init/" .. name .. ".pia", "r")
    if not input then
        return
    end

    local content = input:read("*a")
    input:close()

    local output = io.open("save/" .. name .. ".pia", "w")
    if output then
        output:write(content)
        output:close()
    end
end

--- Reset all gameplay save files to their initial state.
-- Used by the main menu when the player chooses "Nuova partita".
local function reset_save()
    reset_save_file("player")
    reset_save_file("quest_completed")
    reset_save_file("quest_started")
end

--- Start gameplay by loading the active save files.
-- @param reset boolean When true, reset saves before loading.
local function start_game(reset)
    if reset then
        reset_save()
    end

    Load(boss)
    game_started = true
    game_state = "game"
end

--- Draw the main menu shown before gameplay starts.
local function draw_menu()
    local width = boss.grill.WIDTH
    local height = boss.grill.HEIGHT

    boss.interface.draw_menu_background()

    if menu_logo then
        local logo_width = menu_logo:getWidth()
        local logo_height = menu_logo:getHeight()
        local logo_max_width = width * 0.34
        local logo_max_height = height * 0.28
        local logo_scale = math.min(logo_max_width / logo_width, logo_max_height / logo_height)
        local logo_x = (width - logo_width * logo_scale) / 2
        local logo_y = height / 2 - 245

        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(menu_logo, logo_x, logo_y, 0, logo_scale, logo_scale)
    end

    local title = "The world of Arcadia"
    local title_scale = 2
    local title_width = love.graphics.getFont():getWidth(title) * title_scale
    local title_x = (width - title_width) / 2

    love.graphics.setColor(1, 1, 1)
    love.graphics.print(title, title_x, height / 2 + 20, 0, title_scale, title_scale)

    for i, item in ipairs(menu_items) do
        local x, y, button_width, button_height = get_menu_item_bounds(i)
        boss.interface.draw_button(item.label, x, y, button_width, button_height, i == menu_index)
    end

    love.graphics.setColor(1, 1, 1)
end

--- Activate one main menu item.
-- @param index number Menu item index.
local function activate_menu_item(index)
    menu_index = index
    start_game(menu_items[menu_index].action == "new")
end

--- Handle keyboard input while the main menu is active.
-- @param key string Name of the pressed key.
local function handle_menu_key(key)
    if key == "up" then
        menu_index = menu_index - 1
        if menu_index < 1 then
            menu_index = #menu_items
        end
    elseif key == "down" then
        menu_index = menu_index + 1
        if menu_index > #menu_items then
            menu_index = 1
        end
    elseif key == "return" or key == "kpenter" then
        activate_menu_item(menu_index)
    elseif key == "n" then
        start_game(true)
    elseif key == "c" then
        start_game(false)
    end
end

--- Handle mouse input while the main menu is active.
-- @param x number Mouse x coordinate.
-- @param y number Mouse y coordinate.
-- @param button number Mouse button number.
local function handle_menu_mouse(x, y, button)
    if button ~= 1 then
        return
    end

    for i in ipairs(menu_items) do
        local item_x, item_y, item_width, item_height = get_menu_item_bounds(i)
        if point_in_rect(x, y, item_x, item_y, item_width, item_height) then
            activate_menu_item(i)
            return
        end
    end
end

--- Create the main game context.
-- The returned table acts as a shared runtime container for the systems that
-- need to communicate with each other during play.
--
-- Fields created here:
-- * `grill`: screen and tile grid configuration.
-- * `audio`: music manager.
-- * `images`: loaded spritesheets and quads.
-- * `interface`: shared drawing helpers for menus, dialogs, and panels.
-- * `maps`: map registry and map transition logic.
-- * `player`: player entity and inventory.
-- * `chat`: dialog box state and rendering.
-- @return table The initialized game context.
local function Boss()
    local boss = {}
    boss.grill = Grill()
    boss.audio = Audio()
    boss.interface = Interface(boss)
    boss.images = Images(boss.grill)
    boss.maps = Maps(boss)
    boss.player = Player(boss)
    boss.chat = Chat(boss.interface)
    return boss
end

--- LOVE callback called once when the game starts.
-- Initializes the shared game context and leaves the player on the main menu.
function love.load()
    love.window.setTitle("The world of Arcadia")
    boss = Boss()
    menu_logo = love.graphics.newImage("img/logo.png")
end

--- LOVE callback called every frame before drawing.
-- Updates the player, all active sprites in the current map group, and the
-- dialog system.
-- @param dt number Seconds elapsed since the previous frame.
function love.update(dt)
    if game_state == "menu" then
        return
    end

    boss.player.update(dt)
    boss.group.update(dt)
    boss.chat.update(dt)
end

--- LOVE callback called every frame after update.
-- Draws the menu or, during gameplay, the map group, player, and dialog.
function love.draw()
    if game_state == "menu" then
        draw_menu()
        return
    end

    boss.group.draw()
    boss.player.draw()
    boss.chat.draw()
end

--- LOVE callback called when the game is closing.
-- Persists the current game state only after gameplay has started.
function love.quit()
    if game_started then
        Save(boss)
        print("saved")
    end
end

--- LOVE callback called when a key is pressed.
-- Handles global commands, player commands, debug output, and dialog advance.
--
-- Current bindings:
-- * `escape`: quit the game.
-- * `i`: toggle inventory.
-- * `w`: shoot an arrow.
-- * `e`: print arrow group debug information.
-- * `space`: advance dialog when chat is active.
-- * `q`: interact with the tile in front of the player when chat is inactive.
-- Menu bindings:
-- * `up` / `down`: change selected menu item.
-- * `return`: activate selected menu item.
-- * `n`: start a new game.
-- * `c`: continue from the current save.
-- @param key string Name of the pressed key.
function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end

    if game_state == "menu" then
        handle_menu_key(key)
        return
    end

    if key == "i" then
        boss.player.inventory.show()
    end
    if key == "w" then
        boss.player.shot()
    end
    if key == "e" then
        boss.group.show("arrow")
    end
    if boss.chat.activate then
        if key == "space" then
            boss.chat.next()
        end
    else
        if key == "q" then
            boss.player.action()
        end
    end

end

--- LOVE callback called when a mouse button is pressed.
-- Handles main menu selection by click before gameplay starts.
-- @param x number Mouse x coordinate.
-- @param y number Mouse y coordinate.
-- @param button number Mouse button number.
function love.mousepressed(x, y, button)
    if game_state == "menu" then
        handle_menu_mouse(x, y, button)
    end
end
