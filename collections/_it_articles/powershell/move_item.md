---
title: PowerShellでファイルを移動する
article_group_id: reverse-lookup
display_order: 45
created: 2021-07-28
updated: 2021-07-28
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#Move-Itemを利用する">Move-Itemを利用する</a></li>
<li><a href="#使用例">使用例</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="Move-Itemを利用する">Move-Itemを利用する</a><a class="heading-anchor-permalink" href="#Move-Itemを利用する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-28" updated="2021-07-28" %}</div>
- `Move-Item`を使います。  
- 移動元のファイルを`-Path`で、移動先のファイルを`-Destination`で指定します。
- 移動先のファイルが既に存在していた場合、エラーとなります。
<div class="code-box-syntax no-title">
<pre>
Move-Item -Path <em>&lt;移動元パス&gt;</em> -Destination <em class="blue">&lt;移動先パス&gt;</em>
</pre>
</div>

### 上書きで移動
- 上書きで移動する場合は`-Force`オプションを付けます。
- 移動先のファイルが既に存在していた場合でもエラーとなりません。
<div class="code-box-syntax no-title">
<pre>
Move-Item -Path <em>&lt;移動元パス&gt;</em> -Destination <em class="blue">&lt;移動先パス&gt;</em> <em class="orange">-Force</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="使用例">使用例</a><a class="heading-anchor-permalink" href="#使用例">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-28" updated="2021-07-28" %}</div>
### 同ファイル名で別フォルダへ移動
<div class="code-box no-title">
<pre>
Move-Item -Path <em>C:\temp\test.txt</em> -Destination <em class="blue">C:\temp\bk\test.txt</em>
</pre>
</div>
- 既に`C:\temp\bk\test.txt`が存在していた場合エラーとなります。

### 同ファイル名で別フォルダへ移動(上書き)
<div class="code-box no-title">
<pre>
Move-Item -Path <em>C:\temp\test.txt</em> -Destination <em class="blue">C:\temp\bk\test.txt</em> <em class="orange">-Force</em>
</pre>
</div>
- 既に`C:\temp\bk\test.txt`が存在していてもエラーとなりません(上書きします)。

### リネームする
<div class="code-box no-title">
<pre>
Move-Item -Path <em>C:\temp\test.txt</em> -Destination <em class="blue">C:\temp\test2.txt</em>
</pre>
</div>
- リネームするのにも`Move-Item`が使えます。

### リネームしつつ移動
<div class="code-box no-title">
<pre>
Move-Item -Path <em>C:\temp\test.txt</em> -Destination <em class="blue">C:\temp\bk\test2.txt</em>
</pre>
</div>
- `test.txt`を`text2.txt`にしてフォルダも移動しています。

### ファイルを別のフォルダに移動
<div class="code-box no-title">
<pre>
Move-Item -Path <em>C:\temp\test.txt</em> -Destination <em class="blue">C:\temp\bk</em>
</pre>
</div>
- `-Destination`の方に`フォルダ`を指定することで、同じ名前で指定したフォルダへファイル移動できます。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-28" updated="2021-07-28" %}</div>
### 関連メモ
- [PowerShellでファイルをコピーする]({% link _it_articles/powershell/copy_item.md %})

### 参照
- [(Microsoft \| Docs) Move-Item](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/move-item)

### ソース
- [(language-examples) 0016_file_operation.ps1](https://github.com/fumokmm/language-examples/blob/main/PowerShell/0016_file_operation.ps1)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
