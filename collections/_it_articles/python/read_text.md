---
title: Pythonでテキストファイルの読み込みを行う
article_group_id: reverse-lookup-group
display_order: 10
created: 2021-10-13
updated: 2021-10-13
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#open関数">open関数</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="open関数">open関数</a><a class="heading-anchor-permalink" href="#open関数">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-13" updated="2021-10-13" %}</div>
`open関数`を使います。  
色々オプションがあるので良く使うものをとりあえず。
<div class="code-box-syntax no-title">
<div class="copy-button">Copy</div>
<pre>
f = open(&lt;file&gt;, &lt;mode&gt;)
</pre>
</div>
- `<file>`には開くファイル名を指定します。
- `<mode>`にはファイルを開くモード(文字列で指定)を指定します。
- モードに指定できるものは以下。
<table class="normal">
	<tr>
		<th markdown="span">モード</th>
		<th markdown="span">説明</th>
	</tr>
	<tr>
		<td markdown="span">r</td>
		<td markdown="span">読み込み用(ファイルが存在しない場合はエラー)</td>
	</tr>
	<tr>
		<td markdown="span">r+</td>
		<td markdown="span">読み込みおよび書き込み用(ファイルが存在しない場合はエラー)</td>
	</tr>
	<tr>
		<td markdown="span">w</td>
		<td markdown="span">書き込み用(ファイルの中身をクリア)</td>
	</tr>
	<tr>
		<td markdown="span">w+</td>
		<td markdown="span">読み込みおよび書き込み用(ファイルの中身をクリア)</td>
	</tr>
	<tr>
		<td markdown="span">a</td>
		<td markdown="span">書き込み用(ファイルの末尾に追加)</td>
	</tr>
	<tr>
		<td markdown="span">a+</td>
		<td markdown="span">読み込みおよび書き込み用(ファイルの末尾に追加)</td>
	</tr>
	<tr>
		<td markdown="span">x</td>
		<td markdown="span">書き込み用(ファイルが存在している場合はエラー)</td>
	</tr>
	<tr>
		<td markdown="span">x+</td>
		<td markdown="span">読み込みおよび書き込み用(ファイルが存在している場合はエラー)</td>
	</tr>
	<tr>
		<td markdown="span">b</td>
		<td markdown="span">バイナリモード</td>
	</tr>
	<tr>
		<td markdown="span">t</td>
		<td markdown="span">テキストモード</td>
	</tr>
</table>

### 例
<div class="code-box">
<div class="title">読み取りで開く</div>
<div class="copy-button">Copy</div>
<pre>
f = open('sample.txt', 'r')
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-13" updated="2021-10-13" %}</div>
### 参照
- [(Python Documentation) 組み込み関数 open()](https://docs.python.org/ja/3/library/functions.html#open)
- [(Python Documentation) file object](https://docs.python.org/ja/3/glossary.html#term-file-object)

### 参考サイト
- [(Let'sプログラミング) ファイルを開く/ファイルを閉じる](https://www.javadrive.jp/python/file/index1.html)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
