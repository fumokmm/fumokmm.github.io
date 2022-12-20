---
title: PDFファイルを結合する
article_group_id: combine_pdf_files
display_order: 10
created: 2022-12-20
updated: 2022-12-20
---
{% capture link_to_it_python %}{% link _it_articles/python/index.md %}{% endcapture %}{% assign link_to_it_python = link_to_it_python | remove: 'index' %}

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#PythonでPDFファイルを結合する">PythonでPDFファイルを結合する</a></li>
<li><a href="#関連メモ">関連メモ</a></li>
</ul>

* * *
## <a name="PythonでPDFファイルを結合する">PythonでPDFファイルを結合する</a><a class="heading-anchor-permalink" href="#PythonでPDFファイルを結合する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-12-20" updated="2022-12-20" %}</div>
### 使用ライブラリ
`PyPDF2`を使います。事前に[pip]({% link _it_articles/python/pip.md %})などでインストールしておいてください。
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
$ pip install PyPDF2
</pre>
</div>

### 結合するスクリプト
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
import PyPDF2

merger = PyPDF2.PdfFileMerger()
merger.append('aaa.pdf')
merger.append('bbb.pdf')
merger.append('ccc.pdf')
merger.write('all.pdf')
merger.close()
</pre>
</div>
- `PdfFileMerger`クラスのオブジェクトを生成します。
- `append()`メソッドでファイルを追加します。
- `write()`メソッドで書き出します。
- `close()`で閉じます。

### 参考
- [(note.nkmk.me) Python, PyPDF2でPDFを結合・分割（ファイル全体・個別ページ）](https://note.nkmk.me/python-pypdf2-pdf-merge-insert-split/)

{% include goto_pagetop.html %}

* * *
## <a name="関連メモ">関連メモ</a><a class="heading-anchor-permalink" href="#関連メモ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-12-20" updated="2022-12-20" %}</div>
- [Pythonのメモ]({{link_to_it_python}})

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
