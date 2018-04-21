PROPERTIES = "walls floors doors npc decor torch cartel".split()

class Converter:
    def __init__(self, program):
        self.program = program
        self.lua_file = open(self.program.path_maps,"r")
        self.lua_text = str()

        # remove cumments
        for row in self.lua_file:
            row = row.strip()
            if "--" in row:
                row = row.split("--")[0]
            self.lua_text += row

        # remove \t and \n
        self.lua_text = self.lua_text.translate(None, '\t\n ')

        self.lua_list = self.lua_text.split("{")

        self.data = self.lua_list[2].split("}")[0]

        walls = self.lua_text.split("walls")[1].split("floors")[0]
        print("WALLS", walls)
        floors = self.lua_text.split("floors")[1].split("doors")[0]
        print("FLOORS", floors)
        doors = self.lua_text.split("doors")[1].split("npc")[0]
        print("DOORS", doors)
        npc = self.lua_text.split("npc")[1].split("decor")[0]
        print("NPC", npc)
        decor = self.lua_text.split("decor")[1].split("torch")[0]
        print("DECOR", decor)
        torch = self.lua_text.split("torch")[1].split("cartel")[0]
        print("TORCH", torch)
        cartel = self.lua_text.split("cartel")[1]
        print("CARTEL", cartel)


        a = """
        for row in (self.lua_list):
            if not row:
                continue
            for prop in PROPERTIES:
                if prop in row:
                    print(prop)
                    print(row.split(",")[:-1])
            print(row)
            print"""
