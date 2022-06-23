#!/bin/bash
# This script processes images from the camera and makes them work welll for web

DIR=./assets/images

# loop through files with .JPG (the current output format from the camera)
for i in `find $DIR -name "*.JPG" -type f`; do
    # rename from '.JPG' to ".jpg" due to lighthouse.js bug
    OLD_NAME="$i"
    NEW_NAME="${i%.JPG}.jpg"
    mv $OLD_NAME "$NEW_NAME"
    echo "renamed $OLD_NAME -> $NEW_NAME"

    # compress images because camera images are very large
    OLD_SIZE=`stat -f "%z bytes" $NEW_NAME | numfmt --to=iec-i`
    magick $NEW_NAME -interlace Plane -sampling-factor 4:2:0 -adaptive-resize 50% -quality 50% $NEW_NAME 
    NEW_SIZE=`stat -f "%z bytes" $NEW_NAME | numfmt --to=iec-i`
    echo "resized $NEW_NAME from $OLD_SIZE -> $NEW_SIZE"
done


