-- grill
function Grill()
	local grill = {
		w = 800,
		h = 800,
		tile = 50
	}
	love.window.setMode( grill.w, grill.h )

	function grill.draw()
		love.graphics.setColor(0, 100, 255)
		for y=0,grill.h,grill.tile do 
			love.graphics.line(0, y, grill.w, y)
		end
		for x=0,grill.w,grill.tile do
			love.graphics.line(x, 0, x, grill.h)
		end
	end

	return grill
end

return Grill
