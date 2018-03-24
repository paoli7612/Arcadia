Player = require("player2")

local player

function love.load()
	player = Player("duncan","base")
end

function love.keypressed(key)
	if key=="up" then
		player.jump()
	end
end

function love.update(dt)
	player.update(dt)
end

function love.draw()
	player.draw()
end
