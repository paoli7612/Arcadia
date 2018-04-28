import pygame
from sprites import newSprite_code

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
        self.selected = "99999"

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

    def draw(self, surface):
        surface.blit(self.image, self.rect.topleft)
        self.draw_coord()

    def remove(self):
        for type, elements in self.prop.items():
            for pos,element in enumerate(elements):
                try:
                    if element["coord_x"] == self.x and element["coord_y"] == self.y:
                        print("Del: %s" %(str(element)))
                        del self.prop[type][pos]
                        self.program.map.draw_matrix()
                        return
                except: pass

    def click(self):
        opt = self.program.opt
        prop = self.program.toolbar.prop

        if self.x == opt.TILE_X or self.y == opt.TILE_Y:
            print("invalid click"); return
        if self.position == "map":
            element,type_name = newSprite_code(self.selected,self.x,self.y)
            self.prop[type_name].append(element)
            for element in self.prop[type_name]: print(element["code"])
        elif self.position == "toolbar":
            try:
                self.selected = prop[self.x-opt.TILE_X-1][self.y]
            except:
                print("out position")

        self.program.map.draw_matrix()
