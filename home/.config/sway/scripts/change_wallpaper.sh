#!/bin/s

WALLPAPER_DIR="$HOME/.config/wallpapers"
CACHE_FILE="$HOME/.cache/wallpaper.txt"
POSITION_FILE="$HOME/.cache/wallpaper_position.txt"

touch "$POSITION_FILE"

CURRENT_POSITION=$(cat "$POSITION_FILE")

WALLPAPERS=("$WALLPAPER_DIR"/*)

if [ "${#WALLPAPERS[@]}" -eq 0 ]; then
    echo "No wallpapers found in $WALLPAPER_DIR. Exiting."
    exit 1
fi

if [ "$CURRENT_POSITION" -ge "${#WALLPAPERS[@]}" ]; then
    CURRENT_POSITION=0
fi

WALLPAPER="${WALLPAPERS[$CURRENT_POSITION]}"

echo "$((CURRENT_POSITION + 1))" > "$POSITION_FILE"

CURRENT_WALLPAPER=$(cat "$CACHE_FILE" 2>/dev/null)
if [ "$WALLPAPER" != "$CURRENT_WALLPAPER" ]; then
    echo "$WALLPAPER" > "$CACHE_FILE"
fi

swaymsg output "*" bg "$WALLPAPER" fill
