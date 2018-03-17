local Images = require("spritesheet") 

function Player(name,type)
	local name = name
	local images = Images(name,type)
	local player = {}
	local current_frame = 0
	local anim = images.stand.right[current_frame]
	local delta = 0
	local x = 0
	local y = 100
	local speed = 5

	function draw()
		love.graphics.draw(images.image, anim[current_frame], x, y,0,4,4)
	end

	local total_delay = 0
	function update(dt)
		delta = 0
		total_delay = total_delay + dt
		if total_delay > 0.1 then
			current_frame = (current_frame+1)%(table.getn(anim)+1)
			total_delay = 0
		end
		if love.keyboard.isDown("left") then
			delta = delta - speed
			anim = images.walk.left
		elseif love.keyboard.isDown("right") then
			delta = delta + speed
			anim = images.walk.right
		else
			current_frame = 0
			anim = images.stand.right
		end
		x = delta + x
	end


	player.draw = draw
	player.update = update

	return player
end

return Player

