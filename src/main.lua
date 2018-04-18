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
	boss.player = Player(boss,boss.grill.tile_w-2,1)
	boss.group = boss.maps["village"]
	love.window.setTitle("village")
	return boss
end

function love.load()
	boss = Boss()
	music = love.audio.newSource("snd/asd.wav", "static")
	music:setVolume(0.9)
	music:play()
end

function love.update(dt)
	boss.player.update(dt)
	boss.group.update(dt)
	if love.keyboard.isDown("w") then boss.group.show() end
end

function love.draw()
	boss.group.draw()
	boss.player.draw()
end
