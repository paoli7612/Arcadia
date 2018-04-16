-- grill
function Grill()
	local grill = {
		WIDTH = 800,
		HEIGHT = 800,
		tile = 50,
	}
	grill.tile_w = grill.WIDTH/grill.tile
	grill.tile_h = grill.HEIGHT/grill.tile
	love.window.setMode( grill.WIDTH, grill.HEIGHT )

	function grill.draw()
		love.graphics.setColor(0, 100, 255)
		for y=0,grill.HEIGHT,grill.tile do
			love.graphics.line(0, y, grill.WIDTH, y)
		end
		for x=0,grill.WIDTH,grill.tile do
			love.graphics.line(x, 0, x, grill.HEIGHT)
		end
	end

	return grill
end

return Grill
