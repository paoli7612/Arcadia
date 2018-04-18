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
    function get_set(x,y)
      x,y = x*3,y*5
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
    spritesheet.quads["man"] = get_set(0,0)
    spritesheet.quads["boy"] = get_set(1,0)
    spritesheet.quads["girl"] = get_set(2,0)
    spritesheet.quads["alien"] = get_set(3,0)
    spritesheet.quads["slime"] = get_set(0,1)
    spritesheet.quads["bat"] = get_set(1,1)
    spritesheet.quads["ghost"] = get_set(2,1)
    spritesheet.quads["spider"] = get_set(3,1)

  elseif type == "basictiles" then
    spritesheet.quads["wall"] = {}
    spritesheet.quads["wall"]["blue"] = {get_image(0,0),get_image(1,0),get_image(2,0),get_image(3,0)}
    spritesheet.quads["wall"]["red"] = {get_image(4,0),get_image(5,0),get_image(6,0),get_image(7,0)}
    spritesheet.quads["wall"]["stone"] = {get_image(0,10),get_image(1,10)}
    spritesheet.quads["wall"]["wood"] = {get_image(0,11),get_image(1,11)}

    spritesheet.quads["floor"] = {}
    spritesheet.quads["floor"]["grass"] = {get_image(0,8),get_image(1,8),get_image(3,1),get_image(4,1)}
    spritesheet.quads["floor"]["wood"] = {get_image(0,1),get_image(0,2),get_image(0,8)}
    spritesheet.quads["floor"]["ice"] = {get_image(5,3),get_image(5,4)}
    spritesheet.quads["floor"]["stone"] = {get_image(6,1),get_image(2,8)}

    spritesheet.quads["decor"] = {}
    spritesheet.quads["decor"]["shelf"] = get_image(7,6)
    spritesheet.quads["decor"]["chest"] = get_image(4,4)
    spritesheet.quads["decor"]["table"] = get_image(6,6)
    spritesheet.quads["decor"]["urn"] = get_image(3,3)
    spritesheet.quads["decor"]["bed_down"] = get_image(5,6)
    spritesheet.quads["decor"]["bed_up"] = get_image(5,5)

    spritesheet.quads["door"] = {get_image(0,6),get_image(1,6),get_image(2,6),get_image(0,7),get_image(1,7)}

  elseif type == "things" then
    spritesheet.quads["door"] = {get_image(0,0),get_image(0,1),get_image(0,2),get_image(0,3)}
    spritesheet.quads["chest"] = {get_image(6,0),get_image(6,1),get_image(6,2),get_image(6,3)}
    spritesheet.quads["torchs"] = {}
    spritesheet.quads["torchs"]["yellow"] = {get_image(0,4),get_image(1,4),get_image(2,4)}
    spritesheet.quads["torchs"]["blue"] = {get_image(0,5),get_image(1,5),get_image(2,5)}
    spritesheet.quads["torchs"]["red"] = {get_image(0,6),get_image(1,6),get_image(2,6)}
    spritesheet.quads["torchs"]["green"] = {get_image(0,7),get_image(1,7),get_image(2,7)}
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
