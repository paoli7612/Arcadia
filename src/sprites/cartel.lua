-- cartel.lua

function Cartel(boss,properties)
	local spritesheet = boss.images["cartel"]

	local cartel = {
    	name = "cartel",
		activate = false,
		x=properties.coord_x,
		y=properties.coord_y,
	}

	function cartel.draw()
		spritesheet.draw_image(cartel.x*tile,cartel.y*tile,spritesheet.quads[properties.code])
	end

	function cartel.touch()
		boss.chat.write("Cartello",{properties.text})
		boss.chat.show()
	end

	return cartel
end

return Cartel
