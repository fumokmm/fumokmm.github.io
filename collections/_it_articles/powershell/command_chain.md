---
title: PowerShellでコマンドを続けて実行する
article_group_id: tips-group
display_order: 30
created: 2021-08-13
updated: 2021-08-13
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#セミコロンを使う">セミコロンを使う</a></li>
<li><a href="#Pipeline Chain Operators(&& と ||)を使う">Pipeline Chain Operators(&& と ||)を使う</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="セミコロンを使う">セミコロンを使う</a><a class="heading-anchor-permalink" href="#セミコロンを使う">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-13" updated="2021-08-13" %}</div>
- 続けて実行するコマンドの前の結果が成功か失敗かに関わりなく後のコマンドを実行する場合はセミコロン`;`を使ってコマンドを繋げます。

<div class="code-box-syntax no-title">
<pre>
&lt;コマンド1&gt;<em>;</em> &lt;コマンド2&gt;
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="Pipeline Chain Operators(&& と ||)を使う">Pipeline Chain Operators(&& と ||)を使う</a><a class="heading-anchor-permalink" href="#Pipeline Chain Operators(&& と ||)を使う">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-13" updated="2021-08-13" %}</div>
PowerShell 7からはBashとかと同じようなPipeline Chain Operatorsが使えるようになったみたいです。

### &&演算子
- `&&`は前のコマンドが*成功*した場合、後のコマンドを実行します。

<div class="code-box-syntax no-title">
<pre>
&lt;コマンド1&gt; <em>&amp;&amp;</em> &lt;コマンド2&gt;
</pre>
</div>

### ||演算子
- `||`は前のコマンドが*失敗*した場合、後のコマンドを実行します。(`&&`の逆)

<div class="code-box-syntax no-title">
<pre>
&lt;コマンド1&gt; <em>||</em> &lt;コマンド2&gt;
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-13" updated="2021-08-13" %}</div>
- [(DevelopersIO) PowerShell 7 からPipeline Chain Operators(&& と \|\|)が使える様になります](https://dev.classmethod.jp/articles/powershell-7-pipeline-chain-operator/)
- [(Thomas Maurer) How to chain multiple PowerShell commands on one line](https://www.thomasmaurer.ch/2021/03/how-to-chain-multiple-powershell-commands-on-one-line/)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
