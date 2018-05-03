-- lever.lua

function Lever(boss,properties)

	local grill = boss.grill
	local spritesheet = boss.images["sprites"]
	local properties = properties
  local frame = 1

	local lever = {
    name = "lever",
    datasheed = properties.datasheet,
		x = properties.coord_x,
		y = properties.coord_y
	}

	function lever.draw()
		spritesheet.draw_image(lever.x*grill.tile,lever.y*grill.tile,spritesheet.quads["lever"][properties.code][frame])
	end

  function lever.touch()
		frame = frame + 1
    if frame == 4 then frame = 1 end
	end

	return lever
end

return Lever
