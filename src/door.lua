
function Door(grill,x,y,properties)
	local grill = grill

	local door = {
    name = "door",
		x=x,
		y=y,
		size=grill.tile,
    properties = properties
	}

	function door.draw()
		love.graphics.setColor(255, 255, 0)
		love.graphics.rectangle("fill", door.x*door.size, door.y*door.size, door.size, door.size)
	end

	return door
end

return Door
