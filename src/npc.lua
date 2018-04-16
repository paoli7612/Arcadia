-- wall.lua

function Npc(grill,x,y)
	local npc = grill
	local npc = {
    name = "npc",
		x=x,
		y=y,
		size=grill.tile
	}
	function npc.draw()
		love.graphics.setColor(0, 0, 255)
		love.graphics.rectangle("fill", npc.x*npc.size, npc.y*npc.size, npc.size, npc.size)
	end

	return npc
end

return Npc
