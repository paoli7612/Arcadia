import template

class Builder:
    def __init__(self,program):
        self.program = program

        if self.program.mode == "create": self.write_new_map()

    def write_new_map(self):
        f = open(self.program.path_maps,"a")
        f.write(template.empty %self.program.name_map)

    def save(self):
        data = str()
        for y in self.program.map.matrix:
            for x in y:
                data+="%d,"%x

        f = open("0" + self.program.name_map, "w")

        f.write(template.to_fill %(self.program.name_map, data,"","","","","","",""))
