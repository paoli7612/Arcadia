-- grill
function Grill()
	love.window.setFullscreen(true)
	maxWidth = love.graphics.getWidth()-100
	maxHeight = love.graphics.getHeight()-100
	local grill = {
		tile_w = 40,
		tile_h = 25,
		tile = math.floor(maxHeight/25)	-- change if your monitor is too small
	}
	print(grill.tile)
	grill.WIDTH = grill.tile_w*grill.tile
	grill.HEIGHT = grill.tile_h*grill.tile
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
