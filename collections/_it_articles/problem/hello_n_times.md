---
title: "[お題] n回helloと出力する"
display_order: 60
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
<div class="copy-button">Copy</div>
<pre>
整数nが与えられるので1行にn回"hello"と出力してください。
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="Groovyで解いてみた">Groovyで解いてみた</a><a class="heading-anchor-permalink" href="#Groovyで解いてみた">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-08-26" updated="2022-08-26" %}</div>
<div class="code-box">
<div class="title">hello_n_times.groovy</div>
<div class="copy-button">Copy</div>
<pre>
def helloNTimes = { int n -&gt;
    println ('hello' * n)
}
helloNTimes(1)
helloNTimes(2)
helloNTimes(3)
</pre>
</div>
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
hello
hellohello
hellohellohello
</pre>
</div>
- n回出力するなら、Groovyの場合は`*`演算子が適役かなと思います。

{% include goto_pagetop.html %}

* * *
## <a name="出典">出典</a><a class="heading-anchor-permalink" href="#出典">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-08-26" updated="2022-08-26" %}</div>
- paiza[パイザ]さんの、[このツイート](https://twitter.com/paiza_official/status/1561548718083489792)
- [(paiza)エンジニア騎士とクエリの魔女](https://paiza.jp/code_and_sql/)
- [paiza](https://paiza.jp/)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
