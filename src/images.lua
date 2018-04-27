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

  if type == "characters" then

  end
  if type == "basictiles" then
    -- read json file
    json = require ("json")
    lines = ""
    for line in io.lines("src/img/"..type..".json") do lines = lines .. line end
    local dict = json.decode(lines)
    for sprite_type in pairs(dict) do
      spritesheet.quads[sprite_type] = {}
      for id in pairs(dict[sprite_type]) do
        if not (id == "_cumment") then
          spritesheet.quads[sprite_type][id] = get_image(dict[sprite_type][id]["x"],dict[sprite_type][id]["y"])
          --print(id,dict[sprite_type][id]["x"],dict[sprite_type][id]["y"])
        end
      end
    end
  end

  return spritesheet
end

function Images(grill)
  local images = {}
  -- basictiles
  images["basictiles"] = Spritesheet(grill,"basictiles")
  images["characters"] = Spritesheet(grill,"characters")

  return images
end

return Images
