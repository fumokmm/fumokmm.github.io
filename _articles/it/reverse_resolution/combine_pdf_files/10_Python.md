---
chapter_no: 10
chapter_title: PythonでPDFファイルを結合する
sub_category_id: python
created: 2022-12-20
updated: 2022-12-20
---
### 使用ライブラリ
`PyPDF2`を使います。事前に[pip]({% link _it_articles/python/pip.md %})などでインストールしておいてください。
```output
$ pip install PyPDF2
```

### 結合するスクリプト
```
import PyPDF2

merger = PyPDF2.PdfFileMerger()
merger.append('aaa.pdf')
merger.append('bbb.pdf')
merger.append('ccc.pdf')
merger.write('all.pdf')
merger.close()
```
- `PdfFileMerger`クラスのオブジェクトを生成します。
- `append()`メソッドでファイルを追加します。
- `write()`メソッドで書き出します。
- `close()`で閉じます。

### 参考
- [(note.nkmk.me) Python, PyPDF2でPDFを結合・分割（ファイル全体・個別ページ）](https://note.nkmk.me/python-pypdf2-pdf-merge-insert-split/)
