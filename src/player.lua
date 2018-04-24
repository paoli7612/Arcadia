-- player.lua

function Player(boss,x,y)
	local grill = boss.grill
	local boss = boss
	local spritesheet = boss.images["characters"]
	local time = 0

	local direction = "down"
	local position = "stand"
	local frame = 1
	local speed = 0.1

	local player = {
		name = "player",
		x=x,
		y=y,
	}

	function player.draw()
		spritesheet.draw_image(player.x*grill.tile, player.y*grill.tile, spritesheet.quads["barra"][direction][position][frame])
	end

	function player.update(dt)
		time = time + dt
		if time > speed then
			move()
			time = 0
		end
	end

	function move()
		player.dx, player.dy = 0,0
		position = "walk"
		if love.keyboard.isDown("right") then
			player.dx = 1
			direction = "right"
		elseif love.keyboard.isDown("left") then
			player.dx = -1
			direction = "left"
		elseif love.keyboard.isDown("up") then
			player.dy = -1
			direction = "up"
		elseif love.keyboard.isDown("down") then
			player.dy = 1
			direction = "down"
		else
			position = "stand"
		end

		-- control coord for write maps
		if love.keyboard.isDown("q") then print(player.x, player.y) end

		if not boss.group.collide(player) then
			player.x = player.x + player.dx
			player.y = player.y + player.dy
		end

		if position == "walk" then
			frame = (frame + 1)
			if frame == 3 then frame = 1 end
		else frame = 1 end
	end

	return player
end

return Player
