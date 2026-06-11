--- Shared interface drawing helpers for Arcadia.
-- This module centralizes the visual language used by menus, dialogs,
-- messages, and inventory panels.
-- @module interface

--- Create the interface manager.
-- @param boss table Main game context.
-- @return table Interface manager.
local function Interface(boss)
    local interface = {}
    local grill = boss.grill

    local colors = {
        background = {0.08, 0.08, 0.12},
        panel = {0.16, 0.16, 0.22},
        panel_selected = {0.35, 0.32, 0.12},
        border = {0.9, 0.9, 0.9},
        text = {1, 1, 1},
        muted = {0.65, 0.65, 0.65},
        dialog = {0.10, 0.10, 0.15},
        dialog_header = {0.24, 0.22, 0.08},
        dialog_title = {1, 0.95, 0.55},
        dialog_text = {0.95, 0.95, 0.95}
    }

    local function set_color(color)
        love.graphics.setColor(color[1], color[2], color[3])
    end

    --- Draw a filled rectangle with a border.
    -- @param x number Rectangle x coordinate.
    -- @param y number Rectangle y coordinate.
    -- @param width number Rectangle width.
    -- @param height number Rectangle height.
    -- @param fill table RGB fill color with values from 0 to 1.
    -- @param border table RGB border color with values from 0 to 1.
    function interface.draw_panel(x, y, width, height, fill, border)
        set_color(fill or colors.panel)
        love.graphics.rectangle("fill", x, y, width, height)

        set_color(border or colors.border)
        love.graphics.rectangle("line", x, y, width, height)

        set_color(colors.text)
    end

    --- Draw centered text with an optional scale.
    -- @param text string Text to draw.
    -- @param x number Area x coordinate.
    -- @param y number Text y coordinate.
    -- @param width number Area width.
    -- @param scale number Optional text scale.
    -- @param color table Optional RGB text color.
    function interface.draw_centered_text(text, x, y, width, scale, color)
        scale = scale or 1
        local text_width = love.graphics.getFont():getWidth(text) * scale
        local text_x = x + (width - text_width) / 2

        set_color(color or colors.text)
        love.graphics.print(text, text_x, y, 0, scale, scale)
        set_color(colors.text)
    end

    --- Draw one menu button.
    -- @param label string Button label.
    -- @param x number Button x coordinate.
    -- @param y number Button y coordinate.
    -- @param width number Button width.
    -- @param height number Button height.
    -- @param selected boolean Whether the button is currently selected.
    function interface.draw_button(label, x, y, width, height, selected)
        local fill = colors.panel
        if selected then
            fill = colors.panel_selected
        end

        interface.draw_panel(x, y, width, height, fill, colors.border)
        interface.draw_centered_text(label, x, y + 10, width, 1, colors.text)
    end

    --- Draw the main menu background.
    function interface.draw_menu_background()
        set_color(colors.background)
        love.graphics.rectangle("fill", 0, 0, grill.WIDTH, grill.HEIGHT)
        set_color(colors.text)
    end

    --- Draw a dialog or short message panel.
    -- @param title string Dialog title.
    -- @param line string Current dialog line.
    function interface.draw_dialog(title, line)
        local margin = 24
        local panel_height = grill.tile * 4
        local panel_x = margin
        local panel_y = grill.HEIGHT - panel_height - margin
        local panel_width = grill.WIDTH - margin * 2
        local header_height = 28
        local text_x = panel_x + 18
        local text_y = panel_y + header_height + 18
        local text_width = panel_width - 36

        interface.draw_panel(panel_x, panel_y, panel_width, panel_height, colors.dialog, colors.border)

        set_color(colors.dialog_header)
        love.graphics.rectangle("fill", panel_x, panel_y, panel_width, header_height)

        set_color(colors.border)
        love.graphics.rectangle("line", panel_x, panel_y, panel_width, header_height)

        set_color(colors.dialog_title)
        love.graphics.print(title or "", panel_x + 12, panel_y + 6)

        set_color(colors.dialog_text)
        love.graphics.printf(line or "", text_x, text_y, text_width, "left")

        set_color(colors.text)
    end

    --- Draw the inventory panel and its item slots.
    -- @param attr table Player attributes object.
    -- @param bag table Inventory item list.
    -- @param equip table Currently equipped item.
    function interface.draw_inventory(attr, bag, equip)
        interface.draw_panel(50, 50, 200, grill.tile * 3 + 50, {0, 0, 0}, colors.border)

        attr.draw(60, 65)

        for i, item in ipairs(bag) do
            item.draw(i + 4, 2)
        end

        if equip then
            equip.draw(grill.tile_w - 1, 0)
        end

        set_color(colors.text)
    end

    return interface
end

return Interface
