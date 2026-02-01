#!/usr/bin/env bash

word=${1:-$(xclip -o -selection primary 2>/dev/null)}

[ -z "$word" ] && notify-send -t 3000 "Dictionary" "No word selected" && exit 0

query=$(curl -s "https://api.dictionaryapi.dev/api/v2/entries/en_US/$word")

echo "$query" | jq -e . >/dev/null 2>&1 || {
    notify-send -t 3000 "Dictionary" "Invalid word"
    exit 0
}

def=$(echo "$query" | jq -r '
.[0].meanings[]
| "\(.partOfSpeech): \(.definitions[0].definition)\n"
')

notify-send -t 10000 "$word" "$def"
