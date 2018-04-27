-- cartel.lua

function Cartel(boss,properties)
	local grill = boss.grill
	local spritesheet = boss.images["basictiles"]
	local cartel = {
    name = "cartel",
		activate = false,
		time = 0,
		x=properties.coord_x,
		y=properties.coord_y,
		size=grill.tile,
		speed = 2,
		properties = properties
	}

	function cartel.draw()
		for p in pairs(spritesheet.quads["cartel"]) do print(p) end
		print(spritesheet.quads["cartel"])
		spritesheet.draw_image(cartel.x*cartel.size,cartel.y*cartel.size,spritesheet.quads["cartel"][properties.code])
		if cartel.activate then love.graphics.print(cartel.properties.text, cartel.x*cartel.size,cartel.y*cartel.size) end
	end

	function cartel.touch()
		cartel.activate = true
		cartel.time = 0
	end

	function cartel.update(dt)
		if cartel.activate then
			print(cartel.time)
			cartel.time = cartel.time + dt
			if cartel.time > cartel.speed then
				cartel.activate = false
			end
		end

	end

	return cartel
end

return Cartel
