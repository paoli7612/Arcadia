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
        self.screen = pygame.display.set_mode((self.opt.WIDTH,self.opt.HEIGHT + self.opt.TILE_SIZE*3))
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
        for y in range(0, self.opt.HEIGHT+1, self.opt.TILE_SIZE):
            pygame.draw.line(self.grill, (255,255,255), (0, y), (self.opt.WIDTH, y))
        for x in range(0, self.opt.WIDTH+1, self.opt.TILE_SIZE):
            pygame.draw.line(self.grill, (255,255,255), (x, 0), (x, self.opt.HEIGHT))
        self.grill.set_colorkey((0,0,0))

    def set_properties_screen(self):
        self.properties_screen = pygame.Surface((self.opt.WIDTH, self.opt.TILE_SIZE*3))
        self.properties_screen.fill((200,200,200))
        self.list_properties = list()
        x = 0
        for wall in self.converter.properties["walls"]:
            self.properties_screen.blit(self.images.images["basictiles"]["wall"][wall["color"]][wall["type"]], (x, 0))
            self.list_properties.append(wall["id"])
            x += self.opt.TILE_SIZE
        for floor in self.converter.properties["floors"]:
            self.properties_screen.blit(self.images.images["basictiles"]["floor"][floor["bloke"]][floor["type"]], (x, 0))
            self.list_properties.append(floor["id"])
            x += self.opt.TILE_SIZE

        self.list_decors = list()
        x = 0
        for name, image in self.images.images["basictiles"]["decor"].items():
            self.properties_screen.blit(image, (x, self.opt.TILE_SIZE))
            self.list_decors.append(name)
            x += self.opt.TILE_SIZE

        self.list_npc = list()
        x = 0
        for name, image in self.images.images["characters"].items():
            self.properties_screen.blit(image, (x, self.opt.TILE_SIZE*2))
            self.list_npc.append(name)
            x += self.opt.TILE_SIZE


    def loop(self):
        self.set_properties_screen()
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
                    if event.key == pygame.K_ESCAPE: self.pause = not self.pause
                    elif event.key == pygame.K_w: self.add_property()
                    elif event.key == pygame.K_e: self.del_property()
                    elif event.key == pygame.K_r: self.show_properties()
                    elif event.key == pygame.K_q: self.select_id()
                    elif event.key == pygame.K_s: self.builder.save()
                    elif event.key == pygame.K_h: self.show_help()
                elif event.type == pygame.MOUSEBUTTONDOWN:
                    if event.button == 1: self.selector.click()
                elif event.type == pygame.MOUSEMOTION:
                    if event.buttons[0] == 1: self.selector.click()
            self.screen.fill((0,0,0))
            self.screen.blit(self.map.screen,(0,0))
            self.screen.blit(self.grill,(0,0))
            self.screen.blit(self.properties_screen, (0, self.opt.HEIGHT))
            self.selector.draw(self.screen)
            pygame.display.flip()

    def show_help(self):
        print("HELP")
        print("press 'q' to change id of block")
        print("press 'w' to add a property")
        print("press 'e' to del a property")
        print("press 'r' to show all properties")
        print("press 'h' to show help")
        print("press 's' to save")

    def show_properties(self):
        print("SHOW PROPERTIES")
        for property,dict in self.converter.properties.items():
            print(property)
            for d in dict:
                print(d)

    def add_property(self):
        print("ADD PROPERTIES")
        try:
            element = int(input("select element: 1)wall 2)floor 3)door 4)npc 5)decor 6)torch 7)cartel\n -> "))
            if element == 1: # WALL
                d = dict()
                d["id"] = self.get_new_id("walls")
                d["color"] = input("color -> ")
                d["type"] = int(input("type -> "))
                self.converter.properties["walls"].append(d)
            if element == 2: # FLOOR
                d = dict()
                d["id"] = self.get_new_id("floors")
                d["bloke"] = input("bloke -> ")
                d["type"] = int(input("type -> "))
                self.converter.properties["floors"].append(d)
        except:
            print("insert invalid")
        self.map.load_matrix()
        self.set_properties_screen()


    def del_property(self):
        print("DEL PROPERTIES")
        self.set_properties_screen()

    def select_id(self):
        print("SELECT ID")
        try: self.selector.id = int(input("type id to insert: "))
        except: print("ID invalit")

    def get_new_id(self, item):
        if item == "walls":
            for wall in self.converter.properties["walls"]: last_id = wall["id"]
        elif item == "floors":
            for floor in self.converter.properties["floors"]: last_id = floor["id"]
        elif item == "doors":
            for door in self.converter.properties["doors"]: last_id = door["id"]
        return last_id + 1

class Selector(pygame.sprite.Sprite):
    def __init__(self,program):
        self.program = program
        pygame.sprite.Sprite.__init__(self)
        self.image = pygame.Surface((self.program.opt.TILE_SIZE,self.program.opt.TILE_SIZE))
        pygame.draw.rect(self.image, (255,255,255), (0, 0, self.program.opt.TILE_SIZE,self.program.opt.TILE_SIZE ), 5)
        self.image.set_colorkey((0,0,0))
        self.rect = self.image.get_rect()
        self.id = 0
        self.id_mode = True
        self.data_mode = True

    def update(self):
        x,y = pygame.mouse.get_pos()
        self.x = int(x/self.program.opt.TILE_SIZE)
        self.y = int(y/self.program.opt.TILE_SIZE)
        self.rect.topleft = self.x*self.program.opt.TILE_SIZE,self.y*self.program.opt.TILE_SIZE


    def draw(self, surface):
        surface.blit(self.image, self.rect.topleft)


    def click(self):
        if self.y == self.program.opt.TILE_Y:                           # WALL FLOOR DOOR line
            try:
                self.id = self.program.list_properties[self.x]
                self.id_mode = True
            except: pass
        elif self.y == self.program.opt.TILE_Y+1:                       # DECOR line
            try:
                self.item = self.program.list_decors[self.x]
                self.id_mode = False
                self.item_mode = "decor"
                print("DECOR SELECTED")
            except: pass
        elif self.y == self.program.opt.TILE_Y+2:                       # NPC line
            try:
                self.item = self.program.list_npc[self.x]
                self.id_mode = False
                self.item_mode = "npc"
                print("NPC SELECTED")
            except: pass
        else:
            if self.id_mode:
                self.program.map.matrix[self.y][self.x] = self.id
            else:
                if self.item_mode == "decor":
                    d = dict()
                    d["type"] = self.item
                    d["coord_x"] = self.x
                    d["coord_y"] = self.y
                    self.program.converter.properties["decor"].append(d)
                elif self.item_mode == "npc":
                    d = dict()
                    d["type"] = self.item
                    d["coord_x"] = self.x
                    d["coord_y"] = self.y
                    d["offset_x"] = 0
                    d["offset_y"] = 0
                    self.program.converter.properties["npc"].append(d)

        self.program.map.load_matrix()


# test
if __name__ == "__main__":
    a = Argparser()
    if a.start:
        g = Program(a)




# now we start with "python main.py [map_name]"
