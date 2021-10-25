---
chapter_no: 4
chapter_title: pathlib.Path().mkdir()
created: 2021-10-25
updated: 2021-10-25
---
- `pathlib.Path().mkdir()`で新しくディレクトリが作成できます。
- 作成しようとするディレクトリの中間ディレクトリが存在していないとエラー(`FileNotFoundError`)が発生します。
- 既に存在しているディレクトリを指定するとエラー(`FileExistsError`)が発生します。

```:C:\temp2\temp3\temp4\temp5 ディレクトリを作成
import pathlib
p = pathlib.Path("C:\\temp2\\temp3\\temp4\\temp5")
p{em{.mkdir}em}()
```

### 引数:parents
- 中間ディレクトリもまとめて作成するには、引数:`parents=True`を指定します。
- 引数:`parents=True`を指定すると、中間ディレクトリディレクトリが存在していなくてもエラーとなりません(デフォルトは`parents=False`)

```:parents=Trueを指定
import pathlib
p = pathlib.Path("C:\\temp3\\aaa\\bbb")
p{em{.mkdir}em}({em:blue{parents=True}em})
```

### 引数:exists_ok
- 引数:`exist_ok=True`を指定すると、ディレクトリが存在していてもエラーとなりません(デフォルトは`exist_ok=False`)。

```:exist_ok=Trueを指定
import pathlib
p = pathlib.Path("C:\\temp3\\aaa\\bbb")
p{em{.mkdir}em}({em:blue{exist_ok=True}em})
```

### 参考
- [pathlib.Path.mkdir()](https://docs.python.org/ja/3/library/pathlib.html#pathlib.Path.mkdir)
