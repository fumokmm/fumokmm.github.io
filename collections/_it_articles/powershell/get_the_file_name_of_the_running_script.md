---
title: PowerShellで実行中のスクリプトのファイル名を取得する
article_group_id: reverse-lookup
display_order: 60
created: 2020-09-18
updated: 2021-07-25
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#$PSCommandPathを利用する">$PSCommandPathを利用する</a></li>
<li><a href="#$Script:MyInvocation.MyCommandを利用する">$Script:MyInvocation.MyCommandを利用する</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="$PSCommandPathを利用する">$PSCommandPathを利用する</a><a class="heading-anchor-permalink" href="#$PSCommandPathを利用する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-09-18" updated="2021-07-25" %}</div>
PowerShell v3以降向け。  
`$PSCommandPath`という`自動変数`にスクリプトファイル(.ps1)のパスが格納されているようです。  
これを`\`で分割して最後の要素を取得すれば実行中のスクリプトのファイル名が取得できます。

<div class="code-box no-title">
<pre>
# スクリプトファイル(.ps1)のパス
$scriptName1 = Split-Path -Leaf <em>$PSCommandPath</em>
Write-Host $scriptName1
</pre>
</div>

### 参考
- [(バヤシタ) 実行中のスクリプトのファイル名を取得する方法](https://bayashita.com/p/entry/show/207)

{% include goto_pagetop.html %}

* * *
## <a name="$Script:MyInvocation.MyCommandを利用する">$Script:MyInvocation.MyCommandを利用する</a><a class="heading-anchor-permalink" href="#$Script:MyInvocation.MyCommandを利用する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-25" updated="2021-07-25" %}</div>
PowerShell v2以前向け。  
`$Script:MyInvocation.MyCommand.Path`にはスクリプトファイルのフルパスが、  
`$Script:MyInvocation.MyCommand.Name`にはスクリプトファイル名が格納されているようですので、  
以下のようにすればファイル名が取得できます。

<div class="code-box no-title">
<pre>
# スクリプトファイル(.ps1)のパス
$scriptName2 = Split-Path -Leaf <em>$Script:MyInvocation.MyCommand</em><em class="blue">.Path</em>
Write-Host $scriptName2

# スクリプトファイル名
$scriptName3 = <em>$Script:MyInvocation.MyCommand</em><em class="blue">.Name</em>
Write-Host $scriptName3
</pre>
</div>

### 参考
- [(Windows にまつわる e.t.c.) スクリプトフォルダーの取得](https://www.vwnet.jp/Windows/PowerShell/pwd.htm)

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-09-18" updated="2021-07-25" %}</div>
- [(バヤシタ) 実行中のスクリプトのファイル名を取得する方法](https://bayashita.com/p/entry/show/207)
- [(Windows にまつわる e.t.c.) スクリプトフォルダーの取得](https://www.vwnet.jp/Windows/PowerShell/pwd.htm)

### ソース
- [language-examples](https://github.com/fumokmm/language-examples/blob/main/PowerShell/0014_script_filename.ps1)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
