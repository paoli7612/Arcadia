local Images = require("spritesheet_charter")


local ACC = 0.8
local FRICTION = -0.12
local GRAV = 1.5

function Player(name, type)
  local player = {}
  -- images
  local name = name
  local images = Images(name,type)
  local anim = images.stand
  -- vectors
  local pos = {x=0, y=0}
  local vel = {x=0, y=0}
  local acc = {x=0, y=0}

  function player.event()
    if love.keyboard.isDown("left") then acc.x = -ACC end
    if love.keyboard.isDown("right") then acc.x = ACC end
  end

  function player.update()
    acc.x = 0
    player.event()
    acc.x = acc.x + vel.x * FRICTION
		vel.x = vel.x + acc.x
		pos.x = pos.x + vel.x + 0.5*acc.x
  end

  function player.draw()
    love.graphics.draw(images.image, anim["right"][0], pos.x, pos.y,0,4,4)
  end

  function player.jump()
    acc.y = acc.y - 50
  end
  return player
end
return Player
