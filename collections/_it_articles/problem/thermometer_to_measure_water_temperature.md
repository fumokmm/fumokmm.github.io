---
title: "[お題] 水温を測る温度計"
display_order: 70
created: 2022-08-26
updated: 2022-08-26
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#お題">お題</a></li>
<li><a href="#Groovyで解いてみた">Groovyで解いてみた</a></li>
<li><a href="#出典">出典</a></li>
</ul>

* * *
## <a name="お題">お題</a><a class="heading-anchor-permalink" href="#お題">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-08-26" updated="2022-08-26" %}</div>
<div class="code-box">
<div class="title">お題</div>
<pre>
あなたは水温を測る温度計のプログラムを作成しています。
0度以下になり水が凍る場合に警告を出すことにしました。
水温n度が与えられるので0以下の場合freeze、
1以上の場合はnを出力してください。
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="Groovyで解いてみた">Groovyで解いてみた</a><a class="heading-anchor-permalink" href="#Groovyで解いてみた">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-08-26" updated="2022-08-26" %}</div>
<div class="code-box">
<div class="title">thermometer_to_measure_water_temperature.groovy</div>
<pre>
def thermometer = { n -&gt; n &lt;= 0 ? 'freeze' : n } 
assert thermometer(-1) == 'freeze'
assert thermometer(0) == 'freeze'
assert thermometer(1) == 1
</pre>
</div>
- `assert`してる3行がテストです。

{% include goto_pagetop.html %}

* * *
## <a name="出典">出典</a><a class="heading-anchor-permalink" href="#出典">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-08-26" updated="2022-08-26" %}</div>
- paiza[パイザ]さんの、[このツイート](https://twitter.com/paiza_official/status/1561548720193376256)
- [(paiza)エンジニア騎士とクエリの魔女](https://paiza.jp/code_and_sql/)
- [paiza](https://paiza.jp/)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
