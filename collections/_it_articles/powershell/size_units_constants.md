---
title: PowerShellでサイズ単位の定数を使う
article_group_id: tips-group
display_order: 20
created: 2021-08-11
updated: 2021-08-11
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#サイズ単位の定数">サイズ単位の定数</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="サイズ単位の定数">サイズ単位の定数</a><a class="heading-anchor-permalink" href="#サイズ単位の定数">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-11" updated="2021-08-11" %}</div>
- PowerShellではサイズ単位の定数として、キロバイト`KB`, メガバイト`MB`, ギガバイト`GB`, テラバイト`TB`, ペタバイト`PB`が用意されています。
- `1KB`や`100MB`のように`数値+定数`とすることで利用できます。

<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
Write-Host "1KB = $(1<em>KB</em>.ToString('#,#'))バイト"
Write-Host "1MB = $(1<em>MB</em>.ToString('#,#'))バイト"
Write-Host "1GB = $(1<em>GB</em>.ToString('#,#'))バイト"
Write-Host "1TB = $(1<em>TB</em>.ToString('#,#'))バイト"
Write-Host "1PB = $(1<em>PB</em>.ToString('#,#'))バイト"
</pre>
</div>

<div class="code-box-output">
<div class="title">出力結果</div>
<div class="copy-button">Copy</div>
<pre>
1KB = 1,024バイト
1MB = 1,048,576バイト
1GB = 1,073,741,824バイト
1TB = 1,099,511,627,776バイト
1PB = 1,125,899,906,842,624バイト
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-11" updated="2021-08-11" %}</div>
### 参照
- [(PowerShell Magazine) Converting to size units (KB, MB,GB,TB, and PB) without using PowerShell multipliers](https://powershellmagazine.com/2013/05/20/converting-to-size-units-kb-mbgbtb-and-pb-without-using-powershell-multipliers/)
- [(Microsoft \| Scripting) Formatting PowerShell Decimal Places](https://devblogs.microsoft.com/scripting/formatting-powershell-decimal-places/)

### ソース
- [(language-examples) 0020_size_units_constants.ps1](https://github.com/fumokmm/language-examples/blob/main/PowerShell/0020_size_units_constants.ps1)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
