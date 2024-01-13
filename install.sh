#!/bin/sh
# Install galier in /usr/local/

DEST=/usr/local

mkdir -p $DEST/share/galier

cp galier $DEST/bin
cp style.css $DEST/share/galier
