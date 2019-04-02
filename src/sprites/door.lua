-- door.lua

function Door(boss, properties)

	local grill = boss.grill
	local spritesheet = boss.images["door"]

	local door = {
    name = "door",
		x = properties.coord_x,
		y = properties.coord_y,
		id = properties.id,
		open = true,
		door_prop = properties
	}

	function door.draw()
		spritesheet.draw_image(door.x*grill.tile,door.y*grill.tile,spritesheet.quads[properties.code])
	end

	function door.touch()
		boss.chat.write("Porta per",{properties.dest})
		boss.chat.show()
	end

	return door
end

return Door
