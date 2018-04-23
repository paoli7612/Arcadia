-- torch.lua

function Torch(boss,properties)
	local grill = boss.grill
	local spritesheet = boss.images["things"]
  local time = 0
	local torch = {
    name = "torch",
    speed = 0.1,
		x=properties.coord_x,
		y=properties.coord_y,
		size=grill.tile,
		properties = properties,
    frame = 1
	}

	function torch.draw()
		spritesheet.draw_image(torch.x*torch.size,torch.y*torch.size,spritesheet.quads["torch"][torch.properties.color][torch.frame])
	end

  function torch.update(dt)
		time = time + dt
		if time > torch.speed then
			torch.frame = (torch.frame + 1)
      if torch.frame == 4 then torch.frame = 1 end
			time = 0
			torch.speed = math.random();
		end
	end

	return torch
end

return Torch
