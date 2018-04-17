-- wall.lua

function Wall(boss,x,y)
	local grill = boss.grill
	local spritesheet = boss.images["basictiles"]
	local wall = {
    name = "wall",
		x=x,
		y=y,
		size=grill.tile
	}
	function wall.draw()
		spritesheet.draw_image(wall.x*wall.size,wall.y*wall.size,spritesheet.quads["wall"]["blue"][1])
	end

	return wall
end

return Wall
