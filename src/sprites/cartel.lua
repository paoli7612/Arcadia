-- cartel.lua

function Cartel(boss,properties)
	local grill = boss.grill
	local spritesheet = boss.images["cartel"]

	local cartel = {
    name = "cartel",
		activate = false,
		x=properties.coord_x,
		y=properties.coord_y,
	}

	function cartel.draw()
		print("cartel")
		spritesheet.draw_image(cartel.x*grill.tile,cartel.y*grill.tile,spritesheet.quads[properties.code])
	end

	function cartel.touch()
		boss.chat.write("Cartello",{properties.text})
		boss.chat.show()
	end

	return cartel
end

return Cartel
