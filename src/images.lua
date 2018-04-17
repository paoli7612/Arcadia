function Spritesheet(grill, type)
  local spritesheet = {
    quads = {}
  }
  local grill = grill
  local image = love.graphics.newImage("img/" .. type .. ".png")

  function get_image(x,y)
    return love.graphics.newQuad(x*16, y*16, 16, 16, image:getDimensions())
  end

  function spritesheet.draw_image(x,y,quad)
    love.graphics.draw(image, quad, x, y, 0,( grill.tile / 16 ), ( grill.tile / 16 ))
  end

  if type == "characters" then
    spritesheet.quads["down"] = {}
    spritesheet.quads["down"]["stand"] = get_image(1,0)
    spritesheet.quads["down"]["walk"] = {get_image(0,0),get_image(2,0)}

    spritesheet.quads["right"] = {}
    spritesheet.quads["right"]["stand"] = get_image(1,2)
    spritesheet.quads["right"]["walk"] = {get_image(0,2),get_image(2,2)}

    spritesheet.quads["left"] = {}
    spritesheet.quads["left"]["stand"] = get_image(1,1)
    spritesheet.quads["left"]["walk"] = {get_image(0,1),get_image(2,1)}

    spritesheet.quads["up"] = {}
    spritesheet.quads["up"]["stand"] = get_image(1,3)
    spritesheet.quads["up"]["walk"] = {get_image(0,3),get_image(2,3)}
  elseif type == "basictiles" then
    spritesheet.quads["wall"] = {}
    spritesheet.quads["wall"]["blue"] = {get_image(0,0),get_image(1,0),get_image(2,0),get_image(3,0)}
    spritesheet.quads["wall"]["red"] = {get_image(4,0),get_image(5,0),get_image(6,0),get_image(7,0)}
  end




  return spritesheet
end

function Images(grill)
  local images = {}
  images["characters"] = Spritesheet(grill,"characters")
  images["basictiles"] = Spritesheet(grill,"basictiles")
  images["things"] = Spritesheet(grill,"things")
  return images
end

return Images
