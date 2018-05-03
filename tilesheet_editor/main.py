import os, re
from argparser import Argparser

class Program:
    def __init__(self, argv):
        self.sprites_list = list()
        self.path = os.path.dirname(__file__)
        name_file = argv.json_name + ".json"
        self.json_path = os.path.join(self.path, "..", "src", "img", name_file)
        self.json_text = self.get_text(self.json_path)
        self.start()

    def start(self):
        for i in re.findall('"[A-Za-z]*[0-9][0-9]+"', self.json_text):
            id = i.replace('"','')
            id = int(id[1:])
            try:
                self.sprites_list.append(id)
                if self.sprites_list[-1] >= id and self.sprites_list[-1]!=1:
                    self.sprites_list[-1] = self.sprites_list[-2]+1
                elif self.sprites_list[-2] < id  and self.sprites_list[-1]!=1:
                    self.sprites_list[-1] = self.sprites_list[-2]+1
            except: pass
    def get_text(self,file_name):
        string = str()
        for row in open(file_name, "r"):
            string += row.strip()
        return string

if __name__ == "__main__":
    a = Argparser()
    p = Program(a)
