---
title: SubversionのTips
display_order: 900
created: 2020-10-02
updated: 2021-02-16
---
ここではSubversionのちょっとしたTipsをまとめておきます。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#location-of-user-name-and-password-on-windows">ユーザ名とパスワードの記録場所 on Windows</a></li>
</ul>

* * *
## <a name="location-of-user-name-and-password-on-windows">ユーザ名とパスワードの記録場所 on Windows</a><a class="heading-anchor-permalink" href="#location-of-user-name-and-password-on-windows">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2007-08-20" updated="2021-02-16" %}</div>
当メモは2007-08-20に[投稿されたもの](https://npnl.hatenablog.jp/entry/20070820/1187575030)を加筆修正し、再掲したものです。

一回記憶させてしまったユーザ名とパスワードをリセットしたいと思っても、設定ダイアログからは編集できないようです。  
設定ファイルの保存場所は、

<div class="code-box">
<div class="title">設定ファイルの保存場所</div>
<pre>
%APPDATE%\Subversion\auth\svn.simple
</pre>
</div>

ちなみにWindows 10だと、`%APPDATA%`は環境変数で設定されているフォルダ以下となっています。
<div class="code-box">
<div class="title">Windows10で%APPDATA%に設定されているフォルダ</div>
<pre>
C:\Users\&lt;Windowsユーザ名&gt;\AppData\Roaming
</pre>
</div>

フルパスは以下となります。
<div class="code-box">
<div class="title">フルパス</div>
<pre>
C:\Users\&lt;Windowsユーザ名&gt;\AppData\Roaming\AppData\Roaming\Subversion\auth\svn.simple
</pre>
</div>

ここにあるユーザ名やパスワードの設定ファイルをごっそり消してしまえば解決です。  
まあ、ごっそりでなくて、指定して消してもOKですが。

### 参考
- [Subversionのユーザ名とパスワードの記録場所](https://npnl.hatenablog.jp/entry/20070820/1187575030)
- [Subclipseの設定ファイル](http://den2sn.hatenablog.com/entry/20060706/1152577127)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
