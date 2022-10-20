---
title: 絶対パス・フルパスを取得する
article_group_id: path-control-group
display_order: 20
created: 2022-02-13
updated: 2022-02-13
---
{% capture link_to_it_ruby %}{% link _it_articles/ruby/index.md %}{% endcapture %}{% assign link_to_it_ruby = link_to_it_ruby | remove: 'index' %}
{% capture link_to_it_python %}{% link _it_articles/python/index.md %}{% endcapture %}{% assign link_to_it_python = link_to_it_python | remove: 'index' %}
{% capture link_to_it_powershell %}{% link _it_articles/powershell/index.md %}{% endcapture %}{% assign link_to_it_powershell = link_to_it_powershell | remove: 'index' %}
## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#Rubyで絶対パス・フルパスを取得する">Rubyで絶対パス・フルパスを取得する</a></li>
<li><a href="#Pythonで絶対パス・フルパスを取得する">Pythonで絶対パス・フルパスを取得する</a></li>
<li><a href="#PowerShellで絶対パス・フルパスを取得する">PowerShellで絶対パス・フルパスを取得する</a></li>
<li><a href="#関連メモ">関連メモ</a></li>
</ul>

* * *
## <a name="Rubyで絶対パス・フルパスを取得する">Rubyで絶対パス・フルパスを取得する</a><a class="heading-anchor-permalink" href="#Rubyで絶対パス・フルパスを取得する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-09" updated="2022-02-13" %}</div>
- Rubyの場合、`Pathname#cleanpath`や、`File#expand_path`を使うことで絶対パスやフルパスを取得できます。

<div class="code-box">
<div class="title">Pathnameを使う</div>
<div class="copy-button">Copy</div>
<pre>
require 'pathname'

<em>Pathname.new</em>("a/b/../c/x")<em class="blue">.cleanpath</em>
</pre>
</div>
- Pathnameを[require]({% link _it_articles/ruby/grammar.md %}#require)してから利用すること。

<div class="code-box">
<div class="title">File.expand_pathを使う</div>
<div class="copy-button">Copy</div>
<pre>
<em>File.expand_path</em>("~oracle/bin")           <em class="comment">#=&gt; "/home/oracle/bin"</em>
<em>File.expand_path</em>("../../bin", "/tmp/x")   <em class="comment">#=&gt; "/bin"</em>
</pre>
</div>

### 参考
- [(Stack Overflow) Canonical File Path in Ruby](https://stackoverflow.com/questions/3502611/canonical-file-path-in-ruby)

{% include goto_pagetop.html %}

* * *
## <a name="Pythonで絶対パス・フルパスを取得する">Pythonで絶対パス・フルパスを取得する</a><a class="heading-anchor-permalink" href="#Pythonで絶対パス・フルパスを取得する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-13" updated="2022-02-13" %}</div>
- Pythonの場合、`os.path.abspath`や、`pathlib.Path.resolve`を使うことで絶対パスやフルパスを取得できます。

<div class="code-box">
<div class="title">os.path.abspathを使う</div>
<div class="copy-button">Copy</div>
<pre>
import os

print(os.path.abspath(<em class="blue">r"C:\temp\temp2\..\test2.txt"</em>))
</pre>
</div>
<div class="code-box">
<div class="title">出力結果</div>
<div class="copy-button">Copy</div>
<pre>
C:\temp\test2.txt
</pre>
</div>

<div class="code-box">
<div class="title">pathlib.Path.resolveを使う</div>
<div class="copy-button">Copy</div>
<pre>
import pathlib

print(pathlib.Path(<em class="blue">r"C:\temp\temp2\..\test2.txt"</em>)<em>.resolve()</em>)
</pre>
</div>
<div class="code-box">
<div class="title">出力結果</div>
<div class="copy-button">Copy</div>
<pre>
C:\temp\test2.txt
</pre>
</div>

### 参照
- [pathlib](https://docs.python.org/ja/3/library/pathlib.html)
- [os.path.abspath](https://docs.python.org/ja/3/library/os.path.html#os.path.abspath)
- [pathlib.Path.resolve](https://docs.python.org/ja/3/library/pathlib.html#pathlib.Path.resolve)

### 参考サイト
- [(TechAcademyマガジン) Pythonでファイルの絶対パスを取得する方法【初心者向け】現役エンジニアが解説](https://stackoverflow.com/questions/3502611/canonical-file-path-in-ruby)
- [(Qiita) Pathlibのabsoluteとresolve](https://qiita.com/hayata-yamamoto/items/7ceb60499e00e238d20e)

{% include goto_pagetop.html %}

* * *
## <a name="PowerShellで絶対パス・フルパスを取得する">PowerShellで絶対パス・フルパスを取得する</a><a class="heading-anchor-permalink" href="#PowerShellで絶対パス・フルパスを取得する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-13" updated="2022-02-13" %}</div>
- PowerShellの場合、`Resolve-Path`で取得できます。

<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
<em class="command">PS C:\temp\java-currentver&gt;</em> ls


    ディレクトリ: C:\temp\java-currentver


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----        2019/11/08     21:30                bin
d-----        2019/11/08     21:30                conf
d-----        2019/11/08     21:30                include
d-----        2019/11/08     21:30                jmods
d-----        2019/11/08     21:30                legal
d-----        2019/11/08     21:30                lib
-a----        2019/10/06     12:01           3244 COPYRIGHT
-a----        2019/11/08     21:30           1263 release


<em class="command">PS C:\temp\java-currentver&gt;</em> cd lib
<em class="command">PS C:\temp\java-currentver\lib&gt;</em> <em>Resolve-Path</em> <em class="blue">..\bin</em>

Path
----
C:\temp\java-currentver\bin
</pre>
</div>

### 参照
- [(Microsoft \| Docs) Resolve-Path](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/resolve-path?view=powershell-7.1)

{% include goto_pagetop.html %}

* * *
## <a name="関連メモ">関連メモ</a><a class="heading-anchor-permalink" href="#関連メモ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-13" updated="2022-02-13" %}</div>
- [Rubyのメモ]({{link_to_it_ruby}})
- [Pythonのメモ]({{link_to_it_python}})
- [PowerShellのメモ]({{link_to_it_powershell}})

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
