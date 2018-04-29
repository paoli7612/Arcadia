-- npc.lua

function Npc(boss,properties)
	local grill = boss.grill
	local boss = boss
	local spritesheet = boss.images["sprites"]
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
	}

	function npc.draw()
		spritesheet.draw_image(npc.x*grill.tile,npc.y*grill.tile,spritesheet.quads["npc"][properties.code][direction]["stand"][1])
	end

	function npc.speak()
		-- have a collision with player
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
