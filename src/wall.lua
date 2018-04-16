-- wall.lua

function Wall(grill,x,y)
	local grill = grill
	local wall = {
    name = "wall",
		x=x,
		y=y,
		size=grill.tile
	}
	function wall.draw()
		love.graphics.setColor(80, 80, 80)
		love.graphics.rectangle("fill", wall.x*wall.size, wall.y*wall.size, wall.size, wall.size)
	end

	return wall
end

return Wall
