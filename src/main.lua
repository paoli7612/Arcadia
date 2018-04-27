-- main.lua

Grill = require("grill")
Player = require("sprites/player")
Maps = require("map")
Images = require("images")
Font = require("font")


function Boss()
	local boss = {}
	boss.grill = Grill()
	boss.images = Images(boss.grill)
	boss.maps = Maps(boss)
	boss.player = Player(boss,20,5)
	boss.font = Font(boss)
	boss.group = boss.maps["spawn"]
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
	boss.font.write(100,100,"lili oldrin e suo marito")
end
