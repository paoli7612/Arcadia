-- arrow.lua

function Arrow(boss, code, x, y, d)
  local arrow = {
    name = "arrow",
    x = x,
    y = y,
    d = d}
  local boss = boss
  local spritesheet = boss.images["arrow"]
  local code = code
  local grill = boss.grill
  local rotation = 0
  function set_rot()
    if arrow.d then rotation = math.pi/4 end

    if not arrow.d then math.random(math.pi/3) end
  end
  set_rot()


  function arrow.draw()
    spritesheet.draw_image(arrow.x*grill.tile,arrow.y*grill.tile,spritesheet.quads[code], rotation)
  end

  function arrow.update()
    print("arrow, update")
  end

  return arrow
end

return Arrow
