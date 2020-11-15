import os, shutil, random, time

def reset():
    path = os.path.dirname(__file__)
    folder = os.path.join(path, "init")
    files = os.listdir(folder)
    for file in files:
        src = os.path.join(folder, file)
        shutil.copyfile(src, os.path.join(path, file))

def get_new_code():
    code = str()
    for n in range(5):
        code += str(random.randint(0,9))
    return code

if __name__ == "__main__":
    code = get_new_code()
    print("Cancellare tutti i salvataggi di gioco?")
    print("Questa operazione non e' reversibile")
    print("Digitare il seguente codice e premere invio per confermare")
    print("%s" %code)
    if input("\n -> ") == code: reset(); print("Dati di gioco cancellati")
    else: print("Dati di gioco NON cancellati")
    time.sleep(2)
