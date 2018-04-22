import template

class Builder:
    def __init__(self,program):
        self.program = program

        if self.program.create: self.write_new_map()

    def write_new_map(self):
        f = open(self.program.path_maps,"w")
        f.write(template.empty %self.program.name_map)

    def save(self):
        data = str()
        for y in self.program.map.matrix:
            for x in y:
                if x < 10: x = "0"+str(x)
                data+=",%s"%str(x)
            data+="\n\t\t\t\t\t\t"
        data = data[1:]
        down = "\n\t\t\t\t\t\t\t\t\t\t"
        # WALL
        walls = str()
        for wall in self.program.converter.properties["walls"]:
            walls += (template.walls %(wall["id"],wall["color"],wall["type"]+1)) + down
        # FLOOR
        floors = str()
        for floor in self.program.converter.properties["floors"]:
            floors += (template.floors %(floor["id"],floor["bloke"],floor["type"]+1)) + down
        # DOOR
        doors = str()
        for door in self.program.converter.properties["doors"]:
            doors += (template.doors %(door["id"],door["dest"],door["coord_x"],door["coord_y"],door["type"]+1)) + down
        # NPC
        npcs = str()
        for npc in self.program.converter.properties["npc"]:
            npcs += (template.npc %(npc["type"],npc["coord_x"],npc["coord_y"],npc["offset_x"],npc["offset_y"])) + down
        # DECOR
        decors = str()
        for decor in self.program.converter.properties["decor"]:
            decors += (template.decor %(decor["type"],decor["coord_x"],decor["coord_y"])) + down
        # TORCH
        torchs = str()
        for torch in self.program.converter.properties["torch"]:
            torchs += (template.torch %(torch["color"],torch["coord_x"],torch["coord_y"])) + down
        # CARTEL
        cartels = str()
        for cartel in self.program.converter.properties["cartel"]:
            cartels += (template.cartel %(cartel["text"],cartel["coord_x"],cartel["coord_y"])) + down
        f = open(self.program.path_maps, "w")
        f.write(template.to_fill %(self.program.name_map, data,walls,floors,doors,npcs,decors,torchs,cartels))
        f.close()
