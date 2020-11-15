-- main.lua

Grill = require("grill")
Player = require("sprites/player")
Maps = require("map")
Images = require("images")
Chat = require("chat")

Save = require("save")
Load = require("load")

function Boss()
	local boss = {}
	boss.grill = Grill()
	boss.images = Images(boss.grill)
	boss.maps = Maps(boss)
	boss.player = Player(boss,36,6)
	boss.maps.use("spawn")
	boss.chat = Chat(boss)

	Load(boss)

	return boss
end

function love.load()
	boss = Boss()

	music = love.audio.newSource("snd/example2.wav", "static")
	music:setVolume(0.9)
	music:setLooping(true)
	music:play()
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

function love.quit()
	Save(boss)
	print("saved")
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end

	if key == "i" then	boss.player.inventory.show() end
	if key == "w" then	boss.player.shot() end
	if key == "e" then	boss.group.show("arrow") end
		if boss.chat.activate then
			if key == "space" then boss.chat.next() end
		else
			if key == "q" then boss.player.action() end
		end

	end
