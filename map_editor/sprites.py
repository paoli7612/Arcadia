import template

TYPES_NAME_SECONDARY = "door npc decor torch cartel".split()
TYPES_NAME_PRIMARY = "wall floor".split()
TYPES_NAME = TYPES_NAME_SECONDARY + TYPES_NAME_PRIMARY

def get_int(str): return int(str.split("=")[1])
def get_str(str): return str.split("=")[1].split("\"")[1]


class Wall:
    def __init__(self, id, code):
        id, code = get_int(id), get_str(code)
        self.dict = {"id": id, "code": code}
        self.param = (id, code)
        self.LAYER = 1

    def __str__(self): return (template.wall % self.param)
    def __getitem__(self, key): return self.dict[key]

class Floor:
    def __init__(self, id, code):
        id, code = get_int(id), get_str(code)
        self.dict = {"id": id, "code": code}
        self.param = (id, code)
        self.LAYER = 2

    def __str__(self): return (template.floor % self.param)
    def __getitem__(self, key): return self.dict[key]

class Door:
    def __init__(self, dest, code, coord_x, coord_y, dest_x, dest_y):
        dest, code =  get_str(dest), get_str(code)
        coord_x, coord_y = get_int(coord_x), get_int(coord_y)
        dest_x, dest_y = get_int(dest_x), get_int(dest_y)
        self.dict = {"dest":dest,"code":code,"coord_x":coord_x,"coord_y":coord_y,"dest_x":dest_x,"dest_y":dest_y}
        self.param = (dest, code, coord_x, coord_y, dest_x, dest_y)
        self.LAYER = 3

    def __str__(self): return (template.door % self.param)
    def __getitem__(self, key): return self.dict[key]


class Npc:
    def __init__(self, code, coord_x, coord_y, allow_x, allow_y):
        code = get_str(code)
        coord_x, coord_y = get_int(coord_x), get_int(coord_y)
        allow_x, allow_y = get_int(allow_x), get_int(allow_y)
        self.dict = {"code": code, "coord_x": coord_x, "coord_y": coord_y, "allow_x": allow_x, "allow_y": allow_y}
        self.param = (code, coord_x, coord_y, allow_x, allow_y)
        self.LAYER = 4

    def __str__(self): return (template.npc % self.param)
    def __getitem__(self, key): return self.dict[key]


class Decor:
    def __init__(self, code, coord_x, coord_y):
        code, coord_x, coord_y = get_str(code), get_int(coord_x), get_int(coord_y)
        self.dict = {"code": code, "coord_x": coord_x, "coord_y": coord_y}
        self.param = (code, coord_x, coord_y)
        self.LAYER = 5

    def __str__(self): return (template.Decor % self.param)
    def __getitem__(self, key): return self.dict[key]


class Torch:
    def __init__(slef, code, coord_x, coord_y):
        code, coord_x, coord_y = get_str(code), get_int(coord_x), get_int(coord_y)
        self.dict = {"code": code, "coord_x": coord_x, "coord_y": coord_y}
        self.param = (code, coord_x, coord_y)
        self.LAYER = 6

    def __str__(self): return (template.torch % self.param)
    def __getitem__(self, key): return self.dict[key]

class Cartel:
    def __init__(self, text, code, coord_x, coord_y):
        text, code = get_str(text), get_str(code)
        coord_x, coord_y = get_int(coord_x), get_int(coord_y)

        self.dict = {"text": text, "code": code, "coord_x": coord_x, "coord_y": coord_y}
        self.param = (text, code, coord_x, coord_y)
        self.LAYER = 7

    def __str__(self): return (template.cartel % self.param)
    def __getitem__(self, key): return self.dict[key]

def newSprite(type_name, param):
    if type_name == "wall": return Wall(*param)
    elif type_name == "floor": return Floor(*param)
    elif type_name == "door": return Door(*param)
    elif type_name == "npc": return Npc(*param)
    elif type_name == "decor": return Decor(*param)
    elif type_name == "torch": return Torch(*param)
    elif type_name == "cartel": return Cartel(*param)
