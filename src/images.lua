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
    love.graphics.draw(image, quad, x, y, 0,( grill.tile / 15 ), ( grill.tile / 15 )) -- correct for float to int
  end

  return spritesheet
end

function Images(grill)
  json = require ("json")
  lines = ""
  for line in io.lines("src/img/basictiles.json") do lines = lines .. line end

  local a = json.decode(lines)
  print(a)
  print(a["wall"])
  print(a["wall"]["00001"])

  return images
end

return Images
