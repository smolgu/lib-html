#!/bin/bash
START=$(date +%s)
 
pageNum=`gs    -q    -dNODISPLAY    -c "($1) (r) file runpdfbegin pdfpagecount = quit"`
gs -dNumRenderingThreads=4 -dNOPAUSE -sDEVICE=jpeg -dFirstPage=1 -dLastPage=$pageNum -sOutputFile=./output/image%d.jpg -dJPEGQ=75 -r200 -q $1 -c quit
 
END=$(date +%s)
DIFF=$(( $END - $START ))
echo "It took $DIFF seconds"