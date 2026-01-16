#!/bin/bash
# anki_quick.sh

# Captura
IMG="/tmp/ankiq_$(date +%s).png"
scrot -s "$IMG" || exit

Q=$(rofi -dmenu \
    -p "❓" \
    -l 0 \
    -theme-str 'window { width: 50%; height: 10%; } entry { placeholder: "Digite..."; }' \
    -theme-str 'listview { lines: 0; }')

if [ -z "$Q" ]; then
    rm "$IMG"
    exit 0
fi

D=$(echo -e "Matemática\nFísica\nPortuguês\nInglês" | rofi -dmenu -p "Deck" -l 4) || D="Default"

# Adiciona
curl -s http://localhost:8765 -X POST -d '{
 "action":"addNote", "version":6,
 "params":{"note":{
   "deckName":"'"$D"'::Geral",
   "modelName":"Basic",
   "fields":{"Front":"'"${Q//\"/\\\"}"'","Back":"<img src=\"'"$(basename "$IMG")"'\">"}
 }}
}' >/dev/null && notify-send "Salvo em $D"

# Move imagem
mv "$IMG" ~/.local/share/Anki2/*/collection.media/ 2>/dev/null