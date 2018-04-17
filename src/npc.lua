-- npc.lua

function Npc(grill,x,y,properties)
	local npc = grill
	local npc = {
    name = "npc",
		x=x,
		y=y,
		size=grill.tile,
		properties = properties
	}

	function npc.draw()
		--love.graphics.setColor(0, 0, 255)
		love.graphics.rectangle("fill", npc.x*npc.size, npc.y*npc.size, npc.size, npc.size)
	end

	return npc
end

return Npc
