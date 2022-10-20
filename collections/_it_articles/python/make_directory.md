---
title: Pythonでフォルダを作成する
article_group_id: reverse-lookup-group
display_order: 30
created: 2021-10-25
updated: 2021-10-25
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#os.mkdir()">os.mkdir()</a></li>
<li><a href="#os.makedirs()">os.makedirs()</a></li>
<li><a href="#pathlib.Path().mkdir()">pathlib.Path().mkdir()</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-25" updated="2021-10-25" %}</div>
Pythonで新しくフォルダを作成するには、標準モジュール`os`を使うか、  
パスをオブジェクトとして操作できる`pathlib`モジュールを使う方法(Python3.4以降)があります。

<table class="normal">
	<tr>
		<th markdown="span">方法</th>
		<th markdown="span">説明</th>
	</tr>
	<tr>
		<td markdown="span">`os.mkdir()`</td>
		<td markdown="span">新しくディレクトリを作成します。</td>
	</tr>
	<tr>
		<td markdown="span">`os.makedirs()`</td>
		<td markdown="span">深い階層のディレクトリまで再帰的に作成します。</td>
	</tr>
	<tr>
		<td markdown="span">`pathlib.Path('temp/dir').mkdir()`</td>
		<td markdown="span">新しくディレクトリを作成します。</td>
	</tr>
</table>

{% include goto_pagetop.html %}

* * *
## <a name="os.mkdir()">os.mkdir()</a><a class="heading-anchor-permalink" href="#os.mkdir()">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-25" updated="2021-10-25" %}</div>
- `os.mkdir()`は、引数で指定したパス文字列の場所に新しくディレクトリが作成できます。
  - 既に存在しているディレクトリを指定するとエラー(`FileExistsError`)が発生します。
  - まだ存在していないディレクトリの中に新たなディレクトリを作成する場合もエラー(`FileNotFoundError`)が発生します。
- `os.mkdir()`を使う場合は作成するディレクトリの直上までのディレクトリが存在している必要があります。
  - 一気に新規作成するには[#os.makedirs()]を使います。

<div class="code-box">
<div class="title">C:\temp2ディレクトリを作成</div>
<div class="copy-button">Copy</div>
<pre>
import os
os<em>.mkdir</em>("C:\\temp2")
</pre>
</div>

### 参考
- [os.mkdir()](https://docs.python.org/ja/3/library/os.html#os.mkdir)

{% include goto_pagetop.html %}

* * *
## <a name="os.makedirs()">os.makedirs()</a><a class="heading-anchor-permalink" href="#os.makedirs()">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-25" updated="2021-10-25" %}</div>
- `os.makedirs()`は、深い階層のディレクトリまで再帰的に一気に作成できます。
- 既に存在しているディレクトリを指定するとエラー(`FileExistsError`)が発生します。

<div class="code-box">
<div class="title">C:\temp2\temp3\temp4\temp5 ディレクトリを作成</div>
<div class="copy-button">Copy</div>
<pre>
import os
os<em>.makedirs</em>("C:\\temp2\\temp3\\temp4\\temp5")
</pre>
</div>

### 引数:exists_ok (Python3.2以降)
- Pythonのバージョン`3.2`で引数:`exist_ok`が追加されました。
- 引数:`exist_ok=True`を指定すると、ディレクトリが存在していてもエラーとなりません(デフォルトは`exist_ok=False`)。

<div class="code-box">
<div class="title">exist_ok=Trueを指定</div>
<div class="copy-button">Copy</div>
<pre>
import os
os<em>.makedirs</em>("C:\\temp2\\temp3\\temp4\\temp5", <em class="blue">exist_ok=True</em>)
</pre>
</div>

### 参考
- [os.makedirs()](https://docs.python.org/ja/3/library/os.html#os.makedirs)

{% include goto_pagetop.html %}

* * *
## <a name="pathlib.Path().mkdir()">pathlib.Path().mkdir()</a><a class="heading-anchor-permalink" href="#pathlib.Path().mkdir()">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-25" updated="2021-10-25" %}</div>
- `pathlib.Path().mkdir()`で新しくディレクトリが作成できます。
- 作成しようとするディレクトリの中間ディレクトリが存在していないとエラー(`FileNotFoundError`)が発生します。
- 既に存在しているディレクトリを指定するとエラー(`FileExistsError`)が発生します。

<div class="code-box">
<div class="title">C:\temp2\temp3\temp4\temp5 ディレクトリを作成</div>
<div class="copy-button">Copy</div>
<pre>
import pathlib
p = pathlib.Path("C:\\temp2\\temp3\\temp4\\temp5")
p<em>.mkdir</em>()
</pre>
</div>

### 引数:parents
- 中間ディレクトリもまとめて作成するには、引数:`parents=True`を指定します。
- 引数:`parents=True`を指定すると、中間ディレクトリディレクトリが存在していなくてもエラーとなりません(デフォルトは`parents=False`)

<div class="code-box">
<div class="title">parents=Trueを指定</div>
<div class="copy-button">Copy</div>
<pre>
import pathlib
p = pathlib.Path("C:\\temp3\\aaa\\bbb")
p<em>.mkdir</em>(<em class="blue">parents=True</em>)
</pre>
</div>

### 引数:exists_ok
- 引数:`exist_ok=True`を指定すると、ディレクトリが存在していてもエラーとなりません(デフォルトは`exist_ok=False`)。

<div class="code-box">
<div class="title">exist_ok=Trueを指定</div>
<div class="copy-button">Copy</div>
<pre>
import pathlib
p = pathlib.Path("C:\\temp3\\aaa\\bbb")
p<em>.mkdir</em>(<em class="blue">exist_ok=True</em>)
</pre>
</div>

### 参考
- [pathlib.Path.mkdir()](https://docs.python.org/ja/3/library/pathlib.html#pathlib.Path.mkdir)

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-25" updated="2021-10-25" %}</div>
### 参照
- [os.mkdir()](https://docs.python.org/ja/3/library/os.html#os.mkdir)
- [os.makedirs()](https://docs.python.org/ja/3/library/os.html#os.makedirs)

### 参考サイト
- [(note.nkmk.me) Pythonでディレクトリ（フォルダ）を作成するmkdir, makedirs](https://note.nkmk.me/python-os-mkdir-makedirs/)
- [(note.nkmk.me) Python, pathlibでディレクトリ（フォルダ）の作成・削除](https://note.nkmk.me/python-pathlib-mkdir-rmdir/)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
