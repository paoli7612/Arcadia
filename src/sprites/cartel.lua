-- cartel.lua

function Cartel(boss,properties)
	local grill = boss.grill
	local spritesheet = boss.images["basictiles"]
	local time = 0
	local speed = 2

	local cartel = {
    name = "cartel",
		activate = false,
		x=properties.coord_x,
		y=properties.coord_y,
	}

	function cartel.draw()
		spritesheet.draw_image(cartel.x*grill.tile,cartel.y*grill.tile,spritesheet.quads["cartel"][properties.code])
		if cartel.activate then love.graphics.print(properties.text, cartel.x*grill.tile,cartel.y*grill.tile) end
	end

	function cartel.touch()
		cartel.activate = true
		cartel.time = 0
	end

	function cartel.update(dt)
		if cartel.activate then
			time = time + dt
			if time > speed then
				cartel.activate = false
			end
		end

	end

	return cartel
end

return Cartel
