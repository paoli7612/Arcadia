-- floor.lua

function Floor(boss,x,y,properties)

	local grill = boss.grill
	local spritesheet = boss.images["basictiles"]
	local properties = properties

	local floor = {
    name = "floor",
		x = x,
		y = y,
		code = properties.code
	}

	function floor.draw()
		spritesheet.draw_image(floor.x*grill.tile,floor.y*grill.tile,spritesheet.quads["floor"][floor.code])
	end

	return floor
end

return Floor
