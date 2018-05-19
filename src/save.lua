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

  function add(p) text = text .. tostring(p) .. "\n" end
  function del() text = "" end

  function write(name)
    local file = io.open("save/"..name..".pia", "w")
    file.write(file, text)
    file.flush(file)
  end

  -- player
  function player()
    del()
    add(boss.name_map)
    add(boss.player.x)
    add(boss.player.y)
    attr = boss.player.inventory.interface.attr
    add(attr.life)
    add(attr.life_max)
    add(attr.exp)
    add(attr.exp_max)
    add(attr.level)
    add(attr.money)
    write("player")
  end

  function quest_completed()
    del()
    for i,completed in ipairs(boss.player.inventory.quest_list.completed) do
      add(completed) end
    write("quest_completed")
  end

  function quest_started()
    del()
    for i,level in pairs(boss.maps) do
      if not (type(level) == "function") then
        for i,sprite in pairs(level.updater) do
          if sprite.name == "npc" then
            if not (sprite.current_quest == false) then
              c = sprite.current_quest.purpose
              add(sprite.name_map)
              add(sprite.nickname)
              add(sprite.current_quest.name)
              talk = ""
              for i,t in ipairs(c.talk) do
                talk = talk .. tostring(t.completed) .. " " end
              add(talk)
              mission = ""
              for i,m in ipairs(c.mission) do
                mission = mission .. tostring(m.completed) end
              add(mission)
            end
          end
        end
      end
    end
    write("quest_started")
  end

  player()
  quest_completed()
  quest_started()

  print("Game saved")

end

return save
