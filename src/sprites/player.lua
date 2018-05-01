-- player.lua

Inventory = require("inventory")
Food = require("sprites/items/food")

function Player(boss,x,y)
	local grill = boss.grill
	local boss = boss

	local spritesheet = boss.images["sprites"]
	for a in pairs(spritesheet.quads) do
		print(a)
	end
	local time = 0

	local direction = "down"
	local position = "stand"
	local frame = 1
	local speed = 0.1

	local player = {
		name = "player",
		x=x,
		y=y,
		inventory = Inventory(boss)
	}
	player.inventory.add(Food(boss,"B0001"))
	function player.draw()
		spritesheet.draw_image(player.x*grill.tile, player.y*grill.tile, spritesheet.quads["npc"]["60001"][direction][position][frame])
		player.inventory.draw()
	end

	function player.update(dt)
		if not boss.chat.activate then
			time = time + dt
			if time > speed then
				move()
				time = 0
			end
		end
	end

	function player.action()
		x = player.x
		y = player.y
		if direction == "right" then x = x+1
		elseif direction == "left" then x = x-1
		elseif direction == "up" then y = y-1
		elseif direction == "down" then y = y+1 end
		element = boss.group.get_position(x,y)
		if not(element == nil) then
			if element.name == "npc" then
				element.speak()
				boss.player.inventory.quest_list.talk(element)
			end
			if element.name == "cartel" then element.touch() end
			if element.name == "door" then element.touch() end
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
