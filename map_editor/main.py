import pygame, time, os
from setting import Setting
from spritesheet import Spritesheet
from converter import Converter
from map import Map
from builder import Builder
from argparser import Argparser

try: input = raw_input
except: pass

class Program:
    def __init__(self,arg):
        self.opt = Setting()
        self.name_map = arg.name_map
        self.screen = pygame.display.set_mode((self.opt.SIZE))
        self.set_grill_surface()
        pygame.display.set_caption(self.opt.TITLE)
        self.path = os.path.dirname(__file__)
        self.path_img = os.path.join(self.path, ".." , "src", "img")
        self.images = Spritesheet(self)
        self.path_maps = os.path.join(self.path, ".." , "src", "maps", self.name_map + self.opt.LUA_FORMAT)
        if os.path.exists(self.path_maps): self.mode = "change"
        else: self.mode = "create"
        self.builder = Builder(self)
        self.clock = pygame.time.Clock()
        self.converter = Converter(self)
        self.map = Map(self)
        self.selector = Selector(self)
        self.loop()
        pygame.quit()
        #if input(("Salvare la mappa come <%s.lua>? (y/n) " %self.name_map)) == "y":
        self.builder.save()


    def set_grill_surface(self):
        self.grill = self.screen.copy()
        for y in range(0, self.opt.HEIGHT, self.opt.TILE_SIZE):
            pygame.draw.line(self.grill, (255,255,255), (0, y), (self.opt.WIDTH, y))
        for x in range(0, self.opt.WIDTH, self.opt.TILE_SIZE):
            pygame.draw.line(self.grill, (255,255,255), (x, 0), (x, self.opt.HEIGHT))
        self.grill.set_colorkey((0,0,0))


    def loop(self):
        self.running = True
        self.pause = False
        self.show_help()
        while self.running:
            self.clock.tick(50)
            self.selector.update()
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    self.running = False
                elif event.type == pygame.KEYDOWN:
                    if event.key == pygame.K_ESCAPE: self.pause = True
                    elif event.key == pygame.K_w: self.add_property()
                    elif event.key == pygame.K_e: self.del_property()
                    elif event.key == pygame.K_r: self.show_properties()
                    elif event.key == pygame.K_q: self.select_id()

                    elif event.key == pygame.K_h: self.show_help()
                elif event.type == pygame.MOUSEBUTTONDOWN:
                    if event.button == 1: self.map.matrix[self.selector.y][self.selector.x] = self.selector.id
                elif event.type == pygame.MOUSEMOTION:
                    if event.buttons[0] == 1: self.map.matrix[self.selector.y][self.selector.x] = self.selector.id
            self.map.load_matrix()
            self.screen.blit(self.map.screen,(0,0))
            self.screen.blit(self.grill,(0,0))
            self.selector.draw(self.screen)
            pygame.display.flip()

    def show_help(self):
        print("HELP")
        print("press 'q' to change id of block")
        print("press 'w' to add a property")
        print("press 'e' to del a property")
        print("press 'r' to show all properties")
        print("press 'h' to show help")

    def show_properties(self):
        print("SHOW PROPERTIES")
        for property,dict in self.converter.properties.items():
            print(property)
            for d in dict:
                print(d)

    def add_property(self):
        print("ADD PROPERTIES")


    def del_property(self):
        print("DEL PROPERTIES")

    def select_id(self):
        print("SELECT ID")
        try: self.selector.id = int(input("type id to insert: "))
        except: print("ID invalit")

class Selector(pygame.sprite.Sprite):
    def __init__(self,program):
        self.program = program
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.Surface((self.program.opt.TILE_SIZE,self.program.opt.TILE_SIZE))
        pygame.draw.rect(self.image, (255,255,255), (0, 0, self.program.opt.TILE_SIZE,self.program.opt.TILE_SIZE ), 5)
        self.image.set_colorkey((0,0,0))
        self.rect = self.image.get_rect()
        self.id = 1

    def update(self):
        x,y = pygame.mouse.get_pos()
        self.x = int(x/self.program.opt.TILE_SIZE)
        self.y = int(y/self.program.opt.TILE_SIZE)
        self.rect.topleft = self.x*self.program.opt.TILE_SIZE,self.y*self.program.opt.TILE_SIZE

    def draw(self, surface):
        surface.blit(self.image, self.rect.topleft)


# test
if __name__ == "__main__":
    a = Argparser()
    if a.start:
        g = Program(a)




# now we start with "python main.py [map_name]"
