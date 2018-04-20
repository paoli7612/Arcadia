
class Setting:
    TITLE = "Map editor"
    TILE_SIZE = 20
    TILE = TILE_X, TILE_Y = 40,25
    SIZE = WIDTH, HEIGHT = TILE_X * TILE_SIZE ,TILE_Y * TILE_SIZE
    LUA_FORMAT = ".lua"
    class Colors:
        BLACK = (0,0,0)
        WHITE = (255,255,255)
        RED = (255,0,0)
        GREEN = (0,255,0)
        BLUE = (0,0,255)

    def __init__(self):
        pass
