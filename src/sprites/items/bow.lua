-- bow.lua

function Bow(boss, code)
  local bow = {code = code}
  local grill = boss.grill
  local spritesheet = boss.images["bow"]
  local rotation = 0
  local ix = 100
  local iy = 100
  local time = 0
  local speed = 0.1

  function bow.draw()
    spritesheet.draw_image(ix,iy,spritesheet.quads[bow.code],rotation)
  end

  function bow.update(dt)
    time = time + dt
    if time > speed then
      rotation = 0
      time = 0
    end
    ix = boss.player.x * grill.tile
    iy = boss.player.y * grill.tile
  end


  return bow
end

return Bow
