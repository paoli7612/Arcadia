-- inventory.lua

Interface = require("interface")

function Inventory(boss)
  local inventory = {}
  local bag = {}
  local interface = Interface(boss)
  local grill = boss.grill
  local show = false

  function inventory.draw()
    if show then
      love.graphics.setColor(0,0,0)
      love.graphics.rectangle("fill", 0, 0, grill.WIDTH, grill.tile*2,0,2,2)
      for i,p in ipairs(bag) do
        p.draw(i,0) end
      interface.draw()
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