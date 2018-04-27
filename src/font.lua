function Letters(image)
  local Letters = {blue = {}, yellow= {}}
  local size = 16

  function get_image(x,y)
    return love.graphics.newQuad(x*size, y*size, size, size, image:getDimensions())
  end

  Letters.blue["a"] = get_image(0,0)
  Letters.blue["b"] = get_image(1,0)
  Letters.blue["c"] = get_image(2,0)
  Letters.blue["d"] = get_image(3,0)
  Letters.blue["e"] = get_image(4,0)
  Letters.blue["f"] = get_image(5,0)
  Letters.blue["g"] = get_image(6,0)
  Letters.blue["h"] = get_image(7,0)
  Letters.blue["i"] = get_image(8,0)
  Letters.blue["j"] = get_image(9,0)
  Letters.blue["k"] = get_image(10,0)
  Letters.blue["l"] = get_image(11,0)
  Letters.blue["m"] = get_image(12,0)

  Letters.blue["n"] = get_image(0,1)
  Letters.blue["o"] = get_image(1,1)
  Letters.blue["p"] = get_image(2,1)
  Letters.blue["q"] = get_image(3,1)
  Letters.blue["r"] = get_image(4,1)
  Letters.blue["s"] = get_image(5,1)
  Letters.blue["t"] = get_image(6,1)
  Letters.blue["u"] = get_image(7,1)
  Letters.blue["v"] = get_image(8,1)
  Letters.blue["w"] = get_image(9,1)
  Letters.blue["x"] = get_image(10,1)
  Letters.blue["y"] = get_image(11,1)
  Letters.blue["z"] = get_image(12,1)

  Letters.yellow["a"] = get_image(13,0)
  Letters.yellow["b"] = get_image(14,0)
  Letters.yellow["c"] = get_image(15,0)
  Letters.yellow["d"] = get_image(16,0)
  Letters.yellow["e"] = get_image(17,0)
  Letters.yellow["f"] = get_image(18,0)
  Letters.yellow["g"] = get_image(19,0)
  Letters.yellow["h"] = get_image(20,0)
  Letters.yellow["i"] = get_image(21,0)
  Letters.yellow["j"] = get_image(22,0)
  Letters.yellow["k"] = get_image(23,0)
  Letters.yellow["l"] = get_image(24,0)
  Letters.yellow["m"] = get_image(25,0)

  Letters.yellow["n"] = get_image(13,1)
  Letters.yellow["o"] = get_image(14,1)
  Letters.yellow["p"] = get_image(15,1)
  Letters.yellow["q"] = get_image(16,1)
  Letters.yellow["r"] = get_image(17,1)
  Letters.yellow["s"] = get_image(18,1)
  Letters.yellow["t"] = get_image(19,1)
  Letters.yellow["u"] = get_image(20,1)
  Letters.yellow["v"] = get_image(21,1)
  Letters.yellow["w"] = get_image(22,1)
  Letters.yellow["x"] = get_image(23,1)
  Letters.yellow["y"] = get_image(24,1)
  Letters.yellow["z"] = get_image(25,1)
  return Letters
end

function Font(boss)
  local font = {}
  local image = love.graphics.newImage("img/font.png")
  local letters = Letters(image)
  local boss = boss
  local font_size = 2

  function write_letter(x, y, letter)
    quad = letters.blue[letter]
    love.graphics.draw(image, quad, x, y, 0, font_size, font_size)
  end

  function font.write(x,y,text)
    for i = 1, #text do
        local letter = text:sub(i,i)
        if not (letter == " ") then
          write_letter(font_size*32*i+x,y,letter)
        end
    end
  end

  return font
end

return Font
