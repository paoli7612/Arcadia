import re
import os




def ftos(file):
    string = ""
    for i in open(file,"r"):
        string += i.strip()

    return string

def main():
    #re.findall('"[_a-z]+"',ftos("img/items.json"))
    #re.findall('"[0-9]{5}+"',ftos("img/items.json"))
    sprites_list=list()

    for i in re.findall('"[A-Za-z]*[0-9][0-9]+"',ftos("img/sprites.json")):
        id=i.replace('"','')
        id=int(id)
        try:
            if id  in sprites_list:
                sprites_list.append(id_1+1)
                id_1=id_1+1
                print(id_1)
            else:
                id_1=id
                sprites_list.append(id)
        except:
            pass

    print(sprites_list)



if __name__ == '__main__':
    main()
