---
title: カンマ区切りの文字列を作る
display_order: 30
created: 2021-11-18
updated: 2021-11-18
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#お題">お題</a></li>
<li><a href="#Pythonで解いてみた">Pythonで解いてみた</a></li>
</ul>

* * *
## <a name="お題">お題</a><a class="heading-anchor-permalink" href="#お題">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-18" updated="2021-11-18" %}</div>
<div class="code-box">
<div class="title">お題</div>
<pre>
?が10個をカンマ区切り(カンマの後に半角スペースが1つある)にした文字列を作成せよ
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="Pythonで解いてみた">Pythonで解いてみた</a><a class="heading-anchor-permalink" href="#Pythonで解いてみた">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-18" updated="2021-11-18" %}</div>
<div class="code-box no-title">
<pre>
params = <em>", ".join(["?"] * 10)</em>
print(params)
</pre>
</div>
<div class="code-box-output no-title">
<pre>
?, ?, ?, ?, ?, ?, ?, ?, ?, ?
</pre>
</div>
- 解説は[こちら]({% link _it_articles/python/creating_a_comma_separated_string.md %})のメモを参照。

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
