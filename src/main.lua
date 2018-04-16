-- main.lua
Grill = require("grill")
Player = require("player")
Wall = require("wall")
Npc = require("npc")
Group = require("group")

function load_walls()
	for i = 0,grill.tile_w do
		wall = Wall(grill,0,i)
		all_sprites.add(wall)
		wall = Wall(grill,grill.tile_h-1,i)
		all_sprites.add(wall)
	end
	for i = 0,grill.tile_h do
		wall = Wall(grill,i,0)
		all_sprites.add(wall)
		wall = Wall(grill,i,grill.tile_w-1)
		all_sprites.add(wall)
	end
end

function love.load()
	grill = Grill()
	all_sprites = Group()
	player = Player(grill,5,5)
	npc = Npc(grill,4,7)
	all_sprites.add(npc)
	load_walls()
	player.group = all_sprites
	all_sprites.show()
end

function love.update(dt)
	player.update(dt)
end

function love.draw()
	grill.draw()
	player.draw()
	all_sprites.draw()
end
