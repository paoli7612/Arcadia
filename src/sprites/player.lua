-- player.lua

Inventory = require("gui/inventory")
Food = require("sprites/items/food")
Sword = require("sprites/items/sword")
Bow = require("sprites/items/bow")
Arrow = require("sprites/arrow")

function Player(boss,x,y)

	local spritesheet = boss.images["npc"]

	local direction = "down"
	local position = "stand"
	local frame = 1

	local player = {
		name = "player",
		x=x,
		y=y,
		inventory = Inventory(boss)
	}
	local ix = player.x * boss.grill.tile
	local iy = player.y * boss.grill.tile

	local speed = math.floor(boss.grill.tile/8)
	local moving = true


	b = Bow(boss,"C0002")
	player.inventory.add(b)
	player.inventory.equip(b)

	function player.add_food(code)
		player.inventory.add(Food(boss,code))
	end

	function player.draw()
		spritesheet.draw_image(ix,iy, spritesheet.quads["60001"][direction][position][frame])
		player.inventory.draw()
	end

	function player.reset_coord(x,y)
		player.x = x
		player.y = y
		ix = player.x * boss.grill.tile
		iy = player.y * boss.grill.tile
	end

	function player.update(dt)
		if not boss.chat.activate then
			if moving then
				mx = player.x*boss.grill.tile
				my = player.y*boss.grill.tile
				if (math.abs(mx-ix) < speed) then ix = mx end
				if (math.abs(my-iy) < speed) then iy = my end
				if ix < mx then	ix = ix + speed
				elseif ix > mx  then	ix = ix - speed
				elseif iy < my then	iy = iy + speed
				elseif iy > my then	iy = iy - speed
				else moving = false end
			end
			if not moving then move() end
		end
	end

	function player.shot()
		a = Arrow(boss, "D0001", player.x, player.y, direction)
		boss.group.add(a)
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
				text = boss.player.inventory.quest_list.talk(element)
				element.speak(text)
			end
			if element.name == "cartel" then element.touch() end
			if element.name == "door" then element.touch() end
			if element.name == "lever" then element.touch() end
			if element.name == "chest" then element.touch() end
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
			moving = true
		end

		if position == "walk" then
			frame = (frame + 1)
			if frame == 3 then frame = 1 end
		else frame = 1 end
	end

	return player
end

return Player
