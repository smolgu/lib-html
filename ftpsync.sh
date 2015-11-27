#!/bin/bash
HOST='hugo.beget.ru'
USER='alu333_bibl'
PASS='A37bEm64'
TARGETFOLDER='/'
SOURCEFOLDER='/home/god/Downloads/lib/out'

START=$(date +%s)

lftp -f "
set ftp:list-options -a
open $HOST
user $USER $PASS
lcd $SOURCEFOLDER
mirror --exclude uploads --exclude imgSourse --exclude libCal --reverse --delete --verbose $SOURCEFOLDER $TARGETFOLDER
bye
"

lftp -c "open -u $USER,$PASS $HOST; put -O / /home/god/Downloads/lib/hugo.beget.ru/.htaccess" 

END=$(date +%s)
DIFF=$(( $END - $START ))
echo "It took $DIFF seconds"