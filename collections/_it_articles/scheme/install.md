---
title: Scheme処理系をインストール
article_group_id: getting-started-group
display_order: 10
created: 2022-07-04
updated: 2022-07-04
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#UbuntuにGaucheをインストール">UbuntuにGaucheをインストール</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="UbuntuにGaucheをインストール">UbuntuにGaucheをインストール</a><a class="heading-anchor-permalink" href="#UbuntuにGaucheをインストール">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-07-04" updated="2022-07-04" %}</div>
- Schemeの処理系であるGaucheをUbuntuにインストールする際の手順をメモしておきます。

### apt-get
<div class="code-box-output no-title">
<pre>
$ sudo apt-get install gauche
</pre>
</div>
これでおしまい。

### goshプロンプトを実行
- `gosh`というコマンドで実行できます。
- 終了は`(exit)`。

<div class="code-box-output no-title">
<pre>
$ gosh
gosh&gt; (+ 1 2)
3
gosh&gt; (exit)
$ 
</pre>
</div>

### ファイルから実行
<div class="code-box">
<div class="title">hello.scm</div>
<pre>
(print "Hello, World")
(print "こんにちは、世界")
(print (+ 1 2))
</pre>
</div>
- UTF-8で保存

<div class="code-box-output">
<div class="title">実行</div>
<pre>
$ gosh hello.scm 
Hello, World
こんにちは、世界
3
$ 
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-07-04" updated="2022-07-04" %}</div>
### 参考サイト
- [いおりのプログラミングめも](http://fanblogs.jp/iorisprogramming/archive/19/0)
- [Gauche - A Scheme Implementation](http://practical-scheme.net/gauche/index-j.html)
- [(はてなブログ) CLOVER🍀](https://kazuhira-r.hatenablog.com/entry/20111105/1320492973)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
