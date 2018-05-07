return {
  name = "steve",
  quests = {
      {
      name = "tutorial",
      level_required = 1,
      completed = false,
      started = false,
      state = 1,
      chat = {
        start = {
          "ciao blabla",
          "missione tutorial",
          "ricompensa è 10 soldi e 10 esperienza",
          "bla bla vai a parlare con andy ed emily"
        },
        state = {
          "sei ancora qui?",
          "vai a parlare con andy"
        },
        quit = {
          "ottimo lavoro",
          "bla bla bla",
          "ottimo ecco la ricompensa"
        }
      },
      purpose = {
        talk = {
          {
            npc = "andy",
            map = "spawn",
            completed = false,
            chat = {
              "ciao vedo che stai risolvendo la tua prima quest",
              "io sono andy e bla bla bla",
              "torna da steve per avere la tua ricompensa"
            }
          },
          {
            npc = "emily",
            map = "spawn",
            completed = false,
            chat = {
              "ciao vedo che stai risolvendo la tua prima quest",
              "io sono emily e bla bla bla",
              "torna da steve per avere la tua ricompensa"
            }
          }
        }
      },
      reward = {
        money = 10,
        exp = 10
      }
    }
  },
  speak = {
    {"Hei ciao come va", "io mi chiamo steve", "bla bla bla"},
    {"ciao sono andy e vivo nel villaggio qiui vicino", "bla bla bla"},
    {"bla bla bla bla", "bla bla bla bla bla bla bla", "bla bla bla"},
  }
}
