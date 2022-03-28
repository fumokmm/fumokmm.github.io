---
title: 文字列が指定した文字列で始まっているか調べる
article_group_id: string-group
display_order: 20
created: 2022-03-29
updated: 2022-03-29
---
{% capture link_to_it_python %}{% link _it_articles/python/index.md %}{% endcapture %}
{% assign link_to_it_python = link_to_it_python | remove: 'index' %}
## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#Pythonで文字列が指定した文字列で始まっているか調べる">Pythonで文字列が指定した文字列で始まっているか調べる</a></li>
<li><a href="#関連メモ">関連メモ</a></li>
</ul>

* * *
## <a name="Pythonで文字列が指定した文字列で始まっているか調べる">Pythonで文字列が指定した文字列で始まっているか調べる</a><a class="heading-anchor-permalink" href="#Pythonで文字列が指定した文字列で始まっているか調べる">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-03-29" updated="2022-03-29" %}</div>
Pythonでは、`str`の`startswith`メソッドを使います。

<div class="code-box no-title">
<pre>
s = "あいうえお"
s<em>.startswith</em>("あ") <em class="comment"># =&gt; True</em>
s<em>.startswith</em>("い") <em class="comment"># =&gt; False</em>
</pre>
</div>

### 参考
- [(ITSakura) Python 文字列の始め/終わりを確認(startswith/endswith)](https://itsakura.com/python-startswith)

{% include goto_pagetop.html %}

* * *
## <a name="関連メモ">関連メモ</a><a class="heading-anchor-permalink" href="#関連メモ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-03-29" updated="2022-03-29" %}</div>
- [Pythonのメモ]({{link_to_it_python}})

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
