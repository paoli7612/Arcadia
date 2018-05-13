return {
  name = "andy",
  quests = {
    {
      name = "coockie",
      level_required = 1,
      completed = false,
      started = false,
      state = 1,
      chat = {
        start = {
          "MISSIONE COOCKIE",
          "completa la prima quest di steve"
        },
        state = {
          "Ancora non la hai completata?",
          "vai a parlare con Steve vala"
        },
        quit = {
          "ottimo lavoro",
          "ecco tienein un biscotto",
          "puoi usarlo per ripristinare la tua vita"
        }
      },
      purpose = {
        talk = {},
        mission = {
            {
              quest = "tutorial",
              completed = false
            }
        }
      },
      reward = {
        money = 10,
        exp = 10,
        food = "A0006"
      }
    }
  },
  speak = {
    {"ciao io sono jeff", "asd asd asd"},
    {"blablabla", "bla bala lasd"},
    {"asdfasfas","asdasf","fasdfasds"},
    {"adsa","asdasf","fasdfasds"},
    {"asdfasssfas","asdasf","fasdfajhgjgsds"},
    {"asdfasfdsdsas","fghfg","fasdfasds"}
  }
}
