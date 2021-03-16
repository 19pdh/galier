# galier

Better [gal](https://github.com/19pdh/gal) - media gallery generator.

It supports images and videos

## Usage

```
galier [SRC DIR] [OUTPUT DIR]
```

## Caching results

Since video transcoding is a cpu intensive task this script will check if file
exists in output folder. In order to regenerate video you need to remove/rename
file in its destination.

Other files (htmls, images) will always be overwritten.
