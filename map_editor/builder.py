from template import template

class Builder:
    def __init__(self,program):
        self.program = program

        if self.program.mode == "create": self.write_new_map()

    def write_new_map(self):
        f = open(self.program.path_maps,"a")
        f.write(template %self.program.name_map)
