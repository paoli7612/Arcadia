-- bow.lua

function Bow(boss, code)
  local bow = {code = code}
  local grill = boss.grill
  local spritesheet = boss.images["bow"]

  function bow.draw(x, y)
    spritesheet.draw_image(x*grill.tile, y*grill.tile,spritesheet.quads[bow.code])
  end

  return bow
end

return Bow
