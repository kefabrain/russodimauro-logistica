#!/bin/bash
# Fotografa le schermate del manuale con Chrome senza finestra (telefono 390×844, nitidezza ×2).
# Uso: bash manuale/scatta.sh   (dalla cartella del repo; serve Google Chrome)
cd "$(dirname "$0")/.." || exit 1
PORT=8790
python3 -m http.server $PORT --bind 127.0.0.1 >/dev/null 2>&1 &
SRV=$!
sleep 1
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
mkdir -p manuale/img

scatta(){ # scena larghezza altezza
  D=$(mktemp -d); : > "manuale/img/$1.png"
  "$CHROME" --headless=new --user-data-dir="$D" --hide-scrollbars --force-device-scale-factor=2 \
    --window-size=$2,$3 --virtual-time-budget=8000 --screenshot="manuale/img/$1.png" \
    "http://127.0.0.1:$PORT/manuale/scatto.html?s=$1&v=$2x$3" >/dev/null 2>&1 &
  PID=$!
  for i in $(seq 1 40); do sleep 0.5; [ -s "manuale/img/$1.png" ] && break; done
  sleep 1; kill $PID 2>/dev/null; wait $PID 2>/dev/null
  rm -rf "$D"; echo "$1 $(sips -g pixelWidth -g pixelHeight manuale/img/$1.png | tail -2 | awk '{print $2}' | xargs)"
}
for s in crea_cerca crea_nuovo crea_articoli crea_pronte mag_collo mag_scaffale cons_cerca cons_lista cons_errore cons_camera cons_pronto; do
  scatta $s 390 844
done
scatta etichetta 404 594
kill $SRV
