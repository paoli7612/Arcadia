import os
class Setting:
    def __init__(self):
        self.TITLE = "Map editor"
        path = os.path.dirname(__file__)
        path_setting = os.path.join(path, "setting")
        text = open(path_setting,"r").read()
        self.TILE_SIZE = int(text.split("=")[1])
        self.TILE = self.TILE_X, self.TILE_Y = 40,25
        self.WIDTH = self.TILE_X * self.TILE_SIZE
        self.HEIGHT = self.TILE_Y * self.TILE_SIZE
        self.SIZE = self.WIDTH, self.HEIGHT

        self.LUA_FORMAT = ".lua"
        self.IMAGE_FORMAT = ".png"
        self.JSON_FORMAT = ".json"

        self.TOOLBAR_X = self.TILE_SIZE * 19
        self.TOOLBAR_Y = self.HEIGHT + self.TILE_SIZE * 3


        class Colors:
            BLACK = (0,0,0)
            WHITE = (255,255,255)
            RED = (255,0,0)
            GREEN = (0,255,0)
            BLUE = (0,0,255)
        self.Colors = Colors
        self.FONT_COLOR = Colors.WHITE
        self.FONT_COLOR_CHOICE = {True: Colors.GREEN, False: Colors.RED}
