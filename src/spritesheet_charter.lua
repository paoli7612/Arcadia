function Images(name,type)
	local spritesheet = {}
	spritesheet.image = love.graphics.newImage("img/characters/" .. name .. "/" .. type .. ".png")
	function load_image(x,y)
		return love.graphics.newQuad(x*48,y*48,48,48, spritesheet.image:getDimensions())
	end

	-- STANDING
	spritesheet.stand = {}
	spritesheet.stand["right"] = {}
	spritesheet.stand["left"] = {}
	spritesheet.stand["right"][0] = load_image(0,1)
	spritesheet.stand["left"][0] = load_image(0,0)

	-- WALKING
	spritesheet.walk = {}
	spritesheet.walk["right"] = {}
	spritesheet.walk["left"] = {}
	spritesheet.walk["right"][0] = load_image(1,1)
	spritesheet.walk["right"][1] = load_image(2,1)
	spritesheet.walk["right"][2] = load_image(3,1)
	spritesheet.walk["left"][0] = load_image(1,0)
	spritesheet.walk["left"][1] = load_image(2,0)
	spritesheet.walk["left"][2] = load_image(3,0)

	return spritesheet
end

return Images
