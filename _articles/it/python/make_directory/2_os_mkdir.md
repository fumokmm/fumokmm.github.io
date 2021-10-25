---
chapter_no: 2
chapter_title: os.mkdir()
created: 2021-10-25
updated: 2021-10-25
---
- `os.mkdir()`は、引数で指定したパス文字列の場所に新しくディレクトリが作成できます。
  - 既に存在しているディレクトリを指定するとエラー(`FileExistsError`)が発生します。
  - まだ存在していないディレクトリの中に新たなディレクトリを作成する場合もエラー(`FileNotFoundError`)が発生します。
- `os.mkdir()`を使う場合は作成するディレクトリの直上までのディレクトリが存在している必要があります。
  - 一気に新規作成するには[#os.makedirs()]を使います。

```:C:\temp2ディレクトリを作成
import os
os{em{.mkdir}em}("C:\\temp2")
```

### 参考
- [os.mkdir()](https://docs.python.org/ja/3/library/os.html#os.mkdir)
