-- group.lua

function Group(maps,grill)
  local group = {
    collider = {},
    updater = {},
    drawable = {},
    arrow = {}
  }
  local maps = maps
  local grill = grill

  function group.add(new_sprite)
    if new_sprite.name == "wall" then table.insert(group.collider, new_sprite)
    elseif new_sprite.name == "npc" then table.insert(group.updater, new_sprite)
    elseif new_sprite.name == "door" then table.insert(group.collider, new_sprite)
    elseif new_sprite.name == "floor" then table.insert(group.drawable, new_sprite)
    elseif new_sprite.name == "decor" then table.insert(group.collider, new_sprite)
    elseif new_sprite.name == "cartel" then table.insert(group.collider, new_sprite)
    elseif new_sprite.name == "torch" then table.insert(group.updater, new_sprite)
    elseif new_sprite.name == "water" then table.insert(group.updater, new_sprite)
    elseif new_sprite.name == "lever" then table.insert(group.collider, new_sprite)
    elseif new_sprite.name == "chest" then table.insert(group.updater, new_sprite)
    elseif new_sprite.name == "arrow" then table.insert(group.arrow, new_sprite)
    end
    new_sprite.group = group
  end

  function group.show(any)
    if any == nil then
      print("sprites group: ")
      print("collider") for i,item in ipairs(group.collider) do print(" -" .. item.name) end
      print("updater") for i,item in ipairs(group.updater) do print(" -" .. item.name) end
      print("drawable") for i,item in ipairs(group.drawable) do print(" -" .. item.name) end
      print("arrow") for i,item in ipairs(group.arrow) do print(" -" .. item.name) end
    elseif any == "arrow" then for i,item in ipairs(group.arrow) do print(" -" .. item.name) end end

  end

  function group.get_position(x,y)
    for i,element in ipairs(group.updater) do
        if element.x == x and element.y == y then
          return element
        end
    end
    for i,element in ipairs(group.collider) do
        if element.x == x and element.y == y then
          return element
        end
    end
  end

  function group.draw()
    for i,item in ipairs(group.drawable) do item.draw() end
    for i,item in ipairs(group.collider) do item.draw() end
    for i,item in ipairs(group.updater) do item.draw() end
    for i,item in ipairs(group.arrow) do item.draw() end
  end

  function group.collide_pair(spriteA, spriteB)
    if spriteA.x + spriteA.dx == spriteB.x and spriteA.y + spriteA.dy == spriteB.y then
      return true
    else return false end
  end

  function group.collide_any(sprite, group, skyp)
    for i,item in ipairs(group) do
      if not (item.name == skyp) then
        if item.x == sprite.x and item.y == sprite.y then
          return true
        end
      end
    end
  end

  function group.collide(sprite)
    for i,item in ipairs(group.collider) do
      if sprite.x + sprite.dx == item.x and sprite.y + sprite.dy == item.y then
        if item.name == "door" then maps.change_map(item.door_prop) end
        return true
      end
    end
    for i,item in ipairs(group.updater) do
      if sprite.x + sprite.dx == item.x and sprite.y + sprite.dy == item.y then
        return true end
    end
    return false
  end

  function group.update(dt)
    for i,item in ipairs(group.updater) do item.update(dt) end
    for i,item in ipairs(group.arrow) do
      if item.x < 0 or item.y < 0 or item.x > grill.tile_w or item.y > grill.tile_h then
        table.remove(group.arrow, i)
      else item.update(dt) end
    end

    -- arrow collide obstacle
    for i,arrow in ipairs(group.arrow) do
      if group.collide_any(arrow, group.collider) then table.remove(group.arrow, i) end
      if group.collide_any(arrow, group.updater,"water") then table.remove(group.arrow, i) end
    end
  end

  return group
end
return Group
