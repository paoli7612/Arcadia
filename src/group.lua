-- group.lua

function Group(maps)
  local group = {}
  local maps = maps

  function group.add(new_sprite)
    table.insert(group,new_sprite)
    new_sprite.group = group
  end

  function group.show()
    print("sprites group: ")
    for i,item in ipairs(group) do
      print(" -" .. item.name)
    end
  end

  function group.draw()
    for i,item in ipairs(group) do
      item.draw()
    end
  end

  function group.collide(sprite)
    for i,item in ipairs(group) do
      if sprite.x + sprite.dx == item.x and sprite.y + sprite.dy == item.y then
        if item.name == "floor" then else
        print("collision: " .. sprite.name .. " - " .. item.name)
        if item.name == "door" then
          maps.change_map(item.properties)
        end
        return true
      end
      end
    end
    return false
  end


  return group
end
return Group
