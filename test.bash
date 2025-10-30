#!/bin/bash

ng () {
	echo ${1}行目が違うよ
	res=1
}

res=0

a=$(seq 5 | ./plus)
[ "$a" = 15  ] || ng "$LINENO" 

[ "$res" = 0 ] && echo OK
exit $res
