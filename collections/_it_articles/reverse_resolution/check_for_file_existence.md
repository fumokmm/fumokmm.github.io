---
title: ファイルの存在チェック
article_group_id: file-control-group
display_order: 20
created: 2022-02-03
updated: 2022-02-03
---
{% capture link_to_it_python %}{% link _it_articles/python/index.md %}{% endcapture %}
{% assign link_to_it_python = link_to_it_python | remove: 'index' %}
## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#Pythonでファイルの存在チェック">Pythonでファイルの存在チェック</a></li>
<li><a href="#関連メモ">関連メモ</a></li>
</ul>

* * *
## <a name="Pythonでファイルの存在チェック">Pythonでファイルの存在チェック</a><a class="heading-anchor-permalink" href="#Pythonでファイルの存在チェック">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-03" updated="2022-02-03" %}</div>
- Pythonの場合、`os.path.exists()`でファイルの存在チェックを行えます。

### 構文
<div class="code-box-syntax no-title">
<pre>
os.path.exists(<em>&lt;ファイルパス&gt;</em>)
</pre>
</div>
- `<ファイルパス>`はフルパス、または相対パスで指定します。

### 例
<div class="code-box no-title">
<pre>
import os

print(<em>os.path.exists(</em>"aaa.txt"<em>)</em>)
</pre>
</div>
<div class="code-box-output">
<div class="title">出力結果(ファイルがある場合)</div>
<pre>
True
</pre>
</div>
<div class="code-box-output">
<div class="title">出力結果(ファイルがない場合)</div>
<pre>
False
</pre>
</div>


### 参考
- [(Let'sプログラミング) ファイルやディレクトリの存在を確認する](https://www.javadrive.jp/python/file/index7.html)

{% include goto_pagetop.html %}

* * *
## <a name="関連メモ">関連メモ</a><a class="heading-anchor-permalink" href="#関連メモ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-03" updated="2022-02-03" %}</div>
- [Pythonのメモ]({{link_to_it_python}})

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
