---
title: PowerShellの文法
article_group_id: basis-group
display_order: 10
created: 2021-05-16
updated: 2021-05-16
---

## <a name="index">目次</a>

<ul id="index_ul">
<li><a href="#basis">1. 基礎</a></li>
<li><a href="#reference">参考</a></li>
</ul>

* * *
## <a name="basis">1. 基礎</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-16" updated="2021-05-16" %}</div>
### コンソールに文字表示
`Write-Host`コマンドレットを使用します。
<div class="code-box">
<div class="title">コンソールに文字表示</div>
<pre>
<em>Write-Host</em> <em class="blue">"Hello world"</em>
</pre>
</div>

### コメント
コメントには`#`を使用します。
<div class="code-box">
<div class="title">コンソールに文字表示</div>
<pre>
<em class="comment"># ここはコメント</em>
</pre>
</div>

複数行コメントには`<#`と`#>`を使用します。
<div class="code-box">
<div class="title">コンソールに文字表示</div>
<pre>
<em class="comment">&lt;#
ここは複数行
コメントです。
#&gt;</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="reference">参考</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-16" updated="2021-05-16" %}</div>
- [(PowerShell Scripting Weblog) PowerShell基礎文法最速マスター](http://winscript.jp/powershell/202)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
