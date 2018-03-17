local imageFile


function love.load()
	imageFile = love.graphics.newImage("img/pelton.png")
end

function love.draw()
	love.graphics.draw(imageFile)
end