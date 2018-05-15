return {
  name = "guardia2",
  quests = {
    {
      name = "test",
      level_required = 1,
      completed = false,
      started = false,
      state = 1,
      chat = {
        start = {"quest test", "prove per salvare"},
        state = {"quest test", "prove per salvare"},
        quit = {"quest completata", "guarda ricompensa"}
      },
      purpose = {
        talk = {
          {
            npc = "guardia1",
            map = "street",
            completed = false,
            chat = {
              "altra guardia prova", "bho"
            }
          }
        },
        mission = {}
      },
      reward = {
        money = 10,
        exp = 10
      }
    }
  },
  speak = {
    {"g2"}
  }
}
