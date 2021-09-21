---
title: Windowsで手っ取り早く繰り返し文字を作る方法
article_group_id: tips-group
display_order: 10
created: 2020-12-29
updated: 2021-09-21
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#PowerShellを使う">PowerShellを使う</a></li>
</ul>

* * *
## <a name="PowerShellを使う">PowerShellを使う</a><a class="heading-anchor-permalink" href="#PowerShellを使う">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-29" updated="2021-09-21" %}</div>
{% capture link_to_powershell %}{% link _it_articles/powershell/index.md %}{% endcapture %}

手っ取り早く繰り返し文字を作りたい場合  
例えば255文字の`A`が欲しい場合は、以下のように[PowerShell]({{link_to_powershell | remove: 'index' }})を利用すると速いです。

1. PowerShellを起動 (`Winキー` + `R` > `powershell` → `Enter`)
1. 'A'*255

<div class="code-box-output">
<div class="title">PowerShell</div>
<pre>
PS&gt; 'A'*255
</pre>
</div>
<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20201222/20201222115125.png)
</p>

あとは`コピー`するなり、`リダイレクト`するなりしてもらえたら使いやすいと思います。

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
