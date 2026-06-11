-- inventory.lua

local Attr = require("attr")
local Quest_list = require("quest_list")

local function Inventory(boss)
  local inventory = {}
  local bag = {}
  local equip = nil
  inventory.attr = Attr(boss)
  inventory.quest_list = Quest_list(boss)
  local show = false

  function inventory.draw()
    if show then
      boss.interface.draw_inventory(inventory.attr, bag, equip)
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
