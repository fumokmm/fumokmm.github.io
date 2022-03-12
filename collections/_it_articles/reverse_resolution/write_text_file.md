---
title: テキストファイルへ出力する(書き込み)
article_group_id: file-io-group
display_order: 20
created: 2022-03-13
updated: 2022-03-13
---
{% capture link_to_it_ruby %}{% link _it_articles/ruby/index.md %}{% endcapture %}{% assign link_to_it_ruby = link_to_it_ruby | remove: 'index' %}

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#Rubyでテキストファイルへ出力する(書き込み)">Rubyでテキストファイルへ出力する(書き込み)</a></li>
<li><a href="#関連逆引きメモ">関連逆引きメモ</a></li>
<li><a href="#関連メモ">関連メモ</a></li>
</ul>

* * *
## <a name="Rubyでテキストファイルへ出力する(書き込み)">Rubyでテキストファイルへ出力する(書き込み)</a><a class="heading-anchor-permalink" href="#Rubyでテキストファイルへ出力する(書き込み)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-03-13" updated="2022-03-13" %}</div>
- Rubyの場合、`File.open`を利用します。

<div class="code-box no-title">
<pre>
<em>File.open</em>(<em class="blue">"data/bbb.txt"</em>, <em class="orange">mode="w:UTF-8"</em>) do |w|
  w.write "あいう\n"
  w.write "abc\n"
  w.write "123\n"
end
</pre>
</div>
<div class="code-box-output">
<div class="title">data/bbb.txt</div>
<pre>
あいう
abc
123
</pre>
</div>
- エンコーディングを指定するのは引数`mode`で指定します。以下の参照・参考サイトを参照。

### 参照
- [class File](https://docs.ruby-lang.org/ja/latest/class/File.html)

### 参考サイト
- [(Build Insider) ファイルに文字列を書き込む（出力する）には？](https://www.buildinsider.net/language/rubytips/0022)

### サンプルソース
- [(language-examples) 0010_write_text](https://github.com/fumokmm/language-examples/tree/main/Ruby/0010_write_text.rb)

{% include goto_pagetop.html %}

* * *
## <a name="関連逆引きメモ">関連逆引きメモ</a><a class="heading-anchor-permalink" href="#関連逆引きメモ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-03-13" updated="2022-03-13" %}</div>
- [テキストファイルから入力する(読み込み)]({% link _it_articles/reverse_resolution/read_text_file.md %})

{% include goto_pagetop.html %}

* * *
## <a name="関連メモ">関連メモ</a><a class="heading-anchor-permalink" href="#関連メモ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-03-13" updated="2022-03-13" %}</div>
- [Rubyのメモ]({{link_to_it_ruby}})

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
