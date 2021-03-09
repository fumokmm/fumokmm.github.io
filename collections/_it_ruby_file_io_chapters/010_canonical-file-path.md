---
chapter_no: 010
chapter_id: canonical-file-path
chapter_title: ファイルパスを絶対パスに変換する
created: 2021-03-09
updated: 2021-03-10
---
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