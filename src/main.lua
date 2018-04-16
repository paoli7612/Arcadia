-- main.lua

level_spawn = require "maps/spawn"


Grill = require("grill")
Player = require("player")

Map = require("map")

function love.load()
	grill = Grill()
	map = Map(grill)
	all_sprites = map.get_group(level_spawn)
	player = Player(grill,5,5)
	player.group = all_sprites
end

function love.update(dt)
	player.update(dt)
end

function love.draw()
	grill.draw()
	player.draw()
	all_sprites.draw()
end
