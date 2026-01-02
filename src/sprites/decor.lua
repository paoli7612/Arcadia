-- decor.lua

function Decor(boss,properties)

	local spritesheet = boss.images["decor"]

	local decor = {
    name = "decor",
		x = properties.coord_x,
		y = properties.coord_y,
	}

	function decor.draw()
		spritesheet.draw_image(decor.x*tile,decor.y*tile,spritesheet.quads[properties.code])
	end

	return decor
end

return Decor
