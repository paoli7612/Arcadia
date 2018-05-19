-- npc.lua

function Npc(boss,properties,name_map)
	local grill = boss.grill
	local spritesheet = boss.images["npc"]
	local time = 0
	local direction = "down"

	local allow_x = {max = properties.coord_x + properties.allow_x,
								min = properties.coord_x - properties.allow_x}
	local allow_y = {max = properties.coord_y + properties.allow_y,
								min = properties.coord_y - properties.allow_y}

	local npc = {
    name = "npc",
		name_map = name_map,
		x = properties.coord_x,
		y = properties.coord_y,
		nickname = properties.nickname,
		current_quest = false,
		chat_random = true
	}
	local ix = npc.x * grill.tile
	local iy = npc.y * grill.tile
	local speed = math.floor(grill.tile/11)
	npc.description = require("../descriptions/" .. properties.nickname)

	function npc.draw()
		spritesheet.draw_image(ix,iy,spritesheet.quads[properties.code][direction]["stand"][1])
	end

	function npc.speak(text)
		if not (text == nil) then
			boss.chat.write(npc.nickname,text)
			boss.chat.show()
			return
		end
		if not(npc.current_quest == false) then
			-- control completed missions
			for i,mission in ipairs(npc.current_quest.purpose.mission) do
				for j,completed in ipairs(boss.player.inventory.quest_list.completed) do
					if mission.quest == completed then mission.completed = true print("mission completed = true") end
				end
			end
			-- Quest completata
				complete = true
				for i,talk in ipairs(npc.current_quest.purpose.talk) do
					if not talk.completed then complete = false end
				end
				for i,mission in ipairs(npc.current_quest.purpose.mission) do
					if not mission.completed then complete = false end
				end

				if complete then
					boss.chat.write(npc.nickname,npc.current_quest.chat.quit)
					boss.chat.show()
					for i,quest in ipairs(npc.description.quests) do
						if quest.name == npc.current_quest.name then quest.completed = true end
					end
					boss.player.inventory.quest_list.del(npc.current_quest.name)
					boss.player.inventory.attr.add_exp(npc.current_quest.reward.exp)
					boss.player.inventory.attr.add_money(npc.current_quest.reward.money)
					food = npc.current_quest.reward.food
					if food then boss.player.add_food(food) end
					npc.current_quest = false
					return
				end
				-- Quest gia attiva
				boss.chat.write(npc.nickname,npc.current_quest.chat.state)
				boss.chat.show()
			return
		end
		-- Quest da attivare
		for i,quest in ipairs(npc.description.quests) do
			if quest.completed == false then
				npc.current_quest = quest
				if boss.player.inventory.quest_list.add(npc,npc.current_quest) then
					boss.chat.write(npc.nickname,npc.current_quest.chat.start)
					boss.chat.show()
					return
				else
					for i,quest in ipairs(npc.description.quests) do
						if quest.name == npc.current_quest.name then quest.completed = true end
					end
					npc.current_quest = false end
			end
		end

		-- Chat random
		text = npc.description.speak[math.random(1,table.getn(npc.description.speak))]
		boss.chat.write(npc.nickname,text)
		boss.chat.show()
	end

	function npc.update(dt)
		if not boss.chat.activate then
			npc.dx, npc.dy = 0,0
			time = time + dt
			if time > (1 + math.random()) then
				p = love.math.random(6) -- 1 stop 2 right 3 left 4 up 5 down 6 stop
				if p == 2 and npc.x + 1 <= allow_x.max then
						npc.dx = 1
						direction = "right"
				elseif p == 3 and npc.x - 1 >= allow_x.min then
						npc.dx = -1
						direction = "left"
				elseif p == 4 and npc.y + 1 <= allow_y.max then
						npc.dy = 1
						direction = "down"
				elseif p == 5 and npc.y - 1 >= allow_y.min then
						npc.dy = -1
						direction = "up"
				end

				if not boss.group.collide_pair(npc,boss.player) then
					npc.x = npc.x + npc.dx
					npc.y = npc.y + npc.dy
				end

				time = 0
			end

			mx = npc.x*grill.tile
			my = npc.y*grill.tile
			if (math.abs(mx-ix) < speed) then ix = mx end
			if (math.abs(my-iy) < speed) then iy = my end
			if ix < mx then	ix = ix + speed	end
			if ix > mx then	ix = ix - speed	end
			if iy < my then	iy = iy + speed	end
			if iy > my then	iy = iy - speed	end
		end
	end

	return npc
end

return Npc
