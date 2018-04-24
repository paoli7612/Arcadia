-- floor.lua

function Floor(boss,x,y,properties)

	local grill = boss.grill
	local spritesheet = boss.images["basictiles"]
	local properties = properties

	local floor = {
    name = "floor",
		x = x,
		y = y,
	}

	function floor.draw()
		spritesheet.draw_image(floor.x*grill.tile,floor.y*grill.tile,spritesheet.quads["floor"][properties.bloke][properties.type])
	end

	return floor
end

return Floor
