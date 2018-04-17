-- player.lua


function Player(boss,x,y)
	local grill = boss.grill
	local boss = boss
	local spritesheet = boss.images["characters"]
	local time = 0

	local player = {
		name = "player",
		x=x,
		y=y,
		size=grill.tile,
		direction = "down",
		position = "stand",
		frame = 1,
		speed = 0.1
	}
	function player.draw()
		spritesheet.draw_image(player.x*player.size,player.y*player.size,spritesheet.quads["boy"][player.direction][player.position][player.frame])
	end

	function player.update(dt)
		time = time + dt
		if time > player.speed then
			player.move()
			time = 0
		end
	end

	function player.move()
		player.dx, player.dy = 0,0
		player.position = "walk"
		if love.keyboard.isDown("right") then
			player.dx = 1
			player.direction = "right"
		elseif love.keyboard.isDown("left") then
			player.dx = -1
			player.direction = "left"
		elseif love.keyboard.isDown("up") then
			player.dy = -1
			player.direction = "up"
		elseif love.keyboard.isDown("down") then
			player.dy = 1
			player.direction = "down"
		else
			player.position = "stand"
		end

		-- control coord for write maps
		if love.keyboard.isDown("q") then print(player.x, player.y) end

		if not boss.group.collide(player) then
			player.x = player.x + player.dx
			player.y = player.y + player.dy
		end

		if player.x > grill.tile_w then
			player.x = 0
		end
	end

	return player
end

return Player
