function Spritesheet(grill,type)
  local spritesheet = {
    quads = {}
  }
  local grill = grill
  local image = love.graphics.newImage("img/"..type..".png")
  local json = require("json")
  local size = 32
  function get_image(x,y)
    return love.graphics.newQuad(x*size, y*size, size, size, image:getDimensions())
  end

  function spritesheet.draw_image(x,y,quad)
    love.graphics.draw(image, quad, x, y, 0, (grill.tile/size), (grill.tile/size)) -- correct for float to int
  end

  function get_npc(x,y)
    local quads = {}
    quads["down"] = {}
    quads["down"]["stand"] = {get_image(1+x,0+y)}
    quads["down"]["walk"] = {get_image(0+x,0+y),get_image(2+x,0+y)}
    quads["right"] = {}
    quads["right"]["stand"] = {get_image(1+x,2+y)}
    quads["right"]["walk"] = {get_image(0+x,2+y),get_image(2+x,2+y)}
    quads["left"] = {}
    quads["left"]["stand"] = {get_image(1+x,1+y)}
    quads["left"]["walk"] = {get_image(0+x,1+y),get_image(2+x,1+y)}
    quads["up"] = {}
    quads["up"]["stand"] = {get_image(1+x,3+y)}
    quads["up"]["walk"] = {get_image(0+x,3+y),get_image(2+x,3+y)}
    return quads
  end
  function get_torch(x,y)
    return {get_image(x,y),get_image(1+x,y),get_image(2+x,y)}
  end
  function get_water(x,y)
    return {get_image(x,y),get_image(1+x,y),get_image(2+x,y),get_image(3+x,y)}
  end
  function get_lever(x,y)
    return {get_image(x,y),get_image(1+x,y),get_image(2+x,y)}
  end

  lines = ""
  for line in io.lines("src/img/"..type..".json") do lines = lines .. line end
  local dict = json.decode(lines)

  for d in pairs(dict) do
    code = d
    if not (code == "_") then
      x = dict[d]["x"]
      y = dict[d]["y"]
      print(x,y)
      if type == "water" then
        spritesheet.quads[code] = get_water(x, y)
      elseif type == "torch" then
        spritesheet.quads[code] = get_torch(x, y)
      elseif type == "npc" then
        spritesheet.quads[code] = get_npc(x, y)
      elseif type == "lever" then
      else spritesheet.quads[code] = get_image(x,y)
      end
    end
  end
  return spritesheet
end

function Images(grill)
  local images = {}
  images["wall"] = Spritesheet(grill,"wall")
  images["floor"] = Spritesheet(grill,"floor")
  images["decor"] = Spritesheet(grill,"decor")
  images["torch"] = Spritesheet(grill,"torch")
  images["cartel"] = Spritesheet(grill,"cartel")
  images["npc"] = Spritesheet(grill,"npc")
  images["lever"] = Spritesheet(grill,"lever")
  images["chest"] = Spritesheet(grill,"chest")
  images["door"] = Spritesheet(grill,"door")
  return images
end

return Images
