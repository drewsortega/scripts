#!/bin/bash

cd ${HOME}/.templates
source="$(ls | rofi -dmenu -p "Paste template:")";

#xclip -selection clipboard < $source
#xdotool type "$(xclip -selection clipboard -o)"
cat $source | {
	IFS=read -r LINE;
	xdotool type -- "$LINE";
	
  	while IFS= read -r LINE; do
    		xdotool key Return;
    		xdotool type -- "$LINE";
  	done;
}
