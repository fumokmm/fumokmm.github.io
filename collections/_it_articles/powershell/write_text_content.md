---
title: PowerShellでテキストの書き込みを行う
article_group_id: reverse-lookup-group
display_order: 80
created: 2021-06-14
updated: 2021-06-14
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#Set-Contentを利用する">Set-Contentを利用する</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="Set-Contentを利用する">Set-Contentを利用する</a><a class="heading-anchor-permalink" href="#Set-Contentを利用する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-14" updated="2021-06-14" %}</div>
`Set-Content`を使います。

<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
$str = @'
aaaaa
あああああ
1234567890
'@

<em class="comment"># 通常の使い方、-Pathで出力先を指定し、 -Value で出力する内容を指定する</em>
<em>Set-Content</em> -Path C:\temp\out.txt -Value $str

<em class="comment"># -Value は省略可</em>
<em>Set-Content</em> -Path C:\temp\out2.txt $str

<em class="comment"># -Value はパイプラインでも受け取り可</em>
Get-ChildItem C:\temp | <em>Set-Content</em> -Path C:\temp\out3.txt
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-14" updated="2021-06-14" %}</div>
### ソース
- [(language-examples) 0003_set-content.ps1](https://github.com/fumokmm/language-examples/blob/main/PowerShell/0003_set-content.ps1)

### 参照
- [(Microsoft \| Docs) Set-Content](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/set-content?view=powershell-7.1)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
