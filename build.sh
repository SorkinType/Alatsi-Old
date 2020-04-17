#!/bin/sh
set -e

cd sources

 echo "Generating Static fonts"
 mkdir -p ../fonts/
 fontmake -g Alatsi.glyphs -o ttf --output-dir ../fonts/
 
 rm -rf master_ufo/ instance_ufo/
 echo "Post processing"


ttfs=$(ls ../fonts/*.ttf)
for ttf in $ttfs
do
	gftools fix-dsig -f $ttf;

    gftools fix-nonhinting $ttf "$ttf.fix";
	mv "$ttf.fix" $ttf;
done
rm ../fonts/*backup*.ttf
