---
title: ユーザ名とパスワードの記録場所 on Windows
article_group_id: tips-group
display_order: 900
created: 2007-08-20
updated: 2021-08-14
---
当メモは2007-08-20に[投稿されたもの](https://npnl.hatenablog.jp/entry/20070820/1187575030)を加筆修正し、再掲したものです。
## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#設定ファイルの保存場所">設定ファイルの保存場所</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="設定ファイルの保存場所">設定ファイルの保存場所</a><a class="heading-anchor-permalink" href="#設定ファイルの保存場所">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2007-08-20" updated="2021-08-14" %}</div>
一回記憶させてしまったユーザ名とパスワードをリセットしたいと思っても、設定ダイアログからは編集できないようです。  
設定ファイルの保存場所は以下です。

<div class="code-box">
<div class="title">設定ファイルの保存場所</div>
<pre>
<em>%APPDATE%</em>\Subversion\auth\svn.simple
</pre>
</div>

ちなみにWindows 10だと、`%APPDATA%`は環境変数で設定されているフォルダ以下となっています。
<div class="code-box">
<div class="title">Windows10で%APPDATA%に設定されているフォルダ</div>
<pre>
C:\Users\<em class="blue">&lt;Windowsユーザ名&gt;</em>\AppData\Roaming
</pre>
</div>

### フルパス
フルパスは以下となります。
<div class="code-box">
<div class="title">フルパス</div>
<pre>
C:\Users\<em class="blue">&lt;Windowsユーザ名&gt;</em>\AppData\Roaming\AppData\Roaming\Subversion\auth\svn.simple
</pre>
</div>
ここにあるユーザ名やパスワードの設定ファイルをごっそり消してしまえば解決です。  
まあ、ごっそりでなくて、指定して消してもOKですが。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2007-08-20" updated="2021-08-14" %}</div>
### 参考サイト
- [(DENの思うこと) Subclipseの設定ファイル](http://den2sn.hatenablog.com/entry/20060706/1152577127)

### 元記事
- [(No Programming, No Life) Subversionのユーザ名とパスワードの記録場所](https://npnl.hatenablog.jp/entry/20070820/1187575030)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
