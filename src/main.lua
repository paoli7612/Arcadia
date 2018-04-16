-- main.lua
Grill = require("grill")
Player = require("player")
Wall = require("wall")
Npc = require("npc")
Group = require("group")

function load_walls()
	function new_wall(x,y)
		wall = Wall(grill,x,y)
		all_sprites.add(wall)
	end
	for i = 0,grill.tile_w do
		new_wall(0,i)
		new_wall(grill.tile_h-1,i)
	end
	for i = 0,grill.tile_h do
		new_wall(i,0)
		new_wall(i,grill.tile_w-1)
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
