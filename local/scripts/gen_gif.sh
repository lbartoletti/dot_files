#!/bin/sh

if [ $# != 3 ]
then
	echo "Usage: $0 <video_filename> <start_time: eg 00:00:01> <end_time: eg 00:00:42>"
	exit 0
fi

vid=$1
start_time=$2
end_time=$3
height=ih/2      # input height halved , can replace with pixils . 
width=-2         # keeps aspect ratio . can replace with pixils . 
fps=25           # frames per a second .

filters="fps=$fps,scale=$width:$height:flags=lanczos"

ffmpeg -ss $start_time                             \
       -to  $end_time                               \
       -i  "$vid"                                  \
       -vf "$filters,palettegen"                   \
       -y  palette.png                             &&
ffmpeg -ss $start_time                             \
       -to  $end_time                            \
       -i  "$vid"                                  \
       -i  palette.png                                \
       -lavfi "$filters [x]; [x][1:v] paletteuse"  \
       -y  "$vid".gif                              &&
rm palette.png
