
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


        self.data = self.lua_text.split("{")[2].split("}")[0].split(",")
        self.properties = dict()

        # get text
        self.properties["walls"] = self.lua_text.split("walls")[1].split("floors")[0]
        self.properties["floors"] = self.lua_text.split("floors")[1].split("doors")[0]
        self.properties["doors"] = self.lua_text.split("doors")[1].split("npc")[0]
        self.properties["npc"] = self.lua_text.split("npc")[1].split("decor")[0]
        self.properties["decor"] = self.lua_text.split("decor")[1].split("torch")[0]
        self.properties["torch"] = self.lua_text.split("torch")[1].split("cartel")[0]
        self.properties["cartel"] = self.lua_text.split("cartel")[1]

        # split text
        for property in self.properties:
            p = list()
            for a in self.properties[property].split("}"):
                properties = a.split("{")[-1].split(",")
                if len(properties) >= 3:
                    p.append(properties)
            self.properties[property] = p

    def show(self):
        for k,vv in self.properties.items():
            print(k)
            for v in vv: print(v)
