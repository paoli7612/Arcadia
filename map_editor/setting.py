
class Setting:
    TITLE = "Map editor"
    TILE_SIZE = 20
    TILE = TILE_X, TILE_Y = 40,25
    WIDTH = TILE_X * TILE_SIZE
    HEIGHT = TILE_Y * TILE_SIZE
    SIZE = WIDTH, HEIGHT

    LUA_FORMAT = ".lua"
    IMAGE_FORMAT = ".png"
    JSON_FORMAT = ".json"

    class Colors:
        BLACK = (0,0,0)
        WHITE = (255,255,255)
        RED = (255,0,0)
        GREEN = (0,255,0)
        BLUE = (0,0,255)

    FONT_COLOR = Colors.GREEN
