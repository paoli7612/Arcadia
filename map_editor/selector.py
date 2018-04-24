import pygame

class Selector(pygame.sprite.Sprite):
    def __init__(self,program):
        self.program = program
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
        text_surface = self.font.render(("%d - %d" %(self.x,self.y)), True, (255,0,0))
        text_rect = text_surface.get_rect()
        text_rect.bottomleft = (self.program.opt.WIDTH,self.program.opt.HEIGHT+40)
        self.program.screen.blit(text_surface, text_rect)



    def update(self):
        x,y = pygame.mouse.get_pos()
        self.x = int(x/self.program.opt.TILE_SIZE)
        self.y = int(y/self.program.opt.TILE_SIZE)
        self.rect.topleft = self.x*self.program.opt.TILE_SIZE,self.y*self.program.opt.TILE_SIZE

    def get_new_id(self, item):
        if item == "walls":
            last_id = 1
            for wall in self.program.converter.properties["walls"]: last_id = wall["id"]
        elif item == "floors":
            last_id = 20
            for floor in self.program.converter.properties["floors"]: last_id = floor["id"]
        return last_id + 1


    def draw(self, surface):
        surface.blit(self.image, self.rect.topleft)
        self.draw_coord()

    def remove(self):
        for type,elements in self.program.converter.properties.items():
            for pos,element in enumerate(elements):
                try:
                    print(element["coord_x"],self.x,element["coord_y"],self.y)
                    if element["coord_x"] == self.x and element["coord_y"] == self.y:
                        del self.program.converter.properties[type][pos]
                        self.program.map.load_matrix()
                        return
                except: pass

    def click(self):
        if self.y == self.program.opt.TILE_Y:                           # WALL line
            try:
                self.id = self.program.list_walls[self.x]
                self.id_mode = True
            except: pass
        elif self.y == self.program.opt.TILE_Y+1:                       # FLOOR line
            try:
                self.id = self.program.list_floors[self.x]
                self.id_mode = True
            except: pass
        elif self.y == self.program.opt.TILE_Y+2:                       # DECOR line
            try:
                self.item = self.program.list_decors[self.x]
                self.id_mode = False
                self.item_mode = "decor"
            except: pass
        elif self.y == self.program.opt.TILE_Y+3:                       # NPC line
            try:
                self.item = self.program.list_npc[self.x]
                self.id_mode = False
                self.item_mode = "npc"
            except: pass
        elif self.x == self.program.opt.TILE_X:                         # WALL column
            try:
                bloke,type = self.program.all_walls[self.y]
                self.program.converter.properties["walls"].append({"id": self.get_new_id("walls"), "bloke":bloke, "type": type})
                self.program.set_properties_screen()
            except: pass
        elif self.x == self.program.opt.TILE_X + 1:                       # FLOOR column
            try:
                bloke,type = self.program.all_floors[self.y]
                self.program.converter.properties["floors"].append({"id": self.get_new_id("floors"), "bloke":bloke, "type":type})
                self.program.set_properties_screen()
            except: pass
        else:
            if self.id_mode: self.program.map.matrix[self.y][self.x] = self.id
            else:
                if self.item_mode == "decor": self.program.converter.properties["decor"].append({"type":self.item,"coord_x":self.x,"coord_y":self.y})
                elif self.item_mode == "npc": self.program.converter.properties["npc"].append({"type":self.item,"coord_x":self.x,"coord_y":self.y,"allow_x":0,"allow_y":0})
        self.program.map.load_matrix()
