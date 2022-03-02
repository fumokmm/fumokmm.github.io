---
title: テキストファイルから入力する(読み込み)
article_group_id: file-io-group
display_order: 10
created: 2022-03-02
updated: 2022-03-02
---
{% capture link_to_it_ruby %}{% link _it_articles/ruby/index.md %}{% endcapture %}{% assign link_to_it_ruby = link_to_it_ruby | remove: 'index' %}

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#Rubyでテキストファイルから入力する(読み込み)">Rubyでテキストファイルから入力する(読み込み)</a></li>
<li><a href="#関連メモ">関連メモ</a></li>
</ul>

* * *
## <a name="Rubyでテキストファイルから入力する(読み込み)">Rubyでテキストファイルから入力する(読み込み)</a><a class="heading-anchor-permalink" href="#Rubyでテキストファイルから入力する(読み込み)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-03-02" updated="2022-03-02" %}</div>
- Rubyの場合、`File.open`を利用します。

<div class="code-box no-title">
<pre>
f = <em>File.open</em>(<em class="blue">"data/aaa.txt"</em>)
lines = f.readlines
p lines <em class="comment"># =&gt; ["aaa\n", "bbb\n", "ccc"]</em>
f.close
</pre>
</div>
<div class="code-box-input">
<div class="title">data/aaa.txt</div>
<pre>
aaa
bbb
ccc
</pre>
</div>
- エンコーディングを指定するのは引数`mode`で指定します。以下の参照・参考サイトを参照。

### 参照
- [class File](https://docs.ruby-lang.org/ja/latest/class/File.html)

### 参考サイト
- [(Build Insider) ファイルから文字列を読み込む（入力する）には？（基本編）](https://www.buildinsider.net/language/rubytips/0019)

### サンプルソース
- [(language-examples) 0009_read_text](https://github.com/fumokmm/language-examples/tree/main/Ruby/0009_read_text.rb)

{% include goto_pagetop.html %}

* * *
## <a name="関連メモ">関連メモ</a><a class="heading-anchor-permalink" href="#関連メモ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-03-02" updated="2022-03-02" %}</div>
- [Rubyのメモ]({{link_to_it_ruby}})

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
