-- sowrd.lua

function Sword(boss, code)
  local sword = {code = code}
  local grill = boss.grill
  local spritesheet = boss.images["sword"]

  function sword.draw()
    spritesheet.draw_image(ix,iy,spritesheet.quads[sword.code],rotation)
  end
  return sword
end

return Sword
