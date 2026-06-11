--- Dialog and message state.
-- Rendering is delegated to the shared interface manager.
-- @module chat

local function Chat(interface)
  local chat = {activate = false}
  local time = 0
  local speed = 4
  local frame = 1
  local current_lines = {}
  local current_title = ""

  --- Draw the active dialog panel.
  function chat.draw()
    if chat.activate then
      interface.draw_dialog(current_title, current_lines[frame])
    end
  end

  --- Replace the current dialog content.
  -- @param title string Dialog title.
  -- @param lines table Dialog lines.
  function chat.write(title,lines)
    current_lines = lines
    current_title = title
    frame = 1
  end

  --- Toggle dialog visibility.
  function chat.show()
    chat.activate = not chat.activate
  end

  --- Advance to the next dialog line.
  function chat.next()
    if chat.activate then
      frame = frame + 1
      if frame > table.getn(current_lines) then
        chat.activate = false
        frame = 1
      end
    end
  end

  --- Update dialog timers.
  -- @param dt number Seconds elapsed since the previous frame.
  function chat.update(dt)
    time = time + dt
		if time > speed then
			time = 0
		end
  end


  return chat
end
return Chat
