function Platform(x,y,w)
  local platform = {}

  local pos = {x=x, y=y, w=w}
  local image = love.graphics.newImage("img/platform.png")
  function platform.draw()
    for step = 0,pos.w-1 do
      love.graphics.draw(image,pos.x*(step*10),pos.y,0,0.78125,0.78125)
    end
  end


  return platform
end

return Platform
