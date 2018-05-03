return {
  "01" = {
    frame = 1,          -- frame iniziale
    purpose = "door",   -- scopo della leva
    command = "open",   -- lancia il comando quando il frame diventa uguale al scope
    other = "close"     -- lancia il comando quando il frame è diverso dallo scope
    id_door = 1,        -- id della porta (solo se purpose == door)
    scope = 2           -- esegue il command se il frame diventa 2
  },
  "02" = {
    frame = 1,
    purpose = "door",
    command = "open",
    other = "close"
    id_door = 1,
    scope = 2
  },
  "03" = {
    frame = 1,
    purpose = "door",
    command = "open",
    other = "close"
    id_door = 1,
    scope = 2           
  }
}
