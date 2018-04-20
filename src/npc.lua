-- npc.lua

function Npc(boss,properties)
	local grill = boss.grill
	local boss = boss
	local spritesheet = boss.images["characters"]
	local time = 0
	local npc = {
    name = "npc",
		direction = "down",
		speed = 1,
		x = properties.coord_x,
		y = properties.coord_y,
		allow_x = {max = properties.coord_x + properties.offset_x, min = properties.coord_x - properties.offset_x},
		allow_y = {max = properties.coord_y + properties.offset_y, min = properties.coord_y - properties.offset_y},
		size=grill.tile,
		properties = properties
	}

	function npc.draw()
		spritesheet.draw_image(npc.x*npc.size,npc.y*npc.size,spritesheet.quads[npc.properties.type][npc.direction]["stand"][1])
	end

	function npc.update(dt)
		npc.dx, npc.dy = 0,0

		time = time + dt
		if time > npc.speed then
			p = love.math.random(6) -- 1 stop 2 right 3 left 4 up 5 down 6 stop
			if p == 2 and npc.x + 1 <= npc.allow_x.max then
					npc.dx = 1
					npc.direction = "right"
			elseif p == 3 and npc.x - 1 >= npc.allow_x.min then
					npc.dx = -1
					npc.direction = "left"
			elseif p == 4 and npc.y + 1 <= npc.allow_y.max then
					npc.dy = 1
					npc.direction = "down"
			elseif p == 5 and npc.y - 1 >= npc.allow_y.min then
					npc.dy = -1
					npc.direction = "up"
			end

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
