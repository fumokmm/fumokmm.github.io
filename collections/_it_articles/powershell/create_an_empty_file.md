---
title: PowerShellで空ファイルを作成する
article_group_id: reverse-lookup
display_order: 30
created: 2021-04-30
updated: 2021-08-13
---
いわゆるLinuxで言うところの`touch`コマンド。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#空ファイルを作成する">空ファイルを作成する</a></li>
<li><a href="#既存ファイルがあった場合、上書きする">既存ファイルがあった場合、上書きする</a></li>
<li><a href="#指定した文字列をファイルに含める">指定した文字列をファイルに含める</a></li>
<li><a href="#空ファイルではなく空ディレクトリを作成する">空ファイルではなく空ディレクトリを作成する</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="空ファイルを作成する">空ファイルを作成する</a><a class="heading-anchor-permalink" href="#空ファイルを作成する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-04-30" updated="2021-04-30" %}</div>
`New-Item`コマンドレットを使います。
<div class="code-box-syntax">
<div class="title">空ファイルを作成する</div>
<pre>
New-Item <em>&lt;ファイルのパス&gt;</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="既存ファイルがあった場合、上書きする">既存ファイルがあった場合、上書きする</a><a class="heading-anchor-permalink" href="#既存ファイルがあった場合、上書きする">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-04-30" updated="2021-04-30" %}</div>
`-Force`オプション付けると、既存ファイルがあった場合上書きします。
<div class="code-box-syntax">
<div class="title">空ファイルを作成する(既存ファイルがあった場合上書き)</div>
<pre>
New-Item &lt;ファイルのパス&gt; <em>-Force</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="指定した文字列をファイルに含める">指定した文字列をファイルに含める</a><a class="heading-anchor-permalink" href="#指定した文字列をファイルに含める">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-04-30" updated="2021-04-30" %}</div>
空ファイルではなくて、指定した文字列が入っているファイルを作成するには、`-Value`オプションを利用します。
<div class="code-box-syntax">
<div class="title">ファイルを作成する(指定した文字列をファイルに含める)</div>
<pre>
New-Item &lt;ファイルのパス&gt; <em>-Value</em> <em class="blue">&lt;含めたい文字列&gt;</em>
</pre>
</div>

### 例：test.txtにabcという文字列が入ったファイルを作成する
<div class="code-box-output">
<div class="title">PowerShell</div>
<pre>
PS C:\Users\fumo&gt; <em class="command">New-Item C:\temp\test.txt -Value abc</em>
</pre>
</div>

<div class="code-box-output">
<div class="title">C:\temp\test.txt</div>
<pre>
abc
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="空ファイルではなく空ディレクトリを作成する">空ファイルではなく空ディレクトリを作成する</a><a class="heading-anchor-permalink" href="#空ファイルではなく空ディレクトリを作成する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-04-30" updated="2021-04-30" %}</div>
ちょっと脇道に逸れますが、`New-Item`で作成できるので関連として紹介します。  

空ファイルではなくて、空ディレクトリを作成するには`-ItemType`で`Directory`を指定します。
<div class="code-box-syntax">
<div class="title">空ディレクトリを作成する</div>
<pre>
New-Item &lt;ファイルのパス&gt; <em>-ItemType</em> <em class="blue">Directory</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-04-30" updated="2021-08-13" %}</div>
### 関連メモ
- [Windows Batchで空ファイルを作成する]({% link _it_articles/windows_batch/create_an_empty_file.md %})

### 参考サイト
- [(@IT) 【 New-Item 】コマンドレット――ファイル／フォルダを新規作成する](https://www.atmarkit.co.jp/ait/articles/1606/23/news017.html)
- [(バヤシタ) 空のファイルやフォルダを新規作成する方法](https://bayashita.com/p/entry/show/37)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
