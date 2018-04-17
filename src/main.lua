-- main.lua

Grill = require("grill")
Player = require("player")
Maps = require("map")
Images = require("images")

function Boss()
	local boss = {}
	boss.grill = Grill()

	boss.images = Images(boss.grill)
	boss.maps = Maps(boss)
	boss.player = Player(boss,5,5)
	boss.group = boss.maps["spawn"]

	return boss
end

function love.load()
	boss = Boss()
end

function love.update(dt)
	boss.player.update(dt)
end

function love.draw()
	--boss.grill.draw()
	boss.group.draw()
	boss.player.draw()
end
