---
title: Liquidの制御フロー
display_order: 20
created: 2021-09-06
updated: 2021-09-06
---
制御フロータグでは、Liquidブロックを実行するかどうかを決定する様々な条件を定義します。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#if">if</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="if">if</a><a class="heading-anchor-permalink" href="#if">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-06" updated="2021-09-06" %}</div>
{% raw %}
- `if`は`条件`が`true`になるときのみ、ブロックを実行します。  
- `{% if %}`で開始して、`{% endif %}`で閉じます。

<div class="code-box-syntax no-title">
<pre>
{% <em>if</em> <em class="blue">条件</em> %}
  <em class="orange">&lt;ブロック&gt;</em>
{% <em>endif</em> %}
</pre>
</div>
### 例
<div class="code-box">
<div class="title">Input</div>
<pre>
{% if product.title == "すごい靴" %}
  こりゃすごい靴だ！
{% endif %}
</pre>
</div>
<div class="code-box-output">
<div class="title">Output</div>
<pre>
こりゃすごい靴だ！
</pre>
</div>
{% endraw %}

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-02" updated="2021-06-02" %}</div>
### 参照
- [(Liquid) Control flow](https://shopify.github.io/liquid/tags/control-flow/)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
