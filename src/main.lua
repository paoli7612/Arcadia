-- main.lua

Grill = require("grill")
Player = require("sprites/player")
Maps = require("map")
Images = require("images")
Chat = require("chat")

function Boss()
	local boss = {}
	boss.grill = Grill()
	boss.images = Images(boss.grill)
	boss.maps = Maps(boss)
	boss.player = Player(boss,20,5)
	boss.group = boss.maps["spawn"]
	boss.chat = Chat(boss)
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
	boss.chat.update(dt)
	if love.keyboard.isDown("w") then boss.group.show() end
	if love.keyboard.isDown("c") then boss.chat.activate = true end
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

	 if key == "i" then
		 	boss.player.inventory.show()
	 end

	 if key == "o" then
		 	boss.player.inventory.add(c)
	 end

	 if key == "p" then
		 	boss.player.inventory.remove(c)
	 end
end
