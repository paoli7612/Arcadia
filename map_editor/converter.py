
class Converter:
    def __init__(self, program):
        self.program = program
        self.file_exist = True
        try: self.lua_file = open(self.program.path_maps,"r")
        except: self.file_exist = False; return
        self.lua_text = str()

        # remove cumments
        for row in self.lua_file:
            row = row.strip()
            if "--" in row: row = row.split("--")[0]
            self.lua_text += row

        # remove \t and \n
        try: self.lua_text = self.lua_text.translate(None, '\t\n ')
        except: self.lua_text = self.lua_text.translate('\t\n ')

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
                if len(properties) >= 3: p.append(properties)
            self.properties[property] = p

        #split dict

        def get_int(str): return int(str.split("=")[1])
        def get_str(str): return str.split("=")[1].split("\"")[1]

        for pos,(id, color, type) in enumerate(self.properties["walls"]):
            self.properties["walls"][pos] = {"id": get_int(id),"bloke": get_str(color),"type": get_int(type)-1}
        for pos,(id, bloke, type) in enumerate(self.properties["floors"]):
            self.properties["floors"][pos] = {"id": get_int(id),"bloke": get_str(bloke),"type": get_int(type)-1}
        for pos,(id, dest, dest_x, dest_y, type) in enumerate(self.properties["doors"]):
            self.properties["doors"][pos] = {"id": get_int(id),"dest": get_str(dest),"dest_x": get_int(dest_x), "dest_y": get_int(dest_y),"type": get_int(type)-1}
        for pos,(type, coord_x, coord_y) in enumerate(self.properties["decor"]):
            self.properties["decor"][pos] = {"type": get_str(type), "coord_x": get_int(coord_x), "coord_y": get_int(coord_y)}
        for pos,(color, coord_x, coord_y) in enumerate(self.properties["torch"]):
            self.properties["torch"][pos] = {"color": get_str(color), "coord_x": get_int(coord_x), "coord_y": get_int(coord_y)}
        for pos,(text, coord_x, coord_y) in enumerate(self.properties["cartel"]):
            self.properties["cartel"][pos] = {"text": get_str(text), "coord_x": get_int(coord_x), "coord_y": get_int(coord_y)}
        for pos,(type, coord_x, coord_y, allow_x, allow_y) in enumerate(self.properties["npc"]):
            self.properties["npc"][pos] = {"type": get_str(type),"coord_x": get_int(coord_x), "coord_y": get_int(coord_y),"allow_x": get_int(allow_x), "allow_y": get_int(allow_y)}

    def show(self):
        for k,vv in self.properties.items():
            print(k)
            for v in vv: print(v)
