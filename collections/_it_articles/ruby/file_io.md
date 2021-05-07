---
title: RubyでFile I/O
display_order: 30
created: 2021-03-09
updated: 2021-03-10
---
ここではRubyのファイルI/Oについて簡単にまとめておきます。


## <a name="index">目次</a>

<ul id="index_ul">
<li><a href="#canonical-file-path">ファイルパスを絶対パスに変換する</a></li>
<li><a href="#reference">参考</a></li>
</ul>

* * *
## <a name="canonical-file-path">ファイルパスを絶対パスに変換する</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-09" updated="2021-03-10" %}</div>
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
<em>File.expand_path</em>("~oracle/bin")           <em class="comment">#=> "/home/oracle/bin"</em>
<em>File.expand_path</em>("../../bin", "/tmp/x")   <em class="comment">#=> "/bin"</em>
</pre>
</div>

### 参考
- [(Stack Overflow) Canonical File Path in Ruby](https://stackoverflow.com/questions/3502611/canonical-file-path-in-ruby)

{% include goto_pagetop.html %}

* * *
## <a name="reference">参考</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-09" updated="2021-03-09" %}</div>
- [(Stack Overflow) Canonical File Path in Ruby](https://stackoverflow.com/questions/3502611/canonical-file-path-in-ruby)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
