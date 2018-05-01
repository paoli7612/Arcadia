# updater
### Scopo
All'avvio deve aggiornare gli id delle immagini all'interno dei file json e riportare le rispettive modifiche nelle mappe.

### In dettaglio
All'interno dei file **.json** nella cartella **src/img/**  ci sono le definizioni delle immagini strutturate cosi: `[id]: {"x":[x],"y"}:[y]` dove l'**id** è una stringa che rappresenta il codice dell'immagine e la **x** e la **y** sono le coordinate all'interno della rispettiva immagine.

***esempio***:
```json
{
  "wall": {
    "_cumment": "brick",
      "00001":{"x": 0, "y": 0},
      "00002":{"x": 1, "y": 0},
  },
  "floor": {
    "_cumment": "border",
      "10001":{"x": 0, "y": 3}
  }
}
```

Ogni tanto capita quindi che gli **id** non siano "ordinati", per esempio:
```json
{
  "decor": {
    "_cumment": "shelf",
      "20001":{"x": 0, "y": 0},
      "20002":{"x": 1, "y": 0},
      "20005":{"x": 2, "y": 0},
      "20006":{"x": 3, "y": 0},
  }
}
```
Il programma deve trovare questi "errori" e cosi correggerli:
```json
{
  "decor": {
    "_cumment": "shelf",
      "20001":{"x": 0, "y": 0},
      "20002":{"x": 1, "y": 0},
      "20003":{"x": 2, "y": 0},
      "20004":{"x": 3, "y": 0},
  }
}
```
Cosi facendo il file **.json** viene corretto, attenzione a tenere sempre conto che a seconda di quale tipo di immagini stiamo controllando, il codice inizia con un carattere diverso e che tutti gli **id** devono avere lo stesso numero di caratteri.

Solo che correggendo solo gli **id** delle immagini, le mappe caricheranno le immagini sbagliate o addirittura daranno errore per l'immagine mancante.

Quindi ogni codice cambiato nei **.json** va riscritto anche nelle mappe salvate nella cartella **src/maps/**.

#### esempio
Data.json
```json
{
  "floor": {
    "_cumment": "wood",
      "100045": {"x": 0, "y": 0},
      "100046": {"x": 1, "y": 0},
      "100055": {"x": 2, "y": 0},
      "100055": {"x": 3, "y": 0},
      "100056": {"x": 4, "y": 0}
  }
}
```
Mappa.lua
```lua
return {
  name = "spawn",
  properties={
    floor={
      {code = "100045", coord_x = 13, coord_y = 20},
      {code = "100045", coord_x = 14, coord_y = 20},
      {code = "100046", coord_x = 15, coord_y = 20},
      {code = "100055", coord_x = 16, coord_y = 20},
      {code = "100055", coord_x = 17, coord_y = 20},
      {code = "100056", coord_x = 18, coord_y = 20}
    }
  }
}
```

#### risultato
Data.json
```json
{
  "floor": {
    "_cumment": "wood",
      "100001": {"x": 0, "y": 0},
      "100002": {"x": 1, "y": 0},
      "100003": {"x": 2, "y": 0},
      "100004": {"x": 3, "y": 0},
      "100005": {"x": 4, "y": 0}
  }
}
```
Mappa.lua
```lua
return {
  name = "spawn",
  properties={
    floor={
      {code = "100001", coord_x = 13, coord_y = 20},
      {code = "100001", coord_x = 14, coord_y = 20},
      {code = "100002", coord_x = 15, coord_y = 20},
      {code = "100003", coord_x = 16, coord_y = 20},
      {code = "100004", coord_x = 17, coord_y = 20},
      {code = "100005", coord_x = 18, coord_y = 20}
    }
  }
}
```
