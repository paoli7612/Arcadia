-- main.lua

Grill = require("grill")
Player = require("sprites/player")
Maps = require("map")
Images = require("images")
Chat = require("gui/chat")

function Boss()
	local boss = {}
	boss.grill = Grill()
	boss.images = Images(boss.grill)
	boss.maps = Maps(boss)
	boss.player = Player(boss,36,6)
	boss.group = boss.maps["test"]
	boss.name_map = "test"
	boss.chat = Chat(boss)
	return boss
end

function love.load()
	boss = Boss()

	-- music = love.audio.newSource("snd/asd.wav", "static")
	-- music:setVolume(0.9)
	-- music:play()
end

function love.update(dt)
	boss.player.update(dt)
	boss.group.update(dt)
	boss.chat.update(dt)
end

function love.draw()
	boss.group.draw()
	boss.player.draw()
	boss.chat.draw()
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end

	if key == "i" then	boss.player.inventory.show()
	elseif key == "q" then	boss.player.action()
	elseif key == "space" then	boss.chat.next()

	end
end
