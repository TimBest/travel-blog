#!/bin/bash
# This script for creating tumbnails for the light house gallery to increase page load times

IMG_DIR=./assets/images
TUMBNAIL_DIR=./assets/tumbnails

# loop through files with .JPG (the current output format from the camera)
for i in `find $IMG_DIR -name "*.jpg" -type f`; do
    LOOKUP="${i/$IMG_DIR/$TUMBNAIL_DIR}"
    if [ ! -f "$LOOKUP" ]; then
      echo "tumbnail for $i does not exist"
      # ensure the path exists
      mkdir -p `dirname $LOOKUP`
      # create a tumbnail with 100k pixels
      magick $i -resize 100000@ $LOOKUP 
      echo "created new tumbnail: $LOOKUP"
    fi
done


