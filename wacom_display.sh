#!/bin/bash

# Nome do dispositivo Wacom (ajuste se for diferente)
STYLUS="Wacom One by Wacom S Pen stylus"
ERASER="Wacom One by Wacom S Pen eraser"

# Arquivo pra guardar o estado atual
STATE_FILE="$HOME/.wacom_display_state"

# Se o arquivo não existir, começa no modo "eDP-1"
if [ ! -f "$STATE_FILE" ]; then
  echo "eDP-1" > "$STATE_FILE"
fi

CURRENT_STATE=$(cat "$STATE_FILE")

if [ "$CURRENT_STATE" = "eDP-1" ]; then
  # alterna para modo "ambos"
  xsetwacom --set "$STYLUS" MapToOutput desktop
  xsetwacom --set "$ERASER" MapToOutput desktop
  echo "desktop" > "$STATE_FILE"
  notify-send "Wacom" "Agora mapeado para todos os monitores."
else
  # volta para o modo interno
  xsetwacom --set "$STYLUS" MapToOutput eDP-1
  xsetwacom --set "$ERASER" MapToOutput eDP-1
  echo "eDP-1" > "$STATE_FILE"
  notify-send "Wacom" "Agora mapeado para eDP-1."
fi
