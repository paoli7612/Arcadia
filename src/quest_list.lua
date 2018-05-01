-- quest.lua

function Quest_list(boss)
  local quest_list = {}

  local quests = {}
  local npcs = {}

  local boss = boss

  function quest_list.add(npc, quest)
    table.insert(npcs, npc)
    table.insert(quests, quest)
  end

  function quest_list.talk(npc)
    for i,quest in ipairs(quests) do
      for j,talk in ipairs(quest.purpose.talk) do
        if talk.npc == npc.nickname and talk.map == boss.name_map then
          npcs[i].current_quest.purpose.talk[j].completed = true
        end
      end
    end
  end

  return quest_list
end

return Quest_list
