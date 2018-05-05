-- wall.lua

function Wall(boss,properties)

	local grill = boss.grill
	local spritesheet = boss.images["wall"]
	local properties = properties

	local wall = {
    name = "wall",
		x = properties.coord_x,
		y = properties.coord_y,
		code = properties.code
	}
	function wall.draw()
		spritesheet.draw_image(wall.x*grill.tile, wall.y*grill.tile, spritesheet.quads[wall.code])
	end

	return wall
end

return Wall
