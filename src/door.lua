-- door.lua

function Door(boss, properties)

	local grill = boss.grill
	local spritesheet = boss.images["basictiles"]
	local properties = properties

	local door = {
    name = "door",
		x = properties.coord_x,
		y = properties.coord_y,
	}

	function door.draw()
		spritesheet.draw_image(door.x*grill.tile,door.y*grill.tile,spritesheet.quads["door"][properties.type])
	end

	return door
end

return Door
