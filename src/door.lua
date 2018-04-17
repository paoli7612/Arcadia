
function Door(boss,x,y,properties)
	local grill = boss.grill
	local spritesheet = boss.images["basictiles"]
	local door = {
    name = "door",
		x=x,
		y=y,
		size=grill.tile,
    properties = properties
	}

	function door.draw()
		spritesheet.draw_image(door.x*door.size,door.y*door.size,spritesheet.quads["door"][door.properties.type])
	end

	return door
end

return Door
