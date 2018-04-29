-- decor.lua

function Decor(boss,properties)

	local grill = boss.grill
	local spritesheet = boss.images["sprites"]
	local properties = properties

	local decor = {
    name = "decor",
		x = properties.coord_x,
		y = properties.coord_y,
	}

	function decor.draw()
		spritesheet.draw_image(decor.x*grill.tile,decor.y*grill.tile,spritesheet.quads["decor"][properties.code])
	end

	return decor
end

return Decor
