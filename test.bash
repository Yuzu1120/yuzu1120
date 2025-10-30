#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Yuzuki Fujita
# SPDX-License_Identifier: BSD-3-Clause

ng () {
	echo ${1}行目が違うよ
	res=1
}

res=0

a=$(seq 5 | ./plus)
[ "$a" = 15  ] || ng "$LINENO" 

a=$(echo あ | ./plus)
[ "$?" = 1 ]    || ng "$LINENO"
[ "$a" = "" ] || ng "$LINENO"

a=$(echo | ./plus)
[ "$?" = 1 ]    || ng "$LINENO"
[ "$a" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
