-- wall.lua

function Wall(boss,x,y,properties)
	local grill = boss.grill
	local spritesheet = boss.images["basictiles"]
	local wall = {
    name = "wall",
		x = x,
		y = y,
		size = grill.tile,
		properties = properties
	}
	function wall.draw()
		spritesheet.draw_image(wall.x*wall.size,wall.y*wall.size,spritesheet.quads["wall"][properties.bloke][properties.type])
	end

	return wall
end

return Wall
