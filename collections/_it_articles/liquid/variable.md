---
title: Liquidの変数設定
display_order: 20
created: 2021-09-08
updated: 2021-09-08
---
いくつかの方法で変数に値を設定することができます。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#assign">assign</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="assign">assign</a><a class="heading-anchor-permalink" href="#assign">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-08" updated="2021-09-08" %}</div>
`assign`で新しい名前の変数を作成します。

{% raw %}
<div class="code-box-syntax no-title">
<div class="copy-button">Copy</div>
<pre>
{% <em>assign</em> <em class="blue">&lt;変数名&gt;</em> = <em class="orange">&lt;値&gt;</em> %}
</pre>
</div>
{% endraw %}

### 例
{% raw %}
<div class="code-box">
<div class="title">Input</div>
<div class="copy-button">Copy</div>
<pre>
{% assign my_variable = false %}
{% if my_variable != true %}
  This statement is valid.
{% endif %}
</pre>
</div>
<div class="code-box-output">
<div class="title">Output</div>
<div class="copy-button">Copy</div>
<pre>
  This statement is valid.
</pre>
</div>
{% endraw %}

- `if`については[こちら]({% link _it_articles/liquid/control_flow.md %}#if)。

値をダブルクォート(`"`)で囲んであげると、文字列の変数として設定できます。

{% raw %}
<div class="code-box">
<div class="title">Input</div>
<div class="copy-button">Copy</div>
<pre>
{% assign foo = <em>"bar"</em> %}
{{ foo }}
</pre>
</div>
<div class="code-box-output">
<div class="title">Output</div>
<div class="copy-button">Copy</div>
<pre>
bar
</pre>
</div>
{% endraw %}

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-08" updated="2021-09-08" %}</div>
### 参照
- [(Liquid) Variable](https://shopify.github.io/liquid/tags/variable/)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
