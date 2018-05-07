-- food.lua

function Food(boss, code)
  local food = {code = code}
  local grill = boss.grill
  local spritesheet = boss.images["food"]

  function food.draw(x,y)
    spritesheet.draw_image(x*grill.tile,y*grill.tile,spritesheet.quads[food.code])
  end

  return food
end

return Food
