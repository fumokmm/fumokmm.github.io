---
title: Pythonでカンマ区切りの文字列を作る
article_group_id: reverse-lookup-group
display_order: 50
created: 2021-11-15
updated: 2021-11-15
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#方法">方法</a></li>
<li><a href="#解説">解説</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="方法">方法</a><a class="heading-anchor-permalink" href="#方法">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-15" updated="2021-11-15" %}</div>
例として、`?`が10個をカンマ区切り(カンマの後に半角スペースが1つある)にした文字列を作成します。
<div class="code-box no-title">
<pre>
params = ", ".join(list("?" * 10))
print(params)
</pre>
</div>
<div class="code-box-output no-title">
<pre>
'?, ?, ?, ?, ?, ?, ?, ?, ?, ?'
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="解説">解説</a><a class="heading-anchor-permalink" href="#解説">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-15" updated="2021-11-15" %}</div>
### 文字列 * 回数
<div class="code-box-syntax no-title">
<pre>
文字列 * n
</pre>
</div>
- 指定の文字列をn回繰り返した文字列を返します。
- 上記例だと `"??????????"` となります。

### list()
<div class="code-box-syntax no-title">
<pre>
list(文字列)
</pre>
</div>
- 文字列を文字単位に分割したリストに変換します。
- 上記例だと、`["?", "?", "?", "?", "?", "?", "?", "?", "?", "?"]` というリストとなります。

### join
<div class="code-box-syntax no-title">
<pre>
文字列.join(リスト)
</pre>
</div>
- 指定の文字列でリストを結合します。
- 上記例だと、`?, ?, ?, ?, ?, ?, ?, ?, ?, ?` となります。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-15" updated="2021-11-15" %}</div>
### 参考サイト
- [(et'sプログラミング) 文字列の連結と繰り返し(乗算)](https://www.javadrive.jp/python/string/index6.html)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
