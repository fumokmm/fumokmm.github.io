---
title: Liquidの制御フロー
display_order: 30
created: 2021-09-06
updated: 2021-09-08
---
{% capture link_to_it_ruby %}{% link _it_articles/ruby/index.md %}{% endcapture %}
{% assign link_to_it_ruby = link_to_it_ruby | remove: 'index' %}

制御フロータグでは、Liquidブロックを実行するかどうかを決定する様々な条件を定義します。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#if">if</a></li>
<li><a href="#unless">unless</a></li>
<li><a href="#elsif / else">elsif / else</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="if">if</a><a class="heading-anchor-permalink" href="#if">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-06" updated="2021-09-07" %}</div>
{% raw %}
`if`は`条件`が`true`に*なるとき*のみ、ブロックを実行します。  
`{% if %}`で開始して、`{% endif %}`で閉じます。

<div class="code-box-syntax no-title">
<pre>
{% <em>if</em> <em class="blue">&lt;条件&gt;</em> %}
  <em class="orange">&lt;ブロック&gt;</em>
{% <em>endif</em> %}
</pre>
</div>
### 例
<div class="code-box">
<div class="title">Input (product.titleの値が "すごい靴" の場合)</div>
<pre>
{% <em>if</em> product.title == "すごい靴" %}
  こりゃすごい靴だ！
{% <em>endif</em> %}
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
## <a name="unless">unless</a><a class="heading-anchor-permalink" href="#unless">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-07" updated="2021-09-07" %}</div>
{% raw %}
`unless`は[if](#if)の反対で、`条件`が`true`に*ならない*ときのみ、ブロックを実行します。  
`{% unless %}`で開始して、`{% endunless %}`で閉じます。

<div class="code-box-syntax no-title">
<pre>
{% <em>unless</em> <em class="blue">&lt;条件&gt;</em> %}
  <em class="orange">&lt;ブロック&gt;</em>
{% <em>endunless</em> %}
</pre>
</div>
### 例
<div class="code-box">
<div class="title">Input (product.titleの値が "すごくない靴" の場合)</div>
<pre>
{% <em>unless</em> product.title == "すごい靴" %}
  こりゃすごい靴じゃないぞ！
{% <em>unless</em> %}
</pre>
</div>
<div class="code-box-output">
<div class="title">Output</div>
<pre>
こりゃすごい靴じゃないぞ！
</pre>
</div>

- `unless`は以下と同じ動きをします。
<div class="code-box">
<div class="title">Input (product.titleの値が "すごくない靴" の場合)</div>
<pre>
{% if product.title <em>!=</em> "すごい靴" %}
  こりゃすごい靴じゃないぞ！
{% endif %}
</pre>
</div>

{% endraw %}

{% include goto_pagetop.html %}

* * *
## <a name="elsif / else">elsif / else</a><a class="heading-anchor-permalink" href="#elsif / else">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-08" updated="2021-09-08" %}</div>
[if](#if)や[unless](#unless)に対して、*それ以外*の条件の時に実行するブロックを追加します。

{% raw %}
<div class="code-box-syntax">
<div class="title">if-else</div>
<pre>
{% <em>if</em> <em class="blue">&lt;条件1&gt;</em> %}
  <em class="orange">&lt;ブロック1&gt;</em>
{% <em>else</em> <em class="blue">&lt;条件2&gt;</em> %}
  <em class="orange">&lt;ブロック2&gt;</em>
{% <em>endif</em> %}
</pre>
</div>
<div class="code-box-syntax">
<div class="title">if-elsif-else</div>
<pre>
{% <em>if</em> <em class="blue">&lt;条件1&gt;</em> %}
  <em class="orange">&lt;ブロック1&gt;</em>
{% <em>elsif</em> <em class="blue">&lt;条件2&gt;</em> %}
  <em class="orange">&lt;ブロック2&gt;</em>
{% <em>else</em> <em class="blue">&lt;条件3&gt;</em> %}
  <em class="orange">&lt;ブロック3&gt;</em>
{% <em>endif</em> %}
</pre>
</div>
<div class="code-box-syntax">
<div class="title">unless-else</div>
<pre>
{% <em>unless</em> <em class="blue">&lt;条件1&gt;</em> %}
  <em class="orange">&lt;ブロック1&gt;</em>
{% <em>else</em> <em class="blue">&lt;条件2&gt;</em> %}
  <em class="orange">&lt;ブロック3&gt;</em>
{% <em>endif</em> %}
</pre>
</div>
{% endraw %}
- ちなみに、`unless`に対して、`elsif`を付けることもできますが分かりづらいのであまり使わないかなと思います。[^ruby-unless]

### 例
{% raw %}
<div class="code-box">
<div class="title">Input</div>
<pre>
{% assign name = "anonymous" %}
{% if name == "kevin" %}
  こんにちは、ケビン！
{% <em>elsif</em> name == "anonymous" %}
  こんにちは、匿名さん！
{% <em>else</em> %}
  あんたは誰だ！？
{% endif %}
</pre>
</div>
<div class="code-box-output">
<div class="title">Output</div>
<pre>
こんにちは、匿名さん！
</pre>
</div>
{% endraw %}
- `assign`については[こちら]({% link _it_articles/liquid/variable.md %}#assign)。

[^ruby-unless]: [Ruby]({{link_to_it_ruby}})の方では、`unless`に対して`elsif`は付けられないのに変なところで頑張ってますね😀(誉め言葉)。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-02" updated="2021-06-02" %}</div>
### 参考
- [(TechRacho) Ruby: unless式にはelsifを書けない](https://techracho.bpsinc.jp/hachi8833/2019_02_01/67736)

### 参照
- [(Liquid) Control flow](https://shopify.github.io/liquid/tags/control-flow/)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
