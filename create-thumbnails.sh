#!/bin/bash
# This script for creating thumbnails for the light house gallery to increase page load times

IMG_DIR=./assets/images
THUMBNAIL_DIR=./assets/thumbnails

# loop through files with .JPG (the current output format from the camera)
for i in `find $IMG_DIR -name "*.jpg" -type f`; do
    LOOKUP="${i/$IMG_DIR/$THUMBNAIL_DIR}"
    if [ ! -f "$LOOKUP" ]; then
      echo "thumbnail for $i does not exist"
      # ensure the path exists
      mkdir -p `dirname $LOOKUP`
      # create a thumbnail 800x400 is roughly twice the display size in the image grid
      magick $i -resize 800x400 $LOOKUP 
      echo "created new thumbnail: $LOOKUP"
    fi
done


