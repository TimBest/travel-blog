# travel-blog

[![Netlify Status](https://api.netlify.com/api/v1/badges/f4128c82-5f78-4b6a-a8a7-92fcef68be1e/deploy-status)](https://app.netlify.com/sites/admirable-truffle-2c56ee/deploys)

## Setup

- https://jekyllrb.com/docs/
- `bundle install`
- `bundle exec jekyll serve`

## Cleaning up images from the camera

- `brew install imagemagick`
- `./camera-to-web.sh`

### Find images that might not have been compressed

finds the top ten large files in dir including sub dirs

```
cd assests/images
find . -type f -exec stat -f '%z %N' {} + | sort -nr | head -10
```

## Creating thumbnails for image-gallery.html

- `brew install imagemagick`
- `./create-thumbnails.sh`
