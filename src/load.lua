-- load.lua

function load(boss)
  file = io.open("save/player.txt", "r")

  name_map = file.read(file)
  x = file.read(file)
  y = file.read(file)
  boss.player.reset_coord(x,y)

  boss.player.inventory.interface.attr = {
    life = tonumber(file.read(file)),
    life_max = tonumber(file.read(file)),
    exp = tonumber(file.read(file)),
    exp_max = tonumber(file.read(file)),
    level = tonumber(file.read(file)),
    money = tonumber(file.read(file))
  }


end

return load
