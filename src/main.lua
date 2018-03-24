Player = require("player2")
Platform = require("platform")

local player
local platform
local all_sprites = {}
function love.load()
	player = Player("duncan","base")
	platform = Platform(10,300,4)

	all_sprites[0] = platform
end

function love.keypressed(key)
	if key=="up" then
		player.jump()
	end
end

function love.update(dt)
	player.update(dt,all_sprites)
end

function love.draw()
	player.draw()
	platform.draw()
end
