-- water.lua

function Water(boss,properties)

	local grill = boss.grill
	local spritesheet = boss.images["basictiles"]
	local properties = properties
	local time = 0
	local frame = 1
	local speed = 0.1

	local water = {
    name = "water",
		x = properties.coord_x,
		y = properties.coord_y
	}

	function water.draw()
		spritesheet.draw_image(water.x*grill.tile,water.y*grill.tile,spritesheet.quads["water"][properties.code])
	end

  function water.update(dt)
		--[[time = time + dt
		if time > speed then
			frame = (frame + 1)
      if frame == 4 then frame = 1 end
			time = 0
			speed = math.random();
		end]]
	end

	return water
end

return Water
