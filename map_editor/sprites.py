import template
from box import get_door_param, get_cartel_param, get_npc_param, get_lever_param, get_chest_param


TYPES_NAME = "wall floor door npc decor torch cartel water lever chest".split()

def get_int(str): return int(str.split("=")[1])
def get_str(str): return str.split("=")[1].split("\"")[1]

class Wall:
    def __init__(self, code, coord_x, coord_y):
        try: code, coord_x, coord_y = get_str(code), get_int(coord_x), get_int(coord_y)
        except: pass
        self.dict = {"code": code, "coord_x":coord_x, "coord_y": coord_y}
        self.param = (code, coord_x, coord_y)
        self.LAYER = "1:" + str(coord_x) + "-" + str(coord_y)

    def __str__(self): return (template.wall % self.param)
    def __getitem__(self, key): return self.dict[key]

class Floor:
    def __init__(self, code, coord_x, coord_y):
        try: code, coord_x, coord_y = get_str(code), get_int(coord_x), get_int(coord_y)
        except: pass
        self.dict = {"code": code, "coord_x":coord_x, "coord_y": coord_y}
        self.param = (code, coord_x, coord_y)
        self.LAYER = "1:" + str(coord_x) + "-" + str(coord_y)

    def __str__(self): return (template.floor % self.param)
    def __getitem__(self, key): return self.dict[key]

class Door:
    def __init__(self, dest, code, coord_x, coord_y, dest_x, dest_y, id):
        try:
            dest, code, id =  get_str(dest), get_str(code), get_int(id)
            coord_x, coord_y = get_int(coord_x), get_int(coord_y)
            dest_x, dest_y = get_int(dest_x), get_int(dest_y)
        except: pass
        self.dict = {"dest":dest,"code":code,"coord_x":coord_x,"coord_y":coord_y,"dest_x":dest_x,"dest_y":dest_y,"id":id}
        self.param = (dest, code, coord_x, coord_y, dest_x, dest_y, id)
        self.LAYER = "2:" + str(coord_x) + "-" + str(coord_y)

    def __str__(self): return (template.door % self.param)
    def __getitem__(self, key): return self.dict[key]

class Npc:
    def __init__(self, code, coord_x, coord_y, allow_x, allow_y, nickname):
        try:
            code, nickname = get_str(code), get_str(nickname)
            coord_x, coord_y = get_int(coord_x), get_int(coord_y)
            allow_x, allow_y = get_int(allow_x), get_int(allow_y)

        except: pass
        self.dict = {"code": code, "coord_x": coord_x, "coord_y": coord_y, "allow_x": allow_x, "allow_y": allow_y, "nickname": nickname}
        self.param = (code, coord_x, coord_y, allow_x, allow_y, nickname)
        self.LAYER = "2:" + str(coord_x) + "-" + str(coord_y)

    def __str__(self): return (template.npc % self.param)
    def __getitem__(self, key): return self.dict[key]

class Decor:
    def __init__(self, code, coord_x, coord_y):
        try: code, coord_x, coord_y = get_str(code), get_int(coord_x), get_int(coord_y)
        except: pass
        self.dict = {"code": code, "coord_x": coord_x, "coord_y": coord_y}
        self.param = (code, coord_x, coord_y)
        self.LAYER = "2:" + str(coord_x) + "-" + str(coord_y)

    def __str__(self): return (template.decor % self.param)
    def __getitem__(self, key): return self.dict[key]

class Torch:
    def __init__(self, code, coord_x, coord_y):
        try: code, coord_x, coord_y = get_str(code), get_int(coord_x), get_int(coord_y)
        except: pass
        self.dict = {"code": code, "coord_x": coord_x, "coord_y": coord_y}
        self.param = (code, coord_x, coord_y)
        self.LAYER = "2:" + str(coord_x) + "-" + str(coord_y)

    def __str__(self): return (template.torch % self.param)
    def __getitem__(self, key): return self.dict[key]

