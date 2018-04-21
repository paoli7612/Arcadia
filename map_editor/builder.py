import template

class Builder:
    def __init__(self,program):
        self.program = program

        if self.program.mode == "create": self.write_new_map()

    def write_new_map(self):
        f = open(self.program.path_maps,"w")
        f.write(template.empty %self.program.name_map)

    def save(self):
        data = str()
        for y in self.program.map.matrix:
            for x in y:
                if x < 10: x = "0"+str(x)
                data+="%s,"%str(x)
            data+="\n\t\t\t\t\t\t"
        data = data[:-1]
        down = "\n\t\t\t\t\t\t\t\t\t\t"
        # WALL
        walls = str()
        for wall in self.program.converter.properties["walls"]:
            walls += (template.walls %(wall["id"],wall["color"],wall["type"])) + down
        # FLOOR
        floors = str()
        for floor in self.program.converter.properties["floors"]:
            floors += (template.walls %(floor["id"],floor["bloke"],floor["type"])) + down
        # DOOR
        doors = str()
        for door in self.program.converter.properties["doors"]:
            doors += (template.doors %(door["id"],door["dest"],door["coord_x"],door["coord_y"],door["type"])) + down

        f = open(self.program.path_maps + "0", "w")
        f.write(template.to_fill %(self.program.name_map, data,walls,floors,doors,"","","",""))
        f.close()
