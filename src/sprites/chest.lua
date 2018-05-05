-- chest.lua

function Chest(boss,properties)

	local grill = boss.grill
	local spritesheet = boss.images["chest"]
	local properties = properties
	local time = 0
	local frame = 1
	local speed = 0.1

	local chest = {
    name = "chest",
		x = properties.coord_x,
		y = properties.coord_y
	}

	function chest.draw()
		spritesheet.draw_image(chest.x*grill.tile,chest.y*grill.tile,spritesheet.quads[properties.code][frame])
	end

  function chest.update(dt)
		time = time + dt
		if time > speed then
			frame = (frame + 1)
      if frame == 5 then frame = 1 end
			time = 0
			speed = math.random();
		end
	end

	return chest
end

return Chest
