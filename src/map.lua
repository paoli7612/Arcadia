
Wall = require("wall")
Npc = require("npc")
Group = require("group")

function Map(grill)
  local grill = grill
  local map = {}

  function map.get_group(level)
    g = Group()
    x,y = 0,0
    for i,p in ipairs(level.layers[1].data) do
      if x == grill.tile_w then x = 0 y = y + 1 end
      if p == 390 then g.add(Wall(grill,x,y)) end
      if p == 223 then g.add(Npc(grill,x,y)) end
      x = x+1
    end
    return g
  end

  return map
end
return Map
