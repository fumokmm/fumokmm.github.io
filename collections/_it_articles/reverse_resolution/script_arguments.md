---
title: スクリプトの引数
article_group_id: invoke-program-group
display_order: 20
created: 2022-03-17
updated: 2022-03-17
---
{% capture link_to_it_powershell %}{% link _it_articles/powershell/index.md %}{% endcapture %}{% assign link_to_it_powershell = link_to_it_powershell | remove: 'index' %}
## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#PowerShellのスクリプトの引数">PowerShellのスクリプトの引数</a></li>
<li><a href="#関連メモ">関連メモ</a></li>
</ul>

* * *
## <a name="PowerShellのスクリプトの引数">PowerShellのスクリプトの引数</a><a class="heading-anchor-permalink" href="#PowerShellのスクリプトの引数">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-03-17" updated="2022-03-17" %}</div>
- PowerShellの場合、通常の方法と、`Param()`を使う方法があります。

### 通常の方法
- スクリプトの引数は自動的に`$Args[]`に格納されます。
- 第1引数は`$Args[0]`、第2引数は`$Args[1]`という形式で取得できます。
<div class="code-box">
<div class="title">test1.ps1</div>
<pre>
Write-Host <em>$Args[0]</em>
Write-Host <em class="blue">$Args[1]</em>
</pre>
</div>
<div class="code-box-output">
<div class="title">実行結果</div>
<pre>
<em class="command">PS C:\temp&gt;</em> .\test1.ps1 <em>aaa</em> <em class="blue">100</em>
aaa
100
</pre>
</div>

### Param()
- Paramを使ってあらかじめ引数を宣言しておくことができます。
<div class="code-box">
<div class="title">test2.ps1</div>
<pre>
Param(<em>$Arg1</em>, <em class="blue">$Arg2</em>) <em class="comment">#第一引数を$Arg1, 第二引数を$Arg2に格納する</em>
Write-Host <em>$Arg1</em>
Write-Host <em class="blue">$Arg2</em>
</pre>
</div>
- 通常に呼び出したり、明示的に名前を指定して呼び出したりできます。
<div class="code-box-output">
<div class="title">実行結果</div>
<pre>
<em class="command">PS C:\temp&gt;</em> .\test2.ps1 <em>aaa</em> <em class="blue">100</em>
aaa
100
<em class="command">PS C:\temp&gt;</em> .\test2.ps1 <em>-Arg1 aaa</em> <em class="blue">-Arg2 100</em>
aaa
100
<em class="command">PS C:\temp&gt;</em> .\test2.ps1 <em class="blue">-Arg2 100</em> <em>-Arg1 aaa</em>
aaa
100
</pre>
</div>
- 引数の型を宣言したり、初期値をセットしたり、必須パラメータにしたりといろいろ指定できますが割愛します。
- 詳細は参考サイトをご覧ください。

### 参考サイト
- [(マイクロソフ党ブログ) Powershellで引数を受け取る](https://microsoftou.com/ps-arguments/)

{% include goto_pagetop.html %}

* * *
## <a name="関連メモ">関連メモ</a><a class="heading-anchor-permalink" href="#関連メモ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-03-17" updated="2022-03-17" %}</div>
- [PowerShellのメモ]({{link_to_it_powershell}})

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
