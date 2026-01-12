#!/bin/bash
# -*- coding: utf-8 -*-
# antiX Community zzz file manager extension script
# provides the "Search for Doublettes" entry in context menu.
# Version 1.0
# GPL v.3
# Written 1/2024 by Robin for antiX community
# questions, suggestions and bug reporting please to www.antixforum.com

#set -x

TEXTDOMAIN=antix-zzz-extensions
TEXTDOMAINDIR=/usr/share/locale

$fm_import

if [ -d "$fm_file" ]; then
    x="$fm_file"
    echo -e $"Searching for doublettes in directory './${fm_file##*/}'\nand its subdirectories:""\n"
    engine=2
elif [ -z "$fm_file" ]; then
    x="."
    echo -e $"Searching for doublettes in current directory './' and its subdirectories:""\n"
    engine=2
elif [ -f "$fm_file" ]; then
    y="$(md5sum $fm_file)"; y="${y%% *}"
    x="./"
    echo -e $"Searching for duplicates of file '${fm_filename}'\nin current directory './' and its subdirectories:""\n"
    engine=1
fi


if [ $engine -eq 1 ]; then
    awk -v y="$y" '{
        md5=$1
        u=(md5 == y) ? u RS $2 : u
        md5 == y && v++ }
        END{if(v>1)
                {printf "'$"%s doublettes with MD5-Hash '%s' found:"'\n%s\n\n",v,y,u}
             else
                {printf "'$"No doublettes for MD5-Hash '%s' found."'",y}}' <(find "$x" -type f -exec md5sum {} +)
elif [ $engine -eq 2 ]; then
    awk '{
        md5=$1
        u[md5]=md5 in u ? u[md5] RS $2 : $2
        v[md5]++ } 
        END{z=0
		    for(w in v)
            {if(v[w]>1)
                {z=1
                printf "'$"%s doublettes with MD5-Hash '%s' found:"'\n%s\n\n",v[w],w,u[w]}}
        if(z!=1)
            {print "'$"No doublettes found"'"}}' <(find "$x" -type f -exec md5sum {} +)
fi

exit $?

#set +x
