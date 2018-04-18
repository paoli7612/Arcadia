-- cartel.lua

function Cartel(boss,properties)
	local grill = boss.grill
	local spritesheet = boss.images["basictiles"]
	local cartel = {
    name = "cartel",
		x=properties.coord_x,
		y=properties.coord_y,
		size=grill.tile,
		properties = properties
	}

	function cartel.draw()
		spritesheet.draw_image(cartel.x*cartel.size,cartel.y*cartel.size,spritesheet.quads["cartel"])
	end

	return cartel
end

return Cartel
