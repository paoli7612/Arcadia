-- decor.lua

function Decor(boss,properties)
	local grill = boss.grill
	local spritesheet = boss.images["basictiles"]
	local decor = {
    name = "npc",
		x=properties.coord_x,
		y=properties.coord_y,
		size=grill.tile,
		properties = properties
	}

	function decor.draw()
		spritesheet.draw_image(decor.x*decor.size,decor.y*decor.size,spritesheet.quads["decor"][decor.properties.type])
	end

	return decor
end

return Decor
