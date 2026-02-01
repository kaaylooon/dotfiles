#!/usr/bin/env bash

TEXT=${1:-$(xclip -o -selection primary 2>/dev/null | tr -d '[:space:]')}
[ -z "$TEXT" ] && notify-send -t 3000 "中文词典" "Nada selecionado" && exit 0

DICT="$HOME/.dict/cedict.txt"

# tenta correspondências decrescentes (até 4 chars)
LINE=""
for n in 4 3 2 1; do
    PART=${TEXT:0:$n}
    LINE=$(grep -m1 -E "^[^ ]+ ${PART} " "$DICT")
    [ -n "$LINE" ] && break
done

[ -z "$LINE" ] && notify-send -t 3000 "中文词典" "Não encontrado" && exit 0

# parsing básico
TRAD=$(awk '{print $1}' <<< "$LINE")
SIMP=$(awk '{print $2}' <<< "$LINE")
PINYIN=$(sed -n 's/.*\[\[\(.*\)\]\].*/\1/p' <<< "$LINE")
# fallback v1
[ -z "$PINYIN" ] && \
PINYIN=$(sed -n 's/.*\[\(.*\)\].*/\1/p' <<< "$LINE")
MEANING=$(sed -n 's#.*/\(.*\)/#\1#p' <<< "$LINE" | tr ';' '\n')

EXAMPLE=$(grep -oP '例句?:\s*\K[^/]+' <<< "$LINE" | head -n1)

MSG="$MEANING"

[ -n "$EXAMPLE" ] && MSG="$MSG\n\n例:\n$EXAMPLE"

notify-send -t 14000 "$SIMP ($PINYIN)" "$MSG"
