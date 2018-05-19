-- chest.lua

function Chest(boss,properties, name_map)

	local grill = boss.grill
	local spritesheet = boss.images["chest"]

	local time = 0
	local frame = 1
	local speed = 0.05
	local dframe = 1

	local chest = {
    name = "chest",
		x = properties.coord_x,
		y = properties.coord_y
	}

	function get_data_sheet(name_map)
		local data_list = require("datasheets/" .. name_map)
		for i,datasheet in ipairs(data_list) do
			if datasheet.name == properties.datasheet
			then return datasheet end
		end
	end

	local datasheet = get_data_sheet(name_map)

	function chest.draw()
		spritesheet.draw_image(chest.x*grill.tile,chest.y*grill.tile,spritesheet.quads[properties.code][frame])
	end

	function chest.touch()
		if datasheet.unlocked then
			activate = true
			dframe = 1
			boss.chat.write("cassa",datasheet.message.open)
			boss.chat.show()
		else
			boss.chat.write("cassa",datasheet.message.lock)
			boss.chat.show()
		end
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
