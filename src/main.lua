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

local Player = require("sprites/player")

local Save = require("save")
local Load = require("load")

local boss

--- Create the main game context.
-- The returned table acts as a shared runtime container for the systems that
-- need to communicate with each other during play.
--
-- Fields created here:
-- * `grill`: screen and tile grid configuration.
-- * `audio`: music manager.
-- * `images`: loaded spritesheets and quads.
-- * `maps`: map registry and map transition logic.
-- * `player`: player entity and inventory.
-- * `chat`: dialog box state and rendering.
-- @return table The initialized game context.
local function Boss()
    local boss = {}
    boss.grill = Grill()
    boss.audio = Audio()
    boss.images = Images(boss.grill)
    boss.maps = Maps(boss)
    boss.player = Player(boss)
    boss.chat = Chat(boss.grill)
    return boss
end

--- LOVE callback called once when the game starts.
-- Initializes the shared game context, then restores the saved player,
-- map, attributes, and quest state.
function love.load()
    boss = Boss()
    Load(boss)
end

--- LOVE callback called every frame before drawing.
-- Updates the player, all active sprites in the current map group, and the
-- dialog system.
-- @param dt number Seconds elapsed since the previous frame.
function love.update(dt)
    boss.player.update(dt)
    boss.group.update(dt)
    boss.chat.update(dt)
end

--- LOVE callback called every frame after update.
-- Draws the current map group first, then the player, then any active dialog.
function love.draw()
    boss.group.draw()
    boss.player.draw()
    boss.chat.draw()
end

--- LOVE callback called when the game is closing.
-- Persists the current game state through the save module.
function love.quit()
    Save(boss)
    print("saved")
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
-- @param key string Name of the pressed key.
function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
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
