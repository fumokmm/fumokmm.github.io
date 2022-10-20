---
title: SQLで指定文字列の個数を調べる
article_group_id: tips-group
display_order: 10
created: 2021-12-19
updated: 2021-12-19
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#指定文字列の個数を調べる">指定文字列の個数を調べる</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="指定文字列の個数を調べる">指定文字列の個数を調べる</a><a class="heading-anchor-permalink" href="#指定文字列の個数を調べる">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-19" updated="2021-12-19" %}</div>
指定文字列の個数を調べたい列を`col`とします。
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
SELECT
	(LENGTH(col) - LENGTH(REPLACE(col, <em>'&lt;検索する文字列&gt;'</em>, '')))
	/ LENGTH(<em>'&lt;検索する文字列&gt;'</em>) AS CNT
FROM
	tbl
</pre>
</div>
- まず、`col`の長さを調べておきます。
- 次に、`'<検索する文字列>'`を空文字に置換した文字列の長さを調べます。
- この二つの引き算して<b>長さの差</b>を求めます。
- 最後に<b>長さの差</b>を`'<検索する文字列>'`の長さで割ります。
  - 最後に割るのは、`'<検索する文字列>'`の2文字以上の場合を考慮してです。
  - 一瞬割り算で割り切れない時はどうするのかな？と思いますが、基本的には置換される数と割る数が一致するはずなので、割り切れなくなる心配はないようです。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-19" updated="2021-12-19" %}</div>
### 参考サイト
- [(銀の弾丸) SQLで文字列の出現回数を調べる](https://takamints.hatenablog.jp/entry/2015/03/28/134728)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
