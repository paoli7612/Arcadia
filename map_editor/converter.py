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
        for row in (self.lua_list):
            if not row:
                continue
            for prop in PROPERTIES:
                if prop in row:
                    print(prop)
                    print(row.split(",")[:-1])
            print(row)
            print
