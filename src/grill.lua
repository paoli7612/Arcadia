-- grill
function Grill()

	local grill = {}

	function grill.draw()
		love.graphics.setColor(0, 100, 255)
		for y=0,HEIGHT,tile do
			love.graphics.line(0, y, WIDTH, y)
		end
		for x=0,WIDTH,tile do
			love.graphics.line(x, 0, x, HEIGHT)
		end
	end

	return grill
end

return Grill
