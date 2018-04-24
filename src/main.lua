-- main.lua

Grill = require("grill")
Player = require("sprites/player")
Maps = require("map")
Images = require("images")


function Boss()
	local boss = {}
	boss.grill = Grill()
	boss.images = Images(boss.grill)
	boss.maps = Maps(boss)
	boss.player = Player(boss,5,5)

	boss.group = boss.maps["streetElephant"]
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
