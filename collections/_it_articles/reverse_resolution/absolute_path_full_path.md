---
title: 絶対パス・フルパスを取得する
article_group_id: path-control-group
display_order: 20
created: 2022-02-13
updated: 2022-02-13
---
{% capture link_to_it_ruby %}{% link _it_articles/ruby/index.md %}{% endcapture %}
{% assign link_to_it_ruby = link_to_it_ruby | remove: 'index' %}
## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#Rubyで絶対パス・フルパスを取得する">Rubyで絶対パス・フルパスを取得する</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="Rubyで絶対パス・フルパスを取得する">Rubyで絶対パス・フルパスを取得する</a><a class="heading-anchor-permalink" href="#Rubyで絶対パス・フルパスを取得する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-09" updated="2022-02-13" %}</div>
- Rubyの場合、`Pathname#cleanpath`や、`File#expand_path`を使うことで絶対パスやフルパスを取得できます。

<div class="code-box">
<div class="title">Pathnameを使う</div>
<pre>
require 'pathname'

<em>Pathname.new</em>("a/b/../c/x")<em class="blue">.cleanpath</em>
</pre>
</div>
- Pathnameを[require]({% link _it_articles/ruby/grammar.md %}#require)してから利用すること。

<div class="code-box">
<div class="title">File.expand_pathを使う</div>
<pre>
<em>File.expand_path</em>("~oracle/bin")           <em class="comment">#=&gt; "/home/oracle/bin"</em>
<em>File.expand_path</em>("../../bin", "/tmp/x")   <em class="comment">#=&gt; "/bin"</em>
</pre>
</div>

### 参考
- [(Stack Overflow) Canonical File Path in Ruby](https://stackoverflow.com/questions/3502611/canonical-file-path-in-ruby)

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-13" updated="2022-02-13" %}</div>
### 関連メモ
- [Rubyのメモ]({{link_to_it_ruby}})

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
