function Audio()
  local audio = {}
  audio.song = 'spawn'
  audio.music = love.audio.newSource("snd/spawn.wav", 'stream')

  function audio.change_map(name)
    if not (audio.song == name) then
      if love.filesystem.exists("snd/"..name..".wav") then
        audio.song = name
        audio.music:stop()
        audio.music = love.audio.newSource("snd/"..name..".wav", 'stream')
        audio.music:play()
      end
    end
  end


  return audio
end

return Audio
