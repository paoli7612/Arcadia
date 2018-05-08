import os, re
import string
from argparser import Argparser

class Program:
    DIM_ID=4
    def __init__(self, argv):
        self.sort_list=list()
        self.sprites_list = list()
        self.path = os.path.dirname(__file__)
        name_file = argv.json_name + ".json"
        self.json_path = os.path.join(self.path, "..", "src", "img", name_file)
        self.json_text = self.get_text(self.json_path)
        self.list_id=re.findall('"[A-Za-z]*[0-9][0-9]+"', self.json_text)
        self.start()

    def start(self):
        z_id=""
        for i in self.list_id:
            id = i.replace('"','')
            head_id = id[0]
            id = int(id[1:])
            try:
                self.sprites_list.append(id)
                if self.sprites_list[-1] >= id and self.sprites_list[-1]!=1:
                    self.sprites_list[-1] = self.sprites_list[-2]+1
                elif self.sprites_list[-2] < id  and self.sprites_list[-1]!=1:
                    self.sprites_list[-1] = self.sprites_list[-2]+1
            except: pass
            zz = self.DIM_ID-len(str(self.sprites_list[-1]))
            for z in range(zz):
                z_id = z_id + '0'
            self.sort_list.append('"'+head_id+z_id+str(self.sprites_list[-1])+'"')
            z_id =''
        n=0
        s = open(self.json_path,"r")
        bozza = ""
        for line in s.readlines():
            if  re.search("[A-Za-z]*[0-9][0-9]+",line):
                bozza+=line.replace(self.list_id[n],self.sort_list[n])
                n+=1
            else:bozza+=line
        s.close()
        s = open(self.json_path,"w")
        s.write(bozza)
        s.close()



    def get_text(self,file_name):
        string = str()
        for row in open(file_name, "r"):
            string += row.strip()
        return string






if __name__ == "__main__":
    a = Argparser()
    p = Program(a)
