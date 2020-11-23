-- inventory.lua

Attr = require("attr")
Quest_list = require("quest_list")

function Inventory(boss)
  local inventory = {}
  local bag = {}
  local equip = nil
  inventory.attr = Attr(boss)
  inventory.quest_list = Quest_list(boss)
  local grill = boss.grill
  local show = false

  function inventory.draw()
    if show then
      love.graphics.setColor(0,0,0)
      love.graphics.rectangle("fill", 50, 50, 200, grill.tile*3+50,0,2,2)
      inventory.attr.draw(60, 65)
      for i,p in ipairs(bag) do
        p.draw(i,0) end
      equip.draw(grill.tile_w-1,0)
    end
  end

  function inventory.equip(item)
    equip = item
  end

  function inventory.add(item)
    table.insert(bag, item)
  end

  function inventory.remove(item)
    for i,p in ipairs(bag) do
      if p.code == item.code then
        table.remove(bag,i) return end end
  end

  function inventory.show()
    show = not(show)
  end

  return inventory
end

return Inventory
