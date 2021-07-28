---
title: PowerShellでファイルをコピーする
article_group_id: reverse-lookup
display_order: 40
created: 2021-07-28
updated: 2021-07-28
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#Copy-Itemを利用する">Copy-Itemを利用する</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="Copy-Itemを利用する">Copy-Itemを利用する</a><a class="heading-anchor-permalink" href="#Copy-Itemを利用する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-28" updated="2021-07-28" %}</div>
- `Copy-Item`を使います。  
- コピー元のファイルを`-Path`で、コピー先のファイルを`-Destination`で指定します。
- コピー先のファイルが読み取り専用だった場合、エラーとなります。
<div class="code-box-syntax no-title">
<pre>
Copy-Item -Path <em>&lt;コピー元パス&gt;</em> -Destination <em>&lt;コピー先パス&gt;</em>
</pre>
</div>

### 上書きコピー
- 上書きコピーする場合は`-Force`オプションを付けます。
- コピー先のファイルが読み取り専用だった場合でもエラーとなりません。
<div class="code-box-syntax no-title">
<pre>
Copy-Item -Path <em>&lt;コピー元パス&gt;</em> -Destination <em>&lt;コピー先パス&gt;</em> <em class="orange">-Force</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-28" updated="2021-07-28" %}</div>
### 関連メモ
- [PowerShellでファイルを移動する]({% link _it_articles/powershell/move_item.md %})

### 参照
- [(Microsoft \| Docs) Copy-Item](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/copy-item)

### 参考サイト
- [(テックマガジン from FEnetインフラ) PowerShellでファイルコピーをする方法とは？PowerShellのインストール方法も紹介！](https://www.fenet.jp/infla/column/engineer/powershell%E3%81%A7%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%B3%E3%83%94%E3%83%BC%E3%82%92%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95%E3%81%A8%E3%81%AF%EF%BC%9Fpowershell%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9/)

### ソース
- [(language-examples) 0016_file_operation.ps1](https://github.com/fumokmm/language-examples/blob/main/PowerShell/0016_file_operation.ps1)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
