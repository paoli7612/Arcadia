-- player.lua

function Player(grill)
	local grill = grill
	local player = {
		x=0,
		y=0,
		size=grill.tile
	}

	function player.draw()
		love.graphics.setColor(255, 0, 255)
  		love.graphics.rectangle("fill", player.x*player.size, player.y*player.size, player.size, player.size)
	end

	function player.update(dt)
		if love.keyboard.isDown("right") then
			player.x = player.x + 1
		elseif love.keyboard.isDown("left") then
			player.x = player.x - 1
		end
		if love.keyboard.isDown("up") then
			player.y = player.y - 1
		elseif love.keyboard.isDown("down") then
			player.y = player.y + 1
		end

		if player.x > grill.tile_w then
			player.x = 0
		end
	end

	return player
end

return Player
