# robosys2025

# birth： 年齢計算
![birth test](https://github.com/Yuzu1120/robosys2025/actions/workflows/test_birth.yml/badge.svg)

生年月日（YYYY-MM-DD形式）を標準入力または引数で受け取り、
**現在の年齢を計算して出力するコマンド**です。

- 標準入力または引数で日付を受け取ります
- 正常時は年齢を標準出力します
- 空入力・形式間違い・未来日などの入力時は標準エラー出力します

## 使い方

### 1.ダウンロード

GitHubからリポジトリをクローンします：

```bash
git clone https://github.com/Yuzu1120/robosys2025.git
cd robosys2025
```

### 2.インストール

```bash
chmod +x birth
```

このディレクトリに一時的に PATH を通します（ターミナルを閉じると元に戻ります）：

```bash
export PATH=$PATH:$(pwd)
```

### 3.基本的な使い方

生年月日を標準入力で与えると、現在の年齢を計算して出力します：

```bash
echo "2005-10-15" | birth 
```

出力：
```nginx
20
```

### 4.引数として与える場合

```bash
birth 2005-10-15
```

### 5.不正な入力例

**形式間違い（YYYY-MM-DD以外）**

```bash
echo "15-10-2005" | birth
```

出力：
```css
Error: YYYY-MM-DD形式で入力してください
```

**空入力**

```bash
echo "" | birth
```

出力：
```javascript
Error: 生年月日を入力してください
```

**未来日**

```bash
echo "2045-11-20" | birth
```

出力：
```javascript
Error: 未来の日付が入力されています
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

本ソフトウェアは、GitHub Actions により自動テストを行っています。
テスト内容は `test_birth.bash` により実施され、以下を確認しています。
- 正しい年齢計算が行われているか
- 生年月日形式誤りを適切に検出できるか
- 空入力をエラーとするか
- 未来日入力をエラーとするか
- 標準出力と標準エラー出力が正しく分離されているか

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
