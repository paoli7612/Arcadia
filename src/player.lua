local Images = require("spritesheet")

local ACC = 0.8
local FRICTION = -0.12
local GRAV = 1.5

function Player(name,type)
	local name = name
	local images = Images(name,type)
	local player = {}
	local current_frame = 0
	local anim = images.stand
	local delta = 0
	local direction = "right"
	local pos = {x=0, y=0}
	local vel = {x=0, y=0}
	local acc = {x=0, y=0}

	function draw()
		love.graphics.draw(images.image, anim[current_frame], pos.x, pos.y,0,4,4)
	end

	local total_delay = 0
	function update(dt)
		acc.x = 0
		if pos.y < 100 then acc.y = GRAV
		else acc.y = 0 end
		total_delay = total_delay + dt
		if total_delay > 0.1 then
			current_frame = (current_frame+1)%(table.getn(anim)+1)
			total_delay = 0
		end
		if love.keyboard.isDown("left") then
			acc.x = -ACC
			direction = "left"
		elseif love.keyboard.isDown("right") then
			acc.x = ACC
			direction = "right"
		end
		acc.x = acc.x + vel.x * FRICTION
		acc.y = acc.y + vel.y * FRICTION
		vel.x = vel.x + acc.x
		vel.y = vel.y + acc.y
		pos.x = pos.x + vel.x + 0.5*acc.x
		pos.y = pos.y + vel.y + 0.5*acc.y
		if math.abs(vel.x) < 0.7 then
			vel.x = 0
			anim = images.stand[direction]
			current_frame = 0
		end
		if math.abs(vel.x) > 0 then
			anim = images.walk[direction]
		end
	end

	function jump()
		vel.y = vel.y - 60
	end

	player.draw = draw
	player.update = update
	player.jump = jump

	return player
end

return Player
