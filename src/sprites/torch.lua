-- torch.lua

function Torch(boss,properties)

	local grill = boss.grill
	local spritesheet = boss.images["torch"]
	local properties = properties
	local time = 0
	local frame = 1
	local speed = 0.1

	local torch = {
    name = "torch",
		x = properties.coord_x,
		y = properties.coord_y
	}

	function torch.draw()
		spritesheet.draw_image(torch.x*grill.tile,torch.y*grill.tile,spritesheet.quads[properties.code][frame])
	end

  function torch.update(dt)
		time = time + dt
		if time > speed then
			frame = (frame + 1)
      if frame == 4 then frame = 1 end
			time = 0
			speed = math.random();
		end
	end

	return torch
end

return Torch
