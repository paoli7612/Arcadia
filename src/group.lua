-- group.lua

function Group(maps)
  local group = {
    collider = {},
    updater = {},
    drawable = {}
  }
  local maps = maps

  function group.add(new_sprite)
    if new_sprite.name == "wall" then table.insert(group.collider,new_sprite)
    elseif new_sprite.name == "npc" then table.insert(group.collider,new_sprite)
    elseif new_sprite.name == "door" then table.insert(group.collider,new_sprite)
    elseif new_sprite.name == "floor" then table.insert(group.drawable,new_sprite)
    elseif new_sprite.name == "decor" then table.insert(group.collider,new_sprite)
    elseif new_sprite.name == "cartel" then table.insert(group.collider,new_sprite)
    elseif new_sprite.name == "torch" then table.insert(group.updater,new_sprite) end
    new_sprite.group = group
  end

  function group.show()
    print("sprites group: ")
    print("collider") for i,item in ipairs(group.collider) do print(" -" .. item.name) end
    print("updater") for i,item in ipairs(group.updater) do print(" -" .. item.name) end
    print("drawable") for i,item in ipairs(group.drawable) do print(" -" .. item.name) end
  end

  function group.draw()
    for i,item in ipairs(group.drawable) do item.draw() end
    for i,item in ipairs(group.collider) do item.draw() end
    for i,item in ipairs(group.updater) do item.draw() end
  end

  function group.collide(player)
    for i,item in ipairs(group.collider) do
      if player.x + player.dx == item.x and player.y + player.dy == item.y then
        if item.name == "door" then maps.change_map(item.properties) end
        return true
      end
    end
    for i,item in ipairs(group.updater) do
      if player.x + player.dx == item.x and player.y + player.dy == item.y then return true end
    end
    return false
  end

  function group.update(dt)
    for i,item in ipairs(group.updater) do
      item.update(dt)
    end
  end

  return group
end
return Group
