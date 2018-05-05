-- chest.lua

function Chest(boss,properties)

	local grill = boss.grill
	local spritesheet = boss.images["chest"]
	local properties = properties
	local time = 0
	local frame = 1
	local speed = 0.05
	local dframe = 1
	local chest = {
    name = "chest",
		x = properties.coord_x,
		y = properties.coord_y
	}

	function chest.draw()
		spritesheet.draw_image(chest.x*grill.tile,chest.y*grill.tile,spritesheet.quads[properties.code][frame])
	end

	function chest.touch()
		activate = true
		dframe = 1
	end

  function chest.update(dt)
		if activate then
			time = time + dt
			if time > speed then
				frame = (frame + dframe)
	      if frame == 3 then dframe = -1 end
				if frame == 0 then
					activate = false
					frame = 1
				end
				time = 0
			end
		end
	end

	return chest
end

return Chest
