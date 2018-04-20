import pygame, time, os
from setting import Setting

class Game:
    def __init__(self):
        self.opt = Setting()
        self.screen = pygame.display.set_mode((self.opt.SIZE))
        pygame.display.set_caption(self.opt.TITLE)
        self.path = os.getcwd()
        self.path_maps = os.path.join(self.path, ".." , "src", "img")

    def load_map(self, name_map):
        print(os.path.join(self.path_maps, name_map) + self.opt.LUA_FORMAT)

g = Game()
g.load_map("village")
g.load_map("castle")
g.load_map("spawn")
time.sleep(2)
