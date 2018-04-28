import pygame

class Selector(pygame.sprite.Sprite):
    def __init__(self,program):
        self.program = program
        self.opt = self.program.opt
        self.prop = self.program.converter.properties
        pygame.sprite.Sprite.__init__(self)
        self.font = pygame.font.Font(pygame.font.match_font("arial"), 15)
        self.image = pygame.Surface((self.program.opt.TILE_SIZE,self.program.opt.TILE_SIZE))
        pygame.draw.rect(self.image, (255,255,255), (0, 0, self.program.opt.TILE_SIZE,self.program.opt.TILE_SIZE ), 5)
        self.image.set_colorkey((0,0,0))
        self.rect = self.image.get_rect()
        self.id = 0
        self.id_mode = True
        self.data_mode = True

    def draw_coord(self):
        self.draw_text(("%d - %d" %(self.x,self.y)),0,self.opt.TILE_Y*self.opt.TILE_SIZE)

    def write(self,text, y):
        self.draw_text(text, 100 ,self.opt.TILE_Y*self.opt.TILE_SIZE + y*self.opt.TILE_SIZE)

    def draw_text(self, text, x, y):
        if self.position == "map":
            text_surface = self.font.render(text, True, self.opt.FONT_COLOR)
            text_rect = text_surface.get_rect()
            text_rect.topleft = (x,y)
            self.program.screen.blit(text_surface, text_rect)

    def update(self):
        x,y = pygame.mouse.get_pos()
        self.x = int(x/self.program.opt.TILE_SIZE)
        self.y = int(y/self.program.opt.TILE_SIZE)
        self.rect.topleft = self.x*self.program.opt.TILE_SIZE,self.y*self.program.opt.TILE_SIZE

        if self.x < self.opt.TILE_X and self.y < self.opt.TILE_Y:
            self.position = "map"
        elif self.x > self.opt.TILE_X and self.y < self.opt.TILE_Y:
            self.position = "toolbar"
        else: self.position = ""


    def get_new_id(self, item):
        if item == "wall":
            last_id = 1
            for wall in self.prop["wall"]: last_id = wall["id"]
        elif item == "floor":
            last_id = 20
            for floor in self.prop["floor"]: last_id = floor["id"]
        return last_id + 1

    def draw(self, surface):
        surface.blit(self.image, self.rect.topleft)
        self.draw_coord()

    def remove(self):
        for type,elements in self.prop.items():
            for pos,element in enumerate(elements):
                try:
                    print(element["coord_x"],self.x,element["coord_y"],self.y)
                    if element["coord_x"] == self.x and element["coord_y"] == self.y:
                        del self.prop[type][pos]
                        self.program.map.trix()
                        return
                except: pass

    def click(self):
        opt = self.program.opt

        if self.x == opt.TILE_X or self.y == opt.TILE_Y:
            print("invalid click"); return
        if self.position == "map":
            self.program.map.matrix[self.y][self.x] = self.id
        elif self.position == "toolbar":
            try: print(self.program.toolbar.prop[self.x-opt.TILE_X-1][self.y]["code"])
            except:
                try:
                    print(self.program.toolbar.prop[self.x-opt.TILE_X-1][self.y])
                except: pass
        self.program.map.draw_matrix()
