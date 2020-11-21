function Audio()
  local audio = {}
  audio.song = 'spawn'

  function audio.change_map(name)
    if not (audio.song == name) then
      print("Cambio canzone: "..name)
      audio.song = name
    end
  end


  return audio
end

return Audio
