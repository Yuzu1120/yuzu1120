# robosys2025

# udedupe: 連続文字の圧縮
![udedupe test](https://github.com/Yuzu1120/robosys2025/actions/workflows/test_udedupe.yml/badge.svg)

標準入力から受け取った文字列に対して、連続して並んだ同じ文字を１回に圧縮して出力するプログラムです。
文字列中の内容は変更せず、読みやすく整理するために、連続する文字だけを削減します。

## 使い方

### 1.ダウンロード

GitHubからリポジトリをクローンする：

```bash
git clone https://github.com/Yuzu1120/robosys2025.git
cd robosys2025
```

### 2.インストール

```bash
chmod +x udedupe
```

このディレクトリに一時的に PATH を通します（ターミナルを閉じると元に戻ります）：

```bash
export PATH=$PATH:$(pwd)
```

### 3.基本的な使い方

標準入力で文字列を受け取り、連続する同じ文字を1つにまとめて出力します:

```bash
echo "aaacccbbb" | udedupe
```

出力: 
```nginx
acb
```

### 4.ファイルに対して使う場合

```bash
cat sample.txt | udedupe
```

### 5.改行を含んだ複数行の場合

```bash
printf "hhheelllo\naaaab\n" | udedupe
```

出力：
```nginx
hello
ab
```

## 対応 OS
- Linux
- WSL2 (Windows 上）
- macOS

※ 標準入力・標準出力を扱うため、UNIX 系シェル環境での利用を前提としています。

## 必要なソフトウェア
- Python 3.8～3.12
　（本ソフトウェアは Python 標準ライブラリのみで動作します）

## 必要なライブラリ
- 追加インストール不要
  - 外部ライブラリは使用していません

## テストの結果

本ソフトウェアは、GitHub Actions により自動テストを行っている。

テスト内容は `test_udedupe.bash` により実施され、標準入力からの文字列処理が正しく行われることを確認している。

## テスト環境
- Ubuntu 22.04 LTS (WSL2 上）
- GitHub Actions により Python 3.8 / 3.9 / 3.10 / 3.11 / 3.12 で自動テスト済み

## ライセンス・謝辞
- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます。
- このパッケージには，千葉工業大学「ロボットシステム学」授業資料に含まれるコード例を参考・引用した部分があります。
- 引用元（ライセンス：CC-BY-SA 4.0 by Ryuichi Ueda）：
   - [ryuichiueda/my_slides robosys_2025](https://github.com/ryuichiueda/my_slides/tree/master/robosys_2025)
- 引用部分は CC-BY-SA 4.0 の条件に従い，適切に明示された上で再配布しています。

© 2025 Yuzuki Fujita
