import pygame, time, os
from setting import Setting
from spritesheet import Spritesheet
from converter import Converter
from map import Map
from builder import Builder
from argparser import Argparser
from selector import Selector

try: input = raw_input
except: pass

class Program:
    def __init__(self,arg):
        pygame.init()
        self.opt = Setting()
        self.name_map = arg.name_map
        self.screen = pygame.display.set_mode((self.opt.WIDTH + self.opt.TILE_SIZE*3,self.opt.HEIGHT + self.opt.TILE_SIZE*5))
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
        self.loop()
        pygame.quit()

    def set_grill_surface(self):
        self.grill = self.screen.copy()
        for y in range(0, self.opt.HEIGHT+1, self.opt.TILE_SIZE): pygame.draw.line(self.grill, (255,255,255), (0, y), (self.opt.WIDTH, y))
        for x in range(0, self.opt.WIDTH+1, self.opt.TILE_SIZE): pygame.draw.line(self.grill, (255,255,255), (x, 0), (x, self.opt.HEIGHT))
        self.grill.set_colorkey((0,0,0))

    def set_creation_screen(self):
        self.creation_screen = pygame.Surface((self.opt.TILE_SIZE*3,self.opt.HEIGHT))
        self.creation_screen.fill((150,150,150))
        self.all_walls = list()
        self.all_floors = list()

        y = 0
        for code, image in self.images.images["basictiles"]["wall"].items():
            self.creation_screen.blit(image, (0, y))
            self.all_walls.append((code,type))
            y += self.opt.TILE_SIZE

        y = 0
        for code, image in self.images.images["basictiles"]["floor"].items():
            self.creation_screen.blit(image, (self.opt.TILE_SIZE, y))
            self.all_floors.append((code,type))
            y += self.opt.TILE_SIZE

    def set_properties_screen(self):
        self.properties_screen = pygame.Surface((self.opt.WIDTH, self.opt.TILE_SIZE*5))
        self.properties_screen.fill((200,200,200))
        self.list_walls = list()
        self.list_floors = list()
        self.list_doors = list()
        self.list_decors = list()
        self.list_npc = list()

        x = 0
        for wall in self.converter.properties["walls"]:
            self.properties_screen.blit(self.images.images["basictiles"]["wall"][wall["bloke"]][wall["type"]], (x, 0))
            self.list_walls.append(wall["id"])
            x += self.opt.TILE_SIZE

        x = 0
        for floor in self.converter.properties["floors"]:
            self.properties_screen.blit(self.images.images["basictiles"]["floor"][floor["bloke"]][floor["type"]], (x, self.opt.TILE_SIZE))
            self.list_floors.append(floor["id"])
            x += self.opt.TILE_SIZE

        x = 0
        for name, image in self.images.images["basictiles"]["decor"].items():
            self.properties_screen.blit(image, (x, self.opt.TILE_SIZE*2))
            self.list_decors.append(name)
            x += self.opt.TILE_SIZE

        x = 0
        for name, image in self.images.images["characters"].items():
            self.properties_screen.blit(image, (x, self.opt.TILE_SIZE*3))
            self.list_npc.append(name)
            x += self.opt.TILE_SIZE

        x = 0
        for name,image in self.images.images["basictiles"]["door"].items():
            print("qui",image)
            self.properties_screen.blit(image, (x, self.opt.TILE_SIZE*4))
            self.list_doors.append(type)
            x += self.opt.TILE_SIZE


    def loop(self):
        self.set_properties_screen()
        self.set_creation_screen()
        self.running = True
        self.pause = False
        while self.running:
            self.converter.update()
            self.clock.tick(50)
            self.selector.update()
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    self.running = False
                elif event.type == pygame.KEYDOWN:
                    if event.key == pygame.K_ESCAPE: self.pause = not self.pause
                    elif event.key == pygame.K_s: self.builder.save()
                elif event.type == pygame.MOUSEBUTTONDOWN:
                    if event.button == 1: self.selector.click()
                    if event.button == 3: self.selector.remove()
                elif event.type == pygame.MOUSEMOTION:
                    if event.buttons[0] == 1: self.selector.click()
                    if event.buttons[2] == 1: self.selector.remove()
            self.screen.fill((0,0,0))
            self.screen.blit(self.map.screen,(0,0))
            self.screen.blit(self.grill,(0,0))
            self.screen.blit(self.properties_screen, (0, self.opt.HEIGHT))
            self.screen.blit(self.creation_screen, (self.opt.WIDTH, 0))
            self.selector.draw(self.screen)
            pygame.display.flip()

# test
if __name__ == "__main__":
    a = Argparser()
    if a.start:
        g = Program(a)




# now we start with "python main.py [map_name]"
