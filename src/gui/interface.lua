-- interface.lua

function Interface(boss)
  local grill = boss.grill
  local interface = {}
  interface.attr = {
      life = 100,
      life_max = 100,
      level = 1,
      money = 0,
      exp = 0,
      exp_max = 50
    }


  function interface.draw()
    love.graphics.setColor(255,255,0)
    love.graphics.print("Money " .. interface.attr.money, grill.WIDTH - grill.tile*4, 0)

    love.graphics.setColor(255,0,255)
    love.graphics.print("Exp " .. interface.attr.exp .. "/" .. interface.attr.exp_max, grill.WIDTH - grill.tile*4, grill.tile)

    love.graphics.setColor(255,255,255)
    love.graphics.print("Level " .. interface.attr.level, grill.WIDTH - grill.tile*3 * 3, 0)

    love.graphics.setColor(255,0,0)
    love.graphics.print("Life " .. interface.attr.life .. "/" .. interface.attr.life_max, grill.WIDTH - grill.tile*3 * 3, grill.tile)

    love.graphics.setColor(255, 255, 255)
  end

  function interface.add_life(life)
    interface.attr.life = interface.attr.life + life
    if interface.attr.life > interface.attr.life_max then
      interface.attr.life = interface.attr.life_max end
    if interface.attr.life <= 0 then
      print("dead") end
  end

  function interface.add_money(money)
    interface.attr.money = interface.attr.money + money
  end

  function interface.add_exp(exp)
    interface.attr.exp = interface.attr.exp + exp
    if interface.attr.exp >= interface.attr.exp_max then
      -- level up
      interface.attr.exp = interface.attr.exp - interface.attr.exp_max
      interface.attr.exp_max = interface.attr.exp_max * 2
      interface.attr.level = interface.attr.level + 1
      interface.attr.life_max = interface.attr.life_max + 10
      interface.attr.life = interface.attr.life_max
      print("new level")
    end
  end


  return interface
end

return Interface
