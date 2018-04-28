Font = require("font")

function Chat(boss)
  local chat = {}
  local time = 0
  local speed = 4
  local font = Font(boss)
  -- local image = love.graphics.newImage("img/chat.png")

  function chat.draw()
    if chat.activate then
      -- love.graphics.draw(image, 0,0,0,10,5)
    end
  end

  function chat.update(dt)
    time = time + dt
		if time > speed then
			time = 0
      chat.activate = false
		end
  end


  return chat
end
return Chat
