---
title: PowerShellでテキストファイルの先頭からN行を取り出す
display_order: 20
created: 2021-04-23
updated: 2021-04-23
---

## <a name="index">目次</a>

<ul id="index_ul">
<li><a href="#method">やり方</a></li>
<li><a href="#reference">参考</a></li>
</ul>

* * *
## <a name="method">やり方</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-04-23" updated="2021-04-23" %}</div>
<div class="code-box-syntax">
<div class="title">書式</div>
<pre>
Get-Content <em>&lt;ファイルのパス&gt;</em> -TotalCount <em>&lt;取得したい行数&gt;</em>
</pre>
</div>

### 例：test.txtの先頭から6行だけ取り出す
<div class="code-box-input">
<div class="title">C:\temp\test.txt</div>
<pre>
aaa
bbb
ccc
ddd
eee
fff
ggg
hhh
...
...
</pre>
</div>

<div class="code-box-output">
<div class="title">実行結果</div>
<pre>
PS C:\Users\fumo&gt; <em class="command">Get-Content C:\temp\test.txt -TotalCount 6</em>
<em>aaa
bbb
ccc
ddd
eee
fff</em>
PS C:\Users\fumo&gt;
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="reference">参考</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-04-23" updated="2021-04-23" %}</div>
### 関連リンク
- [(Microsoft Docs) Get-Content](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-content?view=powershell-7.1)

### 参考
- [(Windows PowerShellサポート) Windows Powershellによる先頭から特定の行数ほどテキストファイルを出力する方法を紹介](https://www.wannko.net/powershell/file/get-content1.html)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
