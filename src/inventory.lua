-- inventory.lua

function Inventory(boss)
  local inventory = {}
  local bag = {}

  function inventory.add(item)
    table.insert(bag, item)
  end

  function inventory.remove(item)
    for i,p in ipairs(bag) do if p == item then table.remove(bag,i) return end end
  end

  function inventory.show()
    for i,p in ipairs(bag) do print(i,p) end
  end

  return inventory
end

return Inventory
