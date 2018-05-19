-- arrow.lua

function Arrow(boss, code, x, y, direction)
  local arrow = {
    name = "arrow",
    x = x,
    y = y}
  local spritesheet = boss.images["arrow"]

  local grill = boss.grill
  local speed = 20
  local group = boss.group

  local ix = arrow.x * grill.tile
  local iy = arrow.y * grill.tile

  function arrow.draw()
    spritesheet.draw_image(ix,iy,spritesheet.quads[code][direction])
  end

  function arrow.update()

    arrow.x = math.floor(ix/grill.tile)
    arrow.y = math.floor(iy/grill.tile)

    if direction == "left" then ix = ix - speed end
    if direction == "right" then ix = ix + speed end
    if direction == "up" then iy = iy - speed end
    if direction == "down" then iy = iy + speed end
  end

  return arrow
end

return Arrow
