#!/bin/bash
# Genera il PDF del manuale (A4) da manuale.html con Chrome senza finestra.
# Uso: bash manuale/stampa.sh [cartella di destinazione]
cd "$(dirname "$0")/.." || exit 1
OUT="manuale/Manuale app etichette - Russo & Dimauro.pdf"
PORT=8792
python3 -m http.server $PORT --bind 127.0.0.1 >/dev/null 2>&1 &
SRV=$!
sleep 1
D=$(mktemp -d)
rm -f "$OUT" 2>/dev/null
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless=new --user-data-dir="$D" --no-pdf-header-footer \
  --virtual-time-budget=10000 --print-to-pdf="$OUT" "http://127.0.0.1:$PORT/manuale/manuale.html" >/dev/null 2>&1 &
PID=$!
for i in $(seq 1 60); do sleep 0.5; [ -s "$OUT" ] && break; done
sleep 2; kill $PID 2>/dev/null; wait $PID 2>/dev/null
kill $SRV; rm -rf "$D"
ls -la "$OUT"
[ -n "$1" ] && cp "$OUT" "$1/" && echo "copiato in $1"
