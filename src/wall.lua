-- wall.lua

function Wall(boss,x,y,properties)

	local grill = boss.grill
	local spritesheet = boss.images["basictiles"]
	local properties = properties

	local wall = {
    name = "wall",
		x = x,
		y = y
	}
	function wall.draw()
		spritesheet.draw_image(wall.x*grill.tile, wall.y*grill.tile, spritesheet.quads["wall"][properties.bloke][properties.type])
	end

	return wall
end

return Wall
