-- sowrd.lua

function Sword(boss, code)
  local sword = {code = code}
  local grill = boss.grill
  local spritesheet = boss.images["sword"]
  local rotation = 0
  local ix = 100
  local iy = 100
  local time = 0
  local speed = 0.1

  function sword.draw()
    spritesheet.draw_image(ix,iy,spritesheet.quads[sword.code],rotation)
  end

  function sword.update(dt)
    time = time + dt
    if time > speed then
      rotation = 0
      time = 0
    end
    ix = boss.player.x * grill.tile
    iy = boss.player.y * grill.tile
  end


  return sword
end

return Sword
