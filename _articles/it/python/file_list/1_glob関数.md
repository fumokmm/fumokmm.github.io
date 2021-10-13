---
chapter_no: 1
chapter_title: glob関数
created: 2021-10-13
updated: 2021-10-13
---
`globモジュール`の`glob関数`を使います。  
```syntax
import glob

files = {em{glob.glob}em}({em:blue{"<パスのパターン>"}em})
```
- `<パスのパターン>`にはワイルドカード`*`も使えます。
- サブディレクトリ内の全てのファイルを取得するには、`/**/*`のようなパターンも使えます。

### 例1: /tmpフォルダ配下の全ファイル
```
import glob

files = glob.glob({em{"/tmp/*"}em})
for file in files:
    print(file)
```
```output:出力
/tmp/aaa.txt
/tmp/bbb.txt
/tmp/ccc.txt
/tmp/ddd.html
/tmp/eee.html
```

### 例2: /tmpフォルダ配下のhtmlファイル
```
import glob

files = glob.glob("/tmp/*{em{.html}em}")
for file in files:
    print(file)
```
```output:出力
/tmp/ddd.html
/tmp/eee.html
```

### 例3: /tmpフォルダの全サブディレクトリ配下のファイル
```
import glob

files = glob.glob("/tmp/**/*")
for file in files:
    print(file)
```
```output:出力
/tmp/aaa.txt
/tmp/bbb.txt
/tmp/ccc.txt
/tmp/ddd.html
/tmp/eee.html
/tmp/dir1/fff.txt
/tmp/dir1/ggg.txt
/tmp/dir2/hhh.txt
/tmp/dir3/iii.txt
```
