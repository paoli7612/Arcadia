-- save.lua
-- Player
  -- coords
  -- inventory
    -- items
    -- equiped
  -- interface
    -- level
    -- life
    -- money
    -- exp
-- boss
  -- name_map
-- Quest_list
  -- completed



function save(boss)
  local text = ""

  function add(p)
    print(p)
    text = text .. p .. "\n"
  end

  add(boss.name_map)
  add(boss.player.x)
  add(boss.player.y)

  attr = boss.player.inventory.interface.attr
  add(attr.life)
  add(attr.life_max)
  add(attr.exp)
  add(attr.exp_max)
  print(attr.level)
  add(attr.level)
  add(attr.money)

  local file = io.open("save/player.txt", "w")
  file.write(file, text)
  file.flush(file)

end

return save
