#!/usr/bin/env bash

text="$1"
font="$2"

ffmpeg -v quiet -f lavfi -i color=size=1x1 \
	-vf "drawtext=fontfile=${font}:text='${text}':x=0:y=0:fontsize=48:print_textinfo=1" \
	-frames:v 1 -f null - 2>&1 | awk -F'[:, ]+''/text_w/{print $3}'
