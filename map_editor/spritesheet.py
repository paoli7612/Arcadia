import pygame, os


class Images:
    def __init__(self, image_path):
        self.image = pygame.image.load(image_path).convert()

    def get_image(self, x, y):
        image = pygame.Surface((16, 16))
        image.blit(self.image, (0, 0), (x*16, y*16, 16, 16))
        image = pygame.transform.scale(image, (22, 22))
        image.set_colorkey((0,0,0))
        return image

class Spritesheet:
    def __init__(self, program):
        self.program = program
        self.images = dict()
# BASICTILES_____________________________________________________________________________________________________
        self.basictiles = Images(os.path.join(self.program.path_img,"basictiles" + self.program.opt.IMAGE_FORMAT))
        self.images["basictiles"] = dict()
        get_image = self.basictiles.get_image

        # WALL
        self.images["basictiles"]["wall"] = dict()
        self.images["basictiles"]["wall"]["blue"] = [get_image(0,0),get_image(1,0),get_image(2,0),get_image(3,0)]
        self.images["basictiles"]["wall"]["red"] = [get_image(4,0),get_image(5,0),get_image(6,0),get_image(7,0)]
        self.images["basictiles"]["wall"]["stone"] = [get_image(0,10),get_image(1,10)]
        self.images["basictiles"]["wall"]["wood"] = [get_image(0,11),get_image(1,11)]
        self.images["basictiles"]["wall"]["cave"] = [get_image(7,1),get_image(7,2)]

        # FLOOR
        self.images["basictiles"]["floor"] = dict()
        self.images["basictiles"]["floor"]["grass"] = [get_image(0,8),get_image(1,8),get_image(3,1),get_image(4,1)]
        self.images["basictiles"]["floor"]["wood"] = [get_image(0,1),get_image(0,2),get_image(2,10),get_image(2,11),get_image(0,9)]
        self.images["basictiles"]["floor"]["ice"] = [get_image(5,3),get_image(5,4)]
        self.images["basictiles"]["floor"]["stone"] = [get_image(6,1),get_image(1,9)]
        self.images["basictiles"]["floor"]["carpet"] = [get_image(1,2)]
        self.images["basictiles"]["floor"]["color"] = [get_image(1,1),get_image(3,1)]
        self.images["basictiles"]["floor"]["lava"] = [get_image(2,8),get_image(2,9),get_image(3,9)]

        # DOORS
        self.images["basictiles"]["door"] = [get_image(0,6),get_image(1,6),get_image(2,6),get_image(0,7),get_image(1,7)]

        #CARTEL
        self.images["basictiles"]["cartel"] = get_image(3,8)

        # DECOR
        self.images["basictiles"]["decor"] = dict()
        self.images["basictiles"]["decor"]["shelf"] = get_image(7,6)
        self.images["basictiles"]["decor"]["chest"] = get_image(4,4)
        self.images["basictiles"]["decor"]["table"] = get_image(6,6)
        self.images["basictiles"]["decor"]["urn"] = get_image(3,3)
        self.images["basictiles"]["decor"]["bed_down"] = get_image(5,6)
        self.images["basictiles"]["decor"]["bed_up"] = get_image(5,5)
        self.images["basictiles"]["decor"]["throne"] = get_image(6,5)
        self.images["basictiles"]["decor"]["statue"] = get_image(7,5)
        self.images["basictiles"]["decor"]["tower"] = get_image(7,5)
        self.images["basictiles"]["decor"]["statue"] = get_image(7,5)
        self.images["basictiles"]["decor"]["tag_armor"] = get_image(6,8)
        self.images["basictiles"]["decor"]["tag_magic"] = get_image(7,8)
        self.images["basictiles"]["decor"]["tag_weapon"] = get_image(6,9)
        self.images["basictiles"]["decor"]["tag_potion"] = get_image(7,9)
        self.images["basictiles"]["decor"]["bookshelf_full"] = get_image(4,10)
        self.images["basictiles"]["decor"]["bookshelf_empty"] = get_image(5,10)
        self.images["basictiles"]["decor"]["sedding"] = get_image(6,10)

# CHARACTERS_____________________________________________________________________________________________________
        self.characters = Images(os.path.join(self.program.path_img,"characters" + self.program.opt.IMAGE_FORMAT))
        get_image = self.characters.get_image

        # CHARACTERS
        self.images["characters"] = dict()
        self.images["characters"]["man"] = get_image(1,0)
        self.images["characters"]["boy"] = get_image(4,0)
        self.images["characters"]["brown_girl"] = get_image(7,0)
        self.images["characters"]["alien"] = get_image(10,0)
        self.images["characters"]["slime"] = get_image(1,4)
        self.images["characters"]["bat"] = get_image(4,4)
        self.images["characters"]["ghost_white"] = get_image(7,4)
        self.images["characters"]["spider"] = get_image(10,4)
        self.images["characters"]["libri"] = get_image(1,8)
        self.images["characters"]["barra"] = get_image(4,8)
        self.images["characters"]["blonde_girl"] = get_image(7,8)
        self.images["characters"]["red_girl"] = get_image(10,8)
        self.images["characters"]["ghost_yellow"] = get_image(1,12)
        self.images["characters"]["ghost_red"] = get_image(4,12)
        self.images["characters"]["ghost_blue"] = get_image(7,12)
        self.images["characters"]["ghost_green"] = get_image(10,12)

# THINGS_____________________________________________________________________________________________________
        self.things = Images(os.path.join(self.program.path_img,"things" + self.program.opt.IMAGE_FORMAT))
        get_image = self.things.get_image

        #TORCH
        self.images["things"] = dict()
        self.images["things"]["torch"] = dict()
        self.images["things"]["torch"]["yellow"] = get_image(0,4)
        self.images["things"]["torch"]["blue"] = get_image(0,5)
        self.images["things"]["torch"]["red"] = get_image(0,6)
        self.images["things"]["torch"]["green"] = get_image(0,7)
