-- food.lua

function Food(boss, code)
  local food = {code = code}
  local grill = boss.grill
  local spritesheet = boss.images["items"]

  function food.draw(x,y)
    spritesheet.draw_image(x*grill.tile,y*grill.tile,spritesheet.quads["food"][food.code])
  end

  return food
end

return Food
