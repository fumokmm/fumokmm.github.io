---
chapter_no: 20
chapter_title: Pythonで絶対パス・フルパスを取得する
sub_category_id: python
created: 2022-02-13
updated: 2022-02-13
---
- Pythonの場合、`os.path.abspath`や、`pathlib.Path.resolve`を使うことで絶対パスやフルパスを取得できます。

```:os.path.abspathを使う
import os

print(os.path.abspath({em:blue{r"C:\temp\temp2\..\test2.txt"}em}))
```
```:出力結果
C:\temp\test2.txt
```

```:pathlib.Path.resolveを使う
import pathlib

print(pathlib.Path({em:blue{r"C:\temp\temp2\..\test2.txt"}em}){em{.resolve()}em})
```
```:出力結果
C:\temp\test2.txt
```

### 参照
- [pathlib](https://docs.python.org/ja/3/library/pathlib.html)
- [os.path.abspath](https://docs.python.org/ja/3/library/os.path.html#os.path.abspath)
- [pathlib.Path.resolve](https://docs.python.org/ja/3/library/pathlib.html#pathlib.Path.resolve)

### 参考サイト
- [(TechAcademyマガジン) Pythonでファイルの絶対パスを取得する方法【初心者向け】現役エンジニアが解説](https://stackoverflow.com/questions/3502611/canonical-file-path-in-ruby)
- [(Qiita) Pathlibのabsoluteとresolve](https://qiita.com/hayata-yamamoto/items/7ceb60499e00e238d20e)
