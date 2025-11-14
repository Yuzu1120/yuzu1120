#!/bin/bash
# SPDX-FileCopyrightText: 2025 Yuzuki Fujita
# SPDX-License-Identifier: BSD-3-Clause

set -e

BIRTH="./birth"

#年齢出力確認
test_birth="2005-11-20"

result=$(echo "$test_birth" | $BIRTH)

year=$(date +%Y)
month=$(date +%m)
day=$(date +%d)

birth_year=$(echo "$test_birth" | cut -d- -f1)
birth_month=$(echo "$test_birth" | cut -d- -f2)
birth_day=$(echo "$test_birth" | cut -d- -f3)

expected=$(( year - birth_year ))
if (( month < birth_month || (month == birth_month && day < birth_day) )); then
    expected=$((expected - 1))
fi

if [ "$result" != "$expected" ]; then
    echo "Error: 年齢計算が間違っています expected=$expected, got=$result" >&2
    exit 1
fi

#形式間違え
echo "actw" | $BIRTH 1>out_format.txt 2>err_format.txt || true

if [ -s out_format.txt ]; then
    echo "Error: 形式誤り時に stdout に出力があります" >&2
    exit 1
fi

if ! grep -q "Error:" err_format.txt; then
    echo "Error: 形式誤りが stderr に出ていません" >&2
    exit 1
fi

#空入力
echo "" | $BIRTH 1>out_empty.txt 2>err_empty.txt || true

if [ -s out_empty.txt ]; then
    echo "Error: 空入力時に stdout に出力があります" >&2
    exit 1
fi

if ! grep -q "Error:" err_empty.txt; then
    echo "Error: 空入力のエラーが stderr に出ていません" >&2
    exit 1
fi

#未来日
future=$(date -d "1 day" +%Y-%m-%d)
echo "$future" | $BIRTH 1>out_future.txt 2>err_future.txt || true

if [ -s out_future.txt ]; then
    echo "Error: 未来日で stdout に出力があります" >&2
    exit 1
fi

if ! grep -q "未来" err_future.txt; then
    echo "Error: 未来日のエラーが stderr に出ていません" >&2
    exit 1
fi

#数字のみの出力
clean_result=$(echo "2000-01-01" | $BIRTH)

if ! [[ "$clean_result" =~ ^[0-9]+$ ]]; then
    echo "Error: 出力が数字だけではありません → '$clean_result'" >&2
    exit 1
fi

echo "All tests passed"
