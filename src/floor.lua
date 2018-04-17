-- wall.lua

function Floor(boss,x,y,properties)
	local grill = boss.grill
	local spritesheet = boss.images["basictiles"]
	local floor = {
    name = "floor",
		x = x,
		y = y,
		size = grill.tile,
		properties = properties
	}
	function floor.draw()
		spritesheet.draw_image(floor.x*floor.size,floor.y*floor.size,spritesheet.quads["floor"][properties.bloke][properties.type])
	end

	return floor
end

return Floor
