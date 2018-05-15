-- quest.lua

function Quest_list(boss)
  local quest_list = {}

  local quests = {}
  local npcs = {}
  quest_list.completed = {}

  local boss = boss

  function isCompleted(quest)
    completed = false
    for i,name in ipairs(quest_list.completed) do
      if name == quest.name then completed = true end
    end
    return completed
  end


  function quest_list.add(npc, quest)
    if isCompleted(quest) then return false end
    table.insert(npcs, npc)
    table.insert(quests, quest)
    return true
  end

  function quest_list.del(name)
    table.insert(quest_list.completed, name)
    print("del", name)
    for i,quest in ipairs(quests) do
      if quest.name == name then
        table.remove(npcs, i)
        table.remove(quests, i)
      end
    end
  end

  function quest_list.talk(npc)
    for i,quest in ipairs(quests) do
      for j,talk in ipairs(quest.purpose.talk) do
        if talk.npc == npc.nickname and talk.map == boss.name_map then
          if not npcs[i].current_quest.purpose.talk[j].completed then
            npcs[i].current_quest.purpose.talk[j].completed = true
            return npcs[i].current_quest.purpose.talk[j].chat
          end
        end
      end
    end
  end

  return quest_list
end

return Quest_list
