---
title: ファイルのサイズを取得する
article_group_id: file-control-group
display_order: 10
created: 2022-02-02
updated: 2022-02-02
---
{% capture link_to_it_python %}{% link _it_articles/python/index.md %}{% endcapture %}
{% assign link_to_it_python = link_to_it_python | remove: 'index' %}
## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#Pythonでファイルのサイズを取得する">Pythonでファイルのサイズを取得する</a></li>
<li><a href="#関連メモ">関連メモ</a></li>
</ul>

* * *
## <a name="Pythonでファイルのサイズを取得する">Pythonでファイルのサイズを取得する</a><a class="heading-anchor-permalink" href="#Pythonでファイルのサイズを取得する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-02" updated="2022-02-02" %}</div>
- Pythonの場合、`os.path.getsize()`でファイルサイズが取得できます。

### 構文
<div class="code-box-syntax no-title">
<div class="copy-button">Copy</div>
<pre>
os.path.getsize(<em>&lt;パス&gt;</em>)
</pre>
</div>

### 例
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
import os

print(<em>os.path.getsize(</em>"aaa.txt"<em>)</em>)
</pre>
</div>
<div class="code-box-output">
<div class="title">出力結果</div>
<div class="copy-button">Copy</div>
<pre>
12345
</pre>
</div>

### 参考
- [(note.nkmk.me) Pythonでファイル、ディレクトリ（フォルダ）のサイズを取得](https://note.nkmk.me/python-os-path-getsize/)
- [os.path.getsize](https://docs.python.org/ja/3/library/os.path.html#os.path.getsize)

{% include goto_pagetop.html %}

* * *
## <a name="関連メモ">関連メモ</a><a class="heading-anchor-permalink" href="#関連メモ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-02" updated="2022-02-02" %}</div>
- [Pythonのメモ]({{link_to_it_python}})

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