class Water:
    def __init__(self, code, coord_x, coord_y):
        try: code, coord_x, coord_y = get_str(code), get_int(coord_x), get_int(coord_y)
        except: pass
        self.dict = {"code": code, "coord_x": coord_x, "coord_y": coord_y}
        self.param = (code, coord_x, coord_y)
        self.LAYER = "1:" + str(coord_x) + "-" + str(coord_y)

    def __str__(self): return (template.torch % self.param)
    def __getitem__(self, key): return self.dict[key]

class Cartel:
    def __init__(self, text, code, coord_x, coord_y):
        try:
            text, code = get_str(text), get_str(code)
            coord_x, coord_y = get_int(coord_x), get_int(coord_y)
        except: pass

        self.dict = {"text": text, "code": code, "coord_x": coord_x, "coord_y": coord_y}
        self.param = (text, code, coord_x, coord_y)
        self.LAYER = "2:" + str(coord_x) + "-" + str(coord_y)

    def __str__(self): return (template.cartel % self.param)
    def __getitem__(self, key): return self.dict[key]

class Lever:
    def __init__(self, datasheet, code, coord_x, coord_y):
        try:
            datasheet, code = get_str(datasheet), get_str(code)
            coord_x, coord_y = get_int(coord_x), get_int(coord_y)
        except: pass

        self.dict = {"datasheet": datasheet, "code": code, "coord_x": coord_x, "coord_y": coord_y}
        self.param = (datasheet, code, coord_x, coord_y)
        self.LAYER = "2:" + str(coord_x) + "-" + str(coord_y)

    def __str__(self): return (template.cartel % self.param)
    def __getitem__(self, key): return self.dict[key]

class Chest:
    def __init__(self, datasheet, code, coord_x, coord_y):
        try:
            datasheet, code = get_str(datasheet), get_str(code)
            coord_x, coord_y = get_int(coord_x), get_int(coord_y)
        except: pass

        self.dict = {"datasheet": datasheet, "code": code, "coord_x": coord_x, "coord_y": coord_y}
        self.param = (datasheet, code, coord_x, coord_y)
        self.LAYER = "2:" + str(coord_x) + "-" + str(coord_y)

    def __str__(self): return (template.chest % self.param)
    def __getitem__(self, key): return self.dict[key]


def newSprite(type_name, param):
    if type_name == "wall": return Wall(*param)
    elif type_name == "floor": return Floor(*param)
    elif type_name == "door": return Door(*param)
    elif type_name == "npc": return Npc(*param)
    elif type_name == "decor": return Decor(*param)
    elif type_name == "torch": return Torch(*param)
    elif type_name == "cartel": return Cartel(*param)
    elif type_name == "water": return Water(*param)
    elif type_name == "lever": return Lever(*param)
    elif type_name == "chest": return Chest(*param)

def newSprite_code(code, x, y):
    f = int(code[0])
    if f == 0: return Wall(code,x,y), "wall"
    elif f == 1: return Floor(code,x,y), "floor"
    elif f == 2: return Decor(code,x,y), "decor"
    elif f == 3:
        param = get_door_param()
        return Door(param["dest"],code,x,y,int(param["dest_x"]),int(param["dest_y"]),int(param["id"])), "door"
    elif f == 4: return Torch(code,x,y), "torch"
    elif f == 5:
        param = get_cartel_param()
        return Cartel(param["text"],code,x,y), "cartel"
    elif f == 6:
        param = get_npc_param()
        return Npc(code,x,y,int(param["allow_x"]),int(param["allow_y"]),param["nickname"]), "npc"
    elif f == 7: return Water(code,x,y), "water"
    elif f == 8:
        param = get_lever_param()
        return Lever(code,param["datasheet"],x,y), "lever"
    elif f == 9:
        param = get_chest_param()
        return Lever(code,param["datasheet"],x,y), "chest"
