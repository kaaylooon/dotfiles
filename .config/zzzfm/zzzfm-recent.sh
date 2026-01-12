#!/bin/bash
#obtain localization from a known source: geany
export TEXTDOMAIN=geany;  title=$(echo "$(gettext "Recent _Files")")
#remove any underscore
title=${title//_/}
#display window, using the localized title and also the correct window icon
eval "`zzzfm -g --title "$title" --window-icon chronometer --chooser --button close`" && xdg-open "$dialog_chooser1"

