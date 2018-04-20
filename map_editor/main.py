import pygame, time, os
from setting import Setting

class Game:
    def __init__(self, argv):
        self.opt = Setting()
        self.name_map = argv[1]
        self.screen = pygame.display.set_mode((self.opt.SIZE))
        pygame.display.set_caption(self.opt.TITLE)
        self.path = os.path.dirname(__file__)
        self.path_maps = os.path.join(self.path, ".." , "src", "maps")
        self.path_img = os.path.join(self.path, ".." , "src", "img")
        self.load_map()
        self.load_images()

    def load_images(self):
        print(os.listdir(self.path_img))

    def load_map(self):
        self.map_file = open(os.path.join(self.path_maps, self.name_map)
                        + self.opt.LUA_FORMAT, "r")
        print(self.map_file.read())



# test
if __name__ == "__main__":
    import sys
    g = Game(sys.argv)
    time.sleep(2)

# now we start with "python main.py [map_name]"
