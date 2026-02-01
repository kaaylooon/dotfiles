#!/usr/bin/env bash

LANG=${1:-por}   # por padrão português
IMG=/tmp/ocr.png
OUT=/tmp/ocr

rm -f "$IMG" "$OUT.txt"

scrot -s "$IMG" || exit 1

tesseract "$IMG" "$OUT" -l "$LANG" --dpi 300 2>/dev/null

if [ ! -s "$OUT.txt" ]; then
    notify-send "OCR" "Falha no reconhecimento"
    exit 1
fi

xclip -selection clipboard < "$OUT.txt"
notify-send "OCR ($LANG)" "Texto copiado"