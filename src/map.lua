
Wall = require("sprites/wall")
Npc = require("sprites/npc")
Group = require("group")
Door = require("sprites/door")
Floor = require("sprites/floor")
Decor = require("sprites/decor")
Torch = require("sprites/torch")
Cartel = require("sprites/cartel")

function Maps(boss)
  local grill = boss.grill
  local boss = boss
  local maps = {}

  function maps.change_map(door_prop)
    love.window.setTitle(door_prop.dest)
    boss.group = maps[door_prop.dest]
    boss.player.x = door_prop.dest_x
    boss.player.y = door_prop.dest_y
  end

  function load_map(level)

    x,y = 0,0
    maps[level.name] = Group(maps)
    for i,p in ipairs(level.data) do
      if x == grill.tile_w then x = 0 y = y + 1 end
      if p >= 1 and p < 20 then
        for i,wall in ipairs(level.properties.wall) do
          if wall.id == p then maps[level.name].add(Wall(boss, x, y, wall)) end
        end
      elseif p >= 20 and p < 40 then
        for i,floor in ipairs(level.properties.floor) do
          if floor.id == p then maps[level.name].add(Floor(boss, x, y, floor)) end
        end
      end
      x = x+1
    end
    for i,door in ipairs(level.properties.door) do
      maps[level.name].add(Door(boss,door))
      if maps[door.dest] == nil then load_map(require("maps/" .. door.dest)) end
    end
    for i,npc in ipairs(level.properties.npc) do maps[level.name].add(Npc(boss,npc)) end
    for i,decor in ipairs(level.properties.decor) do maps[level.name].add(Decor(boss,decor)) end
    for i,torch in ipairs(level.properties.torch) do maps[level.name].add(Torch(boss,torch)) end
    for i,cartel in ipairs(level.properties.cartel) do maps[level.name].add(Cartel(boss,cartel)) end
    return group
  end

  --[[  ONLY DEBIAN
    local handle = io.popen("ls src/maps/")
  local result = handle:read("*a")
  handle:close()


s = result
words = {}
for word in s:gmatch("%a+") do table.insert(words, word) end

  for i,n in ipairs(words) do if not(n == "lua") then load_map(require("maps/"..n)) end end
  ]]
  load_map(require("maps/spawn"))
    -- load_map(require("maps/street"))
      -- load_map(require("maps/castle"))
        -- load_map(require("maps/castleHall"))
      -- load_map(require("maps/dungeon"))
      -- load_map(require("maps/lake"))
      -- load_map(require("maps/village"))
        -- load_map(require("maps/streetDolphin"))
        -- load_map(require("maps/streetTortoise"))
        -- load_map(require("maps/streetElephant"))


  return maps
end

return Maps
