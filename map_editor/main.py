import pygame, time, os
from setting import Setting
from spritesheet import Spritesheet
from converter import Converter
from map import Map
from builder import Builder
from argparser import Argparser
from selector import Selector
from toolbar import Toolbar

try: input = raw_input
except: pass

class Program:
    def __init__(self, arg):
        pygame.init()
        self.opt = Setting()
        self.name_map = arg.name_map
        self.screen = pygame.display.set_mode((self.opt.WIDTH + self.opt.TILE_SIZE + self.opt.TOOLBAR_X,self.opt.HEIGHT + self.opt.TILE_SIZE*3))
        self.set_grill_surface()
        pygame.display.set_caption(self.opt.TITLE)
        self.path = os.path.dirname(__file__)
        self.path_img = os.path.join(self.path, ".." , "src", "img")
        self.images = Spritesheet(self)
        self.path_maps = os.path.join(self.path, ".." , "src", "maps", self.name_map + self.opt.LUA_FORMAT)
        self.create = not os.path.exists(self.path_maps)
        self.builder = Builder(self)
        self.clock = pygame.time.Clock()
        self.converter = Converter(self)
        self.map = Map(self)
        self.selector = Selector(self)
        self.toolbar = Toolbar(self)
        self.saved = True
        self.loop()
        pygame.quit()

    def set_grill_surface(self):
        self.grill = self.screen.copy()
        for y in range(0, self.opt.HEIGHT+1, self.opt.TILE_SIZE): pygame.draw.line(self.grill, (255,255,255), (0, y), (self.opt.WIDTH, y))
        for x in range(0, self.opt.WIDTH+1, self.opt.TILE_SIZE): pygame.draw.line(self.grill, (255,255,255), (x, 0), (x, self.opt.HEIGHT))
        self.grill.set_colorkey((0,0,0))

    def draw(self):
        self.screen.fill((0,0,0))
        self.screen.blit(self.map.screen,(0,0))
        self.screen.blit(self.grill,(0,0))
        self.toolbar.draw(self.screen)
        self.selector.draw(self.screen)
        if self.saved: self.selector.write("Saved", 1)
        pygame.display.flip()

    def event(self):
        for event in pygame.event.get():
            if event.type == pygame.QUIT: self.running = False
            elif event.type == pygame.KEYDOWN:
                if event.key == pygame.K_ESCAPE: self.pause = not self.pause
                elif event.key == pygame.K_s: self.builder.save(); self.saved = True
            elif event.type == pygame.MOUSEBUTTONDOWN:
                if event.button == 1: self.selector.click()
                if event.button == 3: self.selector.remove()
            elif event.type == pygame.MOUSEMOTION:
                if event.buttons[0] == 1: self.selector.click()
                if event.buttons[2] == 1: self.selector.remove()


    def update(self):
        self.converter.update()
        self.selector.update()


    def loop(self):
        self.running = True
        self.pause = False
        while self.running:
            self.clock.tick(50)
            self.update()
            self.event()
            self.draw()

# test
if __name__ == "__main__":
    a = Argparser()
    g = Program(a)




# now we start with "python main.py [map_name]"
