import pygame, os, json, time
from sprites import TYPES_NAME

class Spritesheet:
    def __init__(self, program, image_path):
        self.image = pygame.image.load(image_path)
        self.program = program

    def get_image(self, x, y):
        image32 = pygame.Surface((32, 32))
        image32.blit(self.image, (0, 0), (x*32, y*32, 32, 32))
        self.program.screen.fill((50,50,50))
        image32.set_colorkey((0,0,0))
        return image32
        image32 = pygame.transform.scale(image32, (self.program.opt.TILE_SIZE, self.program.opt.TILE_SIZE))

class Images:
    def __init__(self, program):
        self.program = program
        self.images = dict()
        for type in TYPES_NAME:
            print(type)
            self.load_images(type)

    def load_images(self,type):
        image_path = os.path.join(self.program.path_img, type + self.program.opt.IMAGE_FORMAT)
        data_path = os.path.join(self.program.path_img, type + self.program.opt.JSON_FORMAT)
        ss = Spritesheet(self.program, image_path)
        data = json.load(open(data_path))
        self.images[type] = dict()
        for code, coords in data.items():
            if code == "_": continue    # cumment
            self.images[type][code] = ss.get_image(*coords.values())

    def __getitem__(self, key):
        return self.images[key]
