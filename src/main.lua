Player = require("player")

function love.load()
	player = Player("jeff","base")
end

function love.update(dt)
	player.update(dt)
end

function love.draw()
	player.draw()
end