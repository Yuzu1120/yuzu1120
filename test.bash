#!/bin/bash

ng () {
	echo ${1}行目が違うよ
	res=1
}


res=0

a=藤田
[ "$a" = 柚樹 ] || ng "$LINENO" 
[ "$a" = 藤田 ] || ng "$LINENO"

exit $res
