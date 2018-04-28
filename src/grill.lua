-- grill
function Grill()
	local grill = {
		tile_w = 40,
		tile_h = 25,
		tile = 38,	-- change if your monitor is too small
	}
	grill.WIDTH = grill.tile_w*grill.tile
	grill.HEIGHT = grill.tile_h*grill.tile
	print(grill.tile_w)
	print(grill.tile_h)
	love.window.setMode( grill.WIDTH, grill.HEIGHT )

	function grill.draw()
		--.love.graphics.setColor(0, 100, 255)
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
