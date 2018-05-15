-- load.lua

function load(boss)
  local file = nil

  function catch(name)
    file = io.open("save/"..name..".pia", "r")
  end

  function read()
    return file.read(file)
  end

  function reads()
    return file.lines(file)
  end


  function player()
    catch("player")
    name_map = read()
    love.window.setTitle(name_map)
    boss.group = boss.maps[name_map]
    boss.name_map = name_map

    x = tonumber(read())
    y = tonumber(read())
    boss.player.reset_coord(x,y)

    boss.player.inventory.interface.attr = {
      life = tonumber(read()),
      life_max = tonumber(read()),
      exp = tonumber(read()),
      exp_max = tonumber(read()),
      level = tonumber(read()),
      money = tonumber(read())
    }
  end

  function quest_completed()
    catch("quest_completed")
    for i in reads() do
      t = boss.player.inventory.quest_list.completed
      table.insert(t, i)
    end
  end

  function quest_started()
    catch("quest_started")
    r = read()
    while not(r == nil) do
      if r == "end" then end
      for i in string.gmatch(r, "%S+") do
        print(i)
      end
      r = read()
    end
  end

  player()
  quest_completed()
  quest_started()
end

return load
