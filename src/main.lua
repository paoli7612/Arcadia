-- main.lua
Player = require("player")
Grill = require("grill")

function love.load()
	grill = Grill()
	player = Player(grill)
end

function love.keypressed(key)
end

function love.update(dt)
	player.update(dt)
end

function love.draw()
	grill.draw()
	player.draw()
end
