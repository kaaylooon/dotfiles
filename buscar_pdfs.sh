#!/usr/bin/env bash
# buscar_pdfs_rofi.sh — X11 + rofi + lolcat

DIR="$HOME/Documents/Everythingineed"
VIEWERS=(qpdfview evince zathura xdg-open)
LOG="/tmp/buscar_pdfs.log"

: > "$LOG"

say() {
  if command -v lolcat >/dev/null 2>&1; then
    echo "$@" | lolcat
  else
    echo "$@"
  fi
}

say " Buscando PDFs..."
echo "=== INÍCIO $(date) ===" >>"$LOG"

# X11 básico
echo "DISPLAY=${DISPLAY:-<unset>}" >>"$LOG"
[ -z "$DISPLAY" ] && { say "DISPLAY não definido"; exit 1; }

[ ! -d "$DIR" ] && { say "Pasta não encontrada"; exit 1; }

mapfile -t FILES < <(find "$DIR" -type f -iname '*.pdf' | sort)
[ ${#FILES[@]} -eq 0 ] && { say "Nenhum PDF encontrado"; exit 0; }

say "${#FILES[@]} PDFs encontrados"

# --- seleção com rofi ---
if ! command -v rofi >/dev/null 2>&1; then
  say "Rofi não instalado"
  exit 1
fi

declare -A MAP
DISPLAY_LIST=()

for f in "${FILES[@]}"; do
  short="${f#*${CUT_AFTER}}"
  display="${CUT_AFTER}${short}"
  DISPLAY_LIST+=("$display")
  MAP["$display"]="$f"
done

selected=$(printf '%s\n' "${DISPLAY_LIST[@]}" | \
  rofi -dmenu -i -multi-select -p "PDFs")
  
[ -z "$selected" ] && { say "⏹ Cancelado"; exit 0; }

# converte seleção em array
IFS=$'\n' read -r -d '' -a ARGS <<<"$selected"$'\0'

say "Abrindo ${#ARGS[@]} arquivo(s)..."

try_open() {
  local v="$1"
  shift
  command -v "$v" >/dev/null 2>&1 || return 1
  setsid "$v" "$@" >/dev/null 2>&1 &
  disown
  return 0
}

for v in "${VIEWERS[@]}"; do
  if try_open "$v" "${ARGS[@]}"; then
    say "Viewer: $v"
    echo "Abriu com $v" >>"$LOG"
    exit 0
  fi
done

say "Nenhum viewer funcionou"
echo "Falha geral" >>"$LOG"
exit 2
