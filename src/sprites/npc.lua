-- npc.lua

function Npc(boss,properties)
	local grill = boss.grill
	local boss = boss
	local spritesheet = boss.images["npc"]
	local time = 0
	local direction = "down"
	local speed = 1
	local properties = properties

	local allow_x = {max = properties.coord_x + properties.allow_x,
								min = properties.coord_x - properties.allow_x}
	local allow_y = {max = properties.coord_y + properties.allow_y,
								min = properties.coord_y - properties.allow_y}

	local npc = {
    name = "npc",
		x = properties.coord_x,
		y = properties.coord_y,
		nickname = properties.nickname,
		current_quest = false
	}
	local description = require("../descriptions/" .. properties.nickname)

	function npc.draw()
		spritesheet.draw_image(npc.x*grill.tile,npc.y*grill.tile,spritesheet.quads[properties.code][direction]["stand"][1])
	end

	function npc.speak()
		if not(npc.current_quest == false) then
			-- Quest completata
				complete = true
				for i,talk in ipairs(npc.current_quest.purpose.talk) do
					if not talk.completed then complete = false end
				end
				if complete then
					boss.chat.write(npc.nickname,npc.current_quest.chat.quit)
					boss.chat.show()
					for i,quest in ipairs(description.quests) do
						if quest.name == npc.current_quest.name then quest.completed = true end
					end
					npc.current_quest = false
					return
				end
				-- Quest gia attiva
				boss.chat.write(npc.nickname,npc.current_quest.chat.state)
				boss.chat.show()
			return
		end
		-- Quest da attivare
		for i,quest in ipairs(description.quests) do
			if quest.completed == false then
				npc.current_quest = quest
				boss.player.inventory.quest_list.add(npc,npc.current_quest)
				boss.chat.write(npc.nickname,npc.current_quest.chat.start)
				boss.chat.show()
				return
			end
		end

		-- Chat random
		text = description.speak[math.random(1,table.getn(description.speak))]
		boss.chat.write(npc.nickname,text)
		boss.chat.show()
	end

	function npc.update(dt)
		npc.dx, npc.dy = 0,0

		time = time + dt
		if time > speed then
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

			speed = 1 + math.random();

			if not boss.group.collide_pair(npc,boss.player) then
				npc.x = npc.x + npc.dx
				npc.y = npc.y + npc.dy
			end
			time = 0
		end
	end

	return npc
end

return Npc
