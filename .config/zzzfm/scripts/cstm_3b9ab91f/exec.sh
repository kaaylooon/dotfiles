#!/bin/bash
# -*- coding: utf-8 -*-
# antiX Community zzz file manager extension script
# provides the "Compare with Meld" entry in context menu.
# Version 1.0
# GPL v.3
# Written 1/2024 by anti-apXos and Robin for antiX community
# questions, suggestions and bug reporting please to www.antixforum.com

#set -x

TEXTDOMAIN=antix-zzz-extensions
TEXTDOMAINDIR=/usr/share/locale
export TEXTDOMAINDIR TEXTDOMAIN
source gettext.sh

$fm_import

function cleanup {
unset pcount
unset fselection
unset pselection
unset entry
unset panels
unset num
}
trap cleanup EXIT

pcount=0
declare -a fselection=()
declare -a dselection=()
declare -a panels=()

for num in 1 2 3 4; do
declare panel='fm_panel'$num'_files[@]'
    if [ "${fm_pwd_panel[num]}" != "" ]; then
        entry=""
        panels+=( "${fm_pwd_panel[num]}" )
        for entry in "${!panel}"; do
            if [ ! -z "$entry" ]; then
                [ -f "$entry" ] && fselection+=( "$entry" )
                [ -d "$entry" ] && dselection+=( "$entry" )
            fi
        done
        let pcount++
    fi
done

if [ ${#fselection[@]} -ne 0 ] && [ ${#dselection[@]} -ne 0 ]; then
  zzzfm -g --label "$(eval_gettext 'Can‘t compare files with folders!')" --button "$(eval_gettext 'Oops!')"
  exit 1
elif [ ${#dselection[@]} -eq 0 ] && ! [ ${#fselection[@]} -gt 3 ] && ! [ ${#fselection[@]} -lt 2 ]; then
  meld "${fselection[@]}" # compare selected files
elif [ ${#fselection[@]} -eq 0 ] && ! [ ${#dselection[@]} -gt 3 ] && ! [ ${#dselection[@]} -lt 2 ]; then
  meld "${dselection[@]}" # compare selected folders
elif [ $pcount -gt 1 ] && [ $pcount -le 3 ] && [ ${#fselection[@]} -eq 0 ] && [ ${#dselection[@]} -eq 0 ]; then
  meld "${panels[@]}" # compare folders of left and right panel folder
else
  if [ $pcount -gt 3 ] || [ ${#fselection[@]} -gt 3 ] || [ ${#dselection[@]} -gt 3 ]; then
      zzzfm -g --label "$(eval_gettext 'Can‘t compare more than three files or folders using Meld!')" --button "$(eval_gettext 'Oops!')"
      exit 1
  elif [ ${#fselection[@]} -lt 2 ] || [ ${#dselection[@]} -lt 2 ]; then
      zzzfm -g --label "$(eval_gettext 'Nothing to do. Comparing a single file or folder, or even less, is not possible!')" --button "$(eval_gettext 'Oops!')"
      exit 1
  fi
fi

#set +x
exit $?
