import tkinter

class Box:
    def __init__(self):
        self.master = tkinter.Tk()
        self.buttons = dict()
        self.texts = dict()

    def new_label(self, text, row, column):
        tkinter.Label(self.master, text = text).grid(row = row, column = column)

    def new_text(self, name, row, column):
        ent = tkinter.Entry(self.master)
        ent.grid(row = row, column = column)
        self.texts[name] = ent

    def get_param(self):
        param = dict()
        for name, text in self.texts.items():
            param[name] = str(text.get())
        return param

    def new_pair(self, name, row):
        self.new_label(name, row, 0)
        self.new_text(name, row, 1)

    def new_button(self, name, command, row, column):
        btn = tkinter.Button(self.master, text = name, command = command)
        btn.grid(row = row, column = column)
        self.buttons[name] = btn

    def start(self):
        tkinter.mainloop()

    def end(self):
        self.param = self.get_param()
        self.master.destroy()

    def set_voices(self,voices):
        for row,voice in enumerate(voices):
            self.new_pair(voice,row)
        self.new_button("ok", self.end, row+1, 1)

def get_door_npc():
    box = Box()
    box.set_voices("dest dest_x dest_y".split())
    box.start()
    return box.param

def get_npc_param():
    box = Box()
    box.set_voices("nickname allow_x allow_y".split())
    box.start()
    return box.param
