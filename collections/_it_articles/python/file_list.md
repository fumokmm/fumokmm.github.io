---
title: Pythonでフォルダ内のファイルリストを取得する
article_group_id: reverse-lookup-group
display_order: 20
created: 2021-10-13
updated: 2021-10-13
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#glob関数">glob関数</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="glob関数">glob関数</a><a class="heading-anchor-permalink" href="#glob関数">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-13" updated="2021-10-13" %}</div>
`globモジュール`の`glob関数`を使います。  
<div class="code-box-syntax no-title">
<pre>
import glob

files = <em>glob.glob</em>(<em class="blue">"&lt;パスのパターン&gt;"</em>)
</pre>
</div>
- `<パスのパターン>`にはワイルドカード`*`も使えます。
- サブディレクトリ内の全てのファイルを取得するには、`/**/*`のようなパターンも使えます。

### 例1: /tmpフォルダ配下の全ファイル
<div class="code-box no-title">
<pre>
import glob

files = glob.glob(<em>"/tmp/*"</em>)
for file in files:
    print(file)
</pre>
</div>
<div class="code-box-output">
<div class="title">出力</div>
<pre>
/tmp/aaa.txt
/tmp/bbb.txt
/tmp/ccc.txt
/tmp/ddd.html
/tmp/eee.html
</pre>
</div>

### 例2: /tmpフォルダ配下のhtmlファイル
<div class="code-box no-title">
<pre>
import glob

files = glob.glob("/tmp/*<em>.html</em>")
for file in files:
    print(file)
</pre>
</div>
<div class="code-box-output">
<div class="title">出力</div>
<pre>
/tmp/ddd.html
/tmp/eee.html
</pre>
</div>

### 例3: /tmpフォルダの全サブディレクトリ配下のファイル
<div class="code-box no-title">
<pre>
import glob

files = glob.glob("/tmp/**/*")
for file in files:
    print(file)
</pre>
</div>
<div class="code-box-output">
<div class="title">出力</div>
<pre>
/tmp/aaa.txt
/tmp/bbb.txt
/tmp/ccc.txt
/tmp/ddd.html
/tmp/eee.html
/tmp/dir1/fff.txt
/tmp/dir1/ggg.txt
/tmp/dir2/hhh.txt
/tmp/dir3/iii.txt
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-13" updated="2021-10-13" %}</div>
### 参照
- [(Python Documentation) glob --- Unix 形式のパス名のパターン展開](https://docs.python.org/ja/3/library/glob.html)

### 参考サイト
- [(WEB ARCH LABO) Python3入門 フォルダ内のファイル一覧を取得する方法](https://weblabo.oscasierra.net/python/python3-beginning-file-list.html)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
