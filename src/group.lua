-- group.lua

function Group()
  local group = {}

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
        print("collision: " .. sprite.name .. " - " .. item.name)
        return true
      end
    end
    return false
  end


  return group
end
return Group
