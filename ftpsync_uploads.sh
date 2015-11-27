#!/bin/bash
HOST='hugo.beget.ru'
USER='alu333_bibl'
PASS='A37bEm64'
TARGETFOLDER='/uploads/2015/11'
SOURCEFOLDER='/home/god/Downloads/lib/out/uploads/2015/11'

START=$(date +%s)

lftp -f "
set ftp:list-options -a
open $HOST
user $USER $PASS
lcd $SOURCEFOLDER
mirror --exclude imgSourse --exclude libCal --reverse --delete --verbose $SOURCEFOLDER $TARGETFOLDER
bye
"

END=$(date +%s)
DIFF=$(( $END - $START ))
echo "It took $DIFF seconds"
