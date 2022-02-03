---
chapter_no: 10
chapter_title: Pythonでファイルの存在チェック
sub_category_id: python
created: 2022-02-03
updated: 2022-02-03
---
- Pythonの場合、`os.path.exists()`でファイルの存在チェックを行えます。

### 構文
```syntax
os.path.exists({em{<ファイルパス>}em})
```
- `<ファイルパス>`はフルパス、または相対パスで指定します。

### 例
```
import os

print({em{os.path.exists(}em}"aaa.txt"{em{)}em})
```
```output:出力結果(ファイルがある場合)
True
```
```output:出力結果(ファイルがない場合)
False
```


### 参考
- [(Let'sプログラミング) ファイルやディレクトリの存在を確認する](https://www.javadrive.jp/python/file/index7.html)
