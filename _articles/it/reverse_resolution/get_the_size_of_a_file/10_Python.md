---
chapter_no: 10
chapter_title: Pythonでファイルのサイズを取得する
sub_category_id: python
created: 2022-02-02
updated: 2022-02-02
---
- Pythonの場合、`os.path.getsize()`でファイルサイズが取得できます。

### 構文
```syntax
os.path.getsize({em{<パス>}em})
```

### 例
```
import os

print({em{os.path.getsize(}em}"aaa.txt"{em{)}em})
```
```output:出力結果
12345
```

### 参考
- [(note.nkmk.me) Pythonでファイル、ディレクトリ（フォルダ）のサイズを取得](https://note.nkmk.me/python-os-path-getsize/)
- [os.path.getsize](https://docs.python.org/ja/3/library/os.path.html#os.path.getsize)
