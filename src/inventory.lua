-- inventory.lua

function Inventory(boss)
  local inventory = {}
  local bag = {}

  local money = 0
  local life = 100
  local exp = 0
  local level = 1

  local grill = boss.grill
  local show = false

  function inventory.draw()
    if show then
      love.graphics.setColor(0,0,0)
      love.graphics.rectangle("fill", 0, 0, grill.WIDTH, grill.tile*2,0,2,2)
      for i,p in ipairs(bag) do
        p.draw(i,0) end

      love.graphics.setColor(255,255,0)
      love.graphics.print("Money " .. money, grill.WIDTH - grill.tile*4, 0)

      love.graphics.setColor(255,0,255)
      love.graphics.print("Exp " .. exp, grill.WIDTH - grill.tile*4, grill.tile)

      love.graphics.setColor(255,255,255)
      love.graphics.print("Level " .. level, grill.WIDTH - grill.tile*3 * 3, 0)

      love.graphics.setColor(255,0,0)
      love.graphics.print("Life " .. life, grill.WIDTH - grill.tile*3 * 3, grill.tile)

      love.graphics.setColor(255, 255, 255)
    end
  end

  function inventory.add(item)
    table.insert(bag, item)
  end

  function inventory.remove(item)
    for i,p in ipairs(bag) do if p.code == item.code then table.remove(bag,i) return end end
  end

  function inventory.show()
    show = not(show)
  end

  return inventory
end

return Inventory
