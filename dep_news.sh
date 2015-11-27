#!/bin/bash
./addnews.sh
HOST='hugo.beget.ru' \
USER='alu333_bibl' \
PASS='A37bEm64' \
TARGETFOLDER='/'
SOURCEFILE='/home/god/Downloads/lib/out/index.html'

START=$(date +%s)

lftp -c "open -u $USER,$PASS $HOST; put -O / $SOURCEFILE"

END=$(date +%s)
DIFF=$(( $END - $START ))
echo "It took $DIFF seconds"