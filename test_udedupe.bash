#!/bin/bash
# SPDX-FileCopyrightText: 2025 Yuzuki Fujita
# SPDX-License-Identifier: BSD-3-Clause

set -e

output=$(echo -e "aaacccbbb" | ./udedupe)
expected="acb"

[[ "$output" == "$expected" ]] || { echo "Test1 failed"; exit 1; }

output=$(echo -e "aa\nbb\ncc" | ./udedupe)
expected=$'a\nb\nc'

[[ "$output" == "$expected" ]] || { echo "Test2 failed"; exit 1; }

output=$(echo -n "" | ./udedupe)
expected=""
[[ "$output" == "$expected" ]] || { echo "Test3 failed"; exit 1; }

echo "All tests passed"

