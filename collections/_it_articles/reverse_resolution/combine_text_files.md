---
title: テキストファイルを結合する
article_group_id: file-io-group
display_order: 30
created: 2022-04-12
updated: 2022-04-12
---
{% capture link_to_it_powershell %}{% link _it_articles/powershell/index.md %}{% endcapture %}{% assign link_to_it_powershell = link_to_it_powershell | remove: 'index' %}

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#PowerShellでテキストファイルを結合する">PowerShellでテキストファイルを結合する</a></li>
<li><a href="#関連メモ">関連メモ</a></li>
</ul>

* * *
## <a name="PowerShellでテキストファイルを結合する">PowerShellでテキストファイルを結合する</a><a class="heading-anchor-permalink" href="#PowerShellでテキストファイルを結合する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-12" updated="2022-04-12" %}</div>
- PowerShellの場合、`Get-Content`と`Set-Content`を組み合わせると簡単です。

<div class="code-box no-title">
<pre>
<em>Get-Content</em> `
aaa.txt, `
bbb.txt `
| <em>Set-Content</em> ccc.txt
</pre>
</div>
<div class="code-box-input">
<div class="title">aaa.txt</div>
<pre>
aaa
aaa
aaa
</pre>
</div>
<div class="code-box-input">
<div class="title">bbb.txt</div>
<pre>
bbb
bbb
bbb
</pre>
</div>
<div class="code-box-output">
<div class="title">ccc.txt</div>
<pre>
aaa
aaa
aaa
bbb
bbb
bbb
</pre>
</div>

### 参考サイト
- [(WIN.JUST4FUN.BIZ) PowerShellでテキストファイルを連結する方法 †](https://win.just4fun.biz/?PowerShell/%E3%83%86%E3%82%AD%E3%82%B9%E3%83%88%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92%E9%80%A3%E7%B5%90%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95)
- [(スケ郎のお話) テキストファイルを結合するPowerShell](https://www.sukerou.com/2021/12/powershell.html)

### サンプルソース
- [(language-examples) 0021_combine_text_files](https://github.com/fumokmm/language-examples/blob/main/PowerShell/0021_combine_text_files.ps1)

{% include goto_pagetop.html %}

* * *
## <a name="関連メモ">関連メモ</a><a class="heading-anchor-permalink" href="#関連メモ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-12" updated="2022-04-12" %}</div>
- [PowerShellのメモ]({{link_to_it_powershell}})

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
