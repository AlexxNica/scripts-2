#!/bin/bash


filename="${1}"
ext=${filename##*.}

geometry=`identify "${filename}" |  cut -f4 -d " "`
width=`echo ${geometry} | cut -d x -f1 `
height=`echo ${geometry} | cut -d x -f2 `
outfile="/tmp/${RANDOM}-image.${ext}"

if [ "${2}x" != "x" ]; then
	gravity="${2}"
else
	gravity="center"
fi

convert  "${filename}" -resize 1920x1080^  -gravity ${gravity}  -extent 1920x1080  ${outfile}

echo "Wrote ${filename} to ${outfile}"
