-- npc.lua

function Npc(boss,properties)
	local grill = boss.grill
	local spritesheet = boss.images["characters"]
	local npc = {
    name = "npc",
		x=properties.coord_x,
		y=properties.coord_y,
		size=grill.tile,
		properties = properties
	}

	function npc.draw()
		spritesheet.draw_image(npc.x*npc.size,npc.y*npc.size,spritesheet.quads[npc.properties.type]["down"]["stand"])
	end

	return npc
end

return Npc
