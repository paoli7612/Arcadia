-- lever.lua

function Lever(boss, properties, name_map)

	local grill = boss.grill
	local spritesheet = boss.images["lever"]
	local properties = properties
  local frame = 1

	function get_data_sheet(name_map)
		local data_list = require("datasheets/" .. name_map)
		for i,datasheet in ipairs(data_list) do
			if datasheet.name == properties.datasheet
			then return datasheet end
		end
	end

	local datasheet = get_data_sheet(name_map)
	print(datasheet)
	print(datasheet.purpose)
	local lever = {
    name = "lever",
		x = properties.coord_x,
		y = properties.coord_y
	}

	function lever.draw()
		print("lever")
		spritesheet.draw_image(lever.x*grill.tile,lever.y*grill.tile,spritesheet.quads[properties.code][frame])
	end

  function lever.touch()
		frame = frame + 1
    if frame == 4 then frame = 1 end
	end

	return lever
end

return Lever
