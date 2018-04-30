Font = require("font")

function Chat(boss)
  local chat = {activate = false}
  local time = 0
  local speed = 4
  local grill = boss.grill
  local frame = 1
  local current_lines = {}
  -- local font = Font(boss)

  function chat.draw()
    if chat.activate then
      love.graphics.setColor(200,200,200)
      love.graphics.rectangle("fill", 0, 0, grill.WIDTH, grill.tile*2,0,2,2)
      love.graphics.setColor(255,0,0)
      love.graphics.print(current_title, 0, 0,0,2,2)
      love.graphics.setColor(0,0,0)
      love.graphics.print(current_lines[frame], grill.tile, grill.tile,0,2,2)
      love.graphics.setColor(255,255,255)
    end
  end

  function chat.write(title,lines)
    current_lines = lines
    current_title = title
  end

  function chat.show()
    chat.activate = not chat.activate
  end

  function chat.next()
    if chat.activate then
      frame = frame + 1
      if frame > table.getn(current_lines) then
        chat.activate = false
        frame = 1 end
    end
  end

  function chat.update(dt)
    time = time + dt
		if time > speed then
			time = 0
		end
  end


  return chat
end
return Chat
