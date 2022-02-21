---
title: ファイルを移動する
article_group_id: file-control-group
display_order: 30
created: 2022-02-21
updated: 2022-02-21
---
{% capture link_to_it_python %}{% link _it_articles/python/index.md %}{% endcapture %}{% assign link_to_it_python = link_to_it_python | remove: 'index' %}

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#Pythonでファイルを移動する">Pythonでファイルを移動する</a></li>
<li><a href="#関連メモ">関連メモ</a></li>
</ul>

* * *
## <a name="Pythonでファイルを移動する">Pythonでファイルを移動する</a><a class="heading-anchor-permalink" href="#Pythonでファイルを移動する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-21" updated="2022-02-21" %}</div>
- Pythonの場合、`shutil`モジュールの`move`を利用します。

### ファイル名は同じままで別ディレクトリに移動する
<div class="code-box-syntax no-title">
<pre>
shutil.<em>move</em>(<em class="blue">&lt;コピー元ファイル&gt;</em>, <em class="blue">&lt;コピー先ディレクトリ&gt;</em>)
</pre>
</div>
<div class="code-box">
<div class="title">ディレクトリへファイル移動</div>
<pre>
import shutil

new_path = shutil.<em>move</em>(<em class="blue">"from_dir/file.txt"</em>, <em class="blue">"to_dir"</em>)
</pre>
</div>
- 戻り値はコピー後のパスとなります。

なお、既に同名のファイルがコピー先パスに存在する場合、例外(`shutil.Error`)が発生します。

### ファイルを移動（上書き）
コピー先ディレクトリにファイルが存在した場合でも上書きで移動したい場合は、以下のようにコピー先をファイルまでのパスで指定します。
<div class="code-box-syntax no-title">
<pre>
shutil.<em>move</em>(<em class="blue">&lt;コピー元ファイル&gt;</em>, <em class="blue">&lt;コピー先ファイル&gt;</em>)
</pre>
</div>
<div class="code-box">
<div class="title">上書き移動</div>
<pre>
import shutil

new_path = shutil.<em>move</em>(<em class="blue">"from_dir/file.txt"</em>, <em class="blue">"to_dir/file.txt"</em>)
</pre>
</div>
- 戻り値はコピー後のパスとなります。


### 参照
- [shutil.move](https://docs.python.org/ja/3/library/shutil.html#shutil.move)

### 参考サイト
- [(け日記) Python: ファイルを移動する (shutil.move)](https://ohke.hateblo.jp/entry/2019/08/31/100000)

{% include goto_pagetop.html %}

* * *
## <a name="関連メモ">関連メモ</a><a class="heading-anchor-permalink" href="#関連メモ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-21" updated="2022-02-21" %}</div>
- [Pythonのメモ]({{link_to_it_python}})

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
