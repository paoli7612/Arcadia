
Wall = require("wall")
Npc = require("npc")
Group = require("group")
Door = require("door")

level_spawn = require "maps/spawn"
level_street = require "maps/street"

function Maps(boss)
  local grill = boss.grill
  local boss = boss
  local maps = {}

  function maps.change_map(door_prop)
    print(door_prop.dest)
    boss.group = maps[door_prop.dest]
    boss.player.x = door_prop.coord_x
    boss.player.y = door_prop.coord_y
  end

  function load_map(level)
    x,y = 0,0
    group = Group(maps)
    for i,p in ipairs(level.data) do
      if x == grill.tile_w then x = 0 y = y + 1 end
      if p >= 1 and p < 20 then
        for i,wall in ipairs(level.properties.walls) do
          if wall.id == p then group.add(Wall(boss, x, y, wall)) end
        end
      elseif p >= 20 and p < 40 then
        for i,npc in ipairs(level.properties.npc) do
          if npc.id == p then group.add(Npc(grill,x,y,npc)) end
        end
      elseif p >= 40 and p < 60 then
        for i,door in ipairs(level.properties.doors) do
          if door.id == p then group.add(Door(grill, x, y, door)) end
        end
      end
      x = x+1
    end
    return group
  end
  maps["spawn"] = load_map(level_spawn)
  maps["street"] = load_map(level_street)
  return maps
end

return Maps
