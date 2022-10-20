---
title: 正規表現で前方一致、前方不一致、後方一致、後方不一致を指定する
article_group_id: regular-expression-group
display_order: 20
created: 2022-04-04
updated: 2022-04-04
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#前方一致 (?<=expression)">前方一致 (?<=expression)</a></li>
<li><a href="#前方不一致 (?<!expression)">前方不一致 (?<!expression)</a></li>
<li><a href="#後方一致 (?=expression)">後方一致 (?=expression)</a></li>
<li><a href="#後方不一致 (?!expression)">後方不一致 (?!expression)</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="前方一致 (?<=expression)">前方一致 (?<=expression)</a><a class="heading-anchor-permalink" href="#前方一致 (?<=expression)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-04" updated="2022-04-04" %}</div>
<div class="code-box-syntax">
<div class="title">正規表現</div>
<div class="copy-button">Copy</div>
<pre>
(?&lt;=expression)
</pre>
</div>

<div class="code-box">
<div class="title">例) 前方が"abc"である"xyz"にヒット</div>
<div class="copy-button">Copy</div>
<pre>
(?&lt;=abc)xyz
</pre>
</div>
<div class="code-box-output">
<div class="title">赤文字部分がヒット</div>
<div class="copy-button">Copy</div>
<pre>
abc<em>xyz</em>
ab9xyz
abcxy9
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="前方不一致 (?<!expression)">前方不一致 (?<!expression)</a><a class="heading-anchor-permalink" href="#前方不一致 (?<!expression)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-04" updated="2022-04-04" %}</div>
<div class="code-box-syntax">
<div class="title">正規表現</div>
<div class="copy-button">Copy</div>
<pre>
(?&lt;!expression)
</pre>
</div>

<div class="code-box">
<div class="title">例) 前方が"abc"でない"xyz"にヒット</div>
<div class="copy-button">Copy</div>
<pre>
(?&lt;!abc)xyz
</pre>
</div>
<div class="code-box-output">
<div class="title">赤文字部分がヒット</div>
<div class="copy-button">Copy</div>
<pre>
abcxyz
ab9<em>xyz</em>
abcxy9
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="後方一致 (?=expression)">後方一致 (?=expression)</a><a class="heading-anchor-permalink" href="#後方一致 (?=expression)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-04" updated="2022-04-04" %}</div>
<div class="code-box-syntax">
<div class="title">正規表現</div>
<div class="copy-button">Copy</div>
<pre>
(?=expression)
</pre>
</div>

<div class="code-box">
<div class="title">例) 後方が"xyz"である"abc"にヒット</div>
<div class="copy-button">Copy</div>
<pre>
abc(?=xyz)
</pre>
</div>
<div class="code-box-output">
<div class="title">赤文字部分がヒット</div>
<div class="copy-button">Copy</div>
<pre>
<em>abc</em>xyz
ab9xyz
abcxy9
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="後方不一致 (?!expression)">後方不一致 (?!expression)</a><a class="heading-anchor-permalink" href="#後方不一致 (?!expression)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-04" updated="2022-04-04" %}</div>
<div class="code-box-syntax">
<div class="title">正規表現</div>
<div class="copy-button">Copy</div>
<pre>
(?!expression)
</pre>
</div>

<div class="code-box">
<div class="title">例) 後方が"xyz"でない"abc"にヒット</div>
<div class="copy-button">Copy</div>
<pre>
abc(?!xyz)
</pre>
</div>
<div class="code-box-output">
<div class="title">赤文字部分がヒット</div>
<div class="copy-button">Copy</div>
<pre>
abcxyz
ab9xyz
<em>abc</em>xy9
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-04" updated="2022-04-04" %}</div>
### 参考サイト
- [(Qiita) 正規表現での前方一致、前方不一致、後方一致、後方不一致](https://qiita.com/heppokofrontend/items/9d17bce4c67858804154)
- [(秀丸) (?<＝expression) 前方一致指定（Ver9.00対応版](https://help.maruo.co.jp/hidemaru/html/190_CmdSearch_Regular_BeforeMatch.html)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
