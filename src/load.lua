-- load.lua

function toboolean(string)
  if string == "true" then return true
  elseif string == "false" then return false end
end

function load(boss)
  local file = nil

  function catch(name)
    file = io.open("save/"..name..".pia", "r")
  end

  function read() return file.read(file) end
  function reads() return file.lines(file) end


  function player()
    catch("player")
    name_map = read()
    love.window.setTitle(name_map)
    boss.group = boss.maps[name_map]
    boss.name_map = name_map

    x = tonumber(read())
    y = tonumber(read())
    boss.player.reset_coord(x,y)

    attr = boss.player.inventory.attr
    attr.life = tonumber(read())
    attr.life_max = tonumber(read())
    attr.exp = tonumber(read())
    attr.exp_max = tonumber(read())
    attr.level = tonumber(read())
    attr.money = tonumber(read())

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

      name_map = r
      nickname = read()
      title = read()

      talk = {}
      r = read()
      if not (r == nil) then for i in string.gmatch(r, "%S+")
        do table.insert(talk, i) end end

      mission = {}
      r = read()
      if not (r == nil) then for i in string.gmatch(r, "%S+")
        do table.insert(mission, i) end end

      for i,p in pairs(boss.maps[name_map].updater) do
        if p.name == "npc" then
          if p.nickname == nickname then
            for i,quest in ipairs(p.description.quests) do
              if quest.name == title then
                p.current_quest = quest
                boss.player.inventory.quest_list.add(p,p.current_quest)
                for i,p in ipairs(p.current_quest.purpose.talk) do
                  p.completed = toboolean(talk[i])
                  print(p.completed)
                end
                for i,p in ipairs(p.current_quest.purpose.mission) do
                  p.completed = toboolean(mission[i])
                end
              end
            end

          end
        end
      end

      r = read()
    end
  end


  player()
  quest_completed()
  quest_started()
end

return load
