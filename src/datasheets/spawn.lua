return {
  {
    name = "01",
    frame = 1,          -- frame iniziale
    purpose = "door",   -- scopo della leva
    command = "open",   -- lancia il comando quando il frame diventa uguale al scope
    other = "close",     -- lancia il comando quando il frame è diverso dallo scope
    id_door = 1,        -- id della porta (solo se purpose == door)
    scope = 2           -- esegue il command se il frame diventa 2
  },
  {
    name = "02",
    contenent = {},      -- contenuto chest
    message = {
       open = {"questa cassa non sembra contenere nulla"},                  -- messaggio all appertura
       lock = {"non riesco ad aprire questa cassa", "devo trovare un modo"} -- messaggio quando la cassa e'bloccata
    },
    unlocked = true     -- chest apribile
  }
}
