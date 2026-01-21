#!/bin/bash
FILE=/tmp/screenshot.png
[ -f $FILE ] && rm $FILE          # remove se já existe
scrot -s $FILE
tesseract $FILE /tmp/output -l por
xclip -sel clip < /tmp/output.txt
cat /tmp/output.txt
echo "Texto copiado para clipboard!"

