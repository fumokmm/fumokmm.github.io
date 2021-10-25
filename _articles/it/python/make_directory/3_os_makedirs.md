---
chapter_no: 3
chapter_title: os.makedirs()
created: 2021-10-25
updated: 2021-10-25
---
- `os.makedirs()`は、深い階層のディレクトリまで再帰的に一気に作成できます。
- 既に存在しているディレクトリを指定するとエラー(`FileExistsError`)が発生します。

```:C:\temp2\temp3\temp4\temp5 ディレクトリを作成
import os
os{em{.makedirs}em}("C:\\temp2\\temp3\\temp4\\temp5")
```

### 引数:exists_ok (Python3.2以降)
- Pythonのバージョン`3.2`で引数:`exist_ok`が追加されました。
- 引数:`exist_ok=True`を指定すると、ディレクトリが存在していてもエラーとなりません(デフォルトは`exist_ok=False`)。

```:exist_ok=Trueを指定
import os
os{em{.makedirs}em}("C:\\temp2\\temp3\\temp4\\temp5", {em:blue{exist_ok=True}em})
```

### 参考
- [os.makedirs()](https://docs.python.org/ja/3/library/os.html#os.makedirs)
