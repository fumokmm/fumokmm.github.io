---
title: PowerShellで実行中のスクリプトのあるディレクトリを取得
article_group_id: reverse-lookup
display_order: 50
created: 2020-09-18
updated: 2021-07-25
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#$PSScriptRootを利用する">$PSScriptRootを利用する</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="$PSScriptRootを利用する">$PSScriptRootを利用する</a><a class="heading-anchor-permalink" href="#$PSScriptRootを利用する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-09-18" updated="2021-07-25" %}</div>
PowerShell v3以降向け。  
`$PSScriptRoot`という`自動変数`にスクリプトファイル(.ps1)がどこに置かれているかが格納されているようです。

<div class="code-box">
<div class="title">スクリプトファイル(.ps1)がどこに置かれているか</div>
<pre>
Write-Host $PSScriptRoot
</pre>
</div>

### 参考
- [(Windows にまつわる e.t.c.) スクリプトフォルダーの取得](https://www.vwnet.jp/Windows/PowerShell/pwd.htm)

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-09-18" updated="2021-07-25" %}</div>
### 参考サイト
- [(Windows にまつわる e.t.c.) スクリプトフォルダーの取得](https://www.vwnet.jp/Windows/PowerShell/pwd.htm)

### ソース
- [language-examples](https://github.com/fumokmm/language-examples/blob/main/PowerShell/0014_script_filename_and_directory.ps1)

### 関連メモ
- [PowerShellで実行中のスクリプトのファイル名を取得する]({% link _it_articles/powershell/get_the_file_name_of_the_running_script.md %})

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
