---
title: Liquidのフィルター
display_order: 30
created: 2021-06-02
updated: 2021-06-02
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#size">size</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="size">size</a><a class="heading-anchor-permalink" href="#size">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-02" updated="2021-06-02" %}</div>
{% raw %}
配列のサイズ(長さ)を調べたり、文字列の文字数を取得したりします。

<div class="code-box-syntax">
<div class="title">配列の長さ(サイズ)を取得</div>
<pre>
{% assign my_array = "リンゴ, みかん, もも, 梅" | split: ", " %}
{{ my_array.size }}
</pre>
</div>
<div class="code-box-output">
<div class="title">結果</div>
<pre>
4
</pre>
</div>

<div class="code-box-syntax">
<div class="title">文字列の長さ(文字数)を取得</div>
<pre>
{{ "abcde" | size }}
</pre>
</div>
<div class="code-box-output">
<div class="title">結果</div>
<pre>
5
</pre>
</div>
{% endraw %}

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-02" updated="2021-06-02" %}</div>
### 参照
- [Liquid](https://shopify.github.io/liquid/)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
