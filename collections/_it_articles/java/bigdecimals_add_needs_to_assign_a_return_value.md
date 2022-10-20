---
title: JavaのBigDecimalのaddは戻り値を代入する必要がある
article_group_id: tips-group
display_order: 50
created: 2008-01-20
updated: 2021-07-12
---
当メモは2008-01-20に[投稿されたもの](https://npnl.hatenablog.jp/entry/20080120/1200844279)を加筆修正し、再掲したものです。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#BigDecimalのaddは戻り値を代入する必要あり">BigDecimalのaddは戻り値を代入する必要あり</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="BigDecimalのaddは戻り値を代入する必要あり">BigDecimalのaddは戻り値を代入する必要あり</a><a class="heading-anchor-permalink" href="#BigDecimalのaddは戻り値を代入する必要あり">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2008-01-20" updated="2021-07-12" %}</div>
`BigDecimal`の`#add`は戻り値を代入する必要があります。イミュータブルなので。
もちろん`#subtract`、`#multiply`、`#divide`なんかも同様です。

<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
BigDecimal bd1 = new BigDecimal("1");
BigDecimal bd2 = new BigDecimal("2");

<em>bd1 = </em>bd1.add(bd2);
</pre>
</div>

仮に
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
bd1.add(bd2);
</pre>
</div>
これだけだと、`bd1`に`bd2`を足す演算はしてくれるんですが、  
結局どこにも代入されないため、`bd1`、`bd2`とも変化しません。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-12" updated="2021-07-12" %}</div>
### 元記事
- [(No Programming, No Life) BigDecimalのadd](https://npnl.hatenablog.jp/entry/20080120/1200844279)

### 参照
- [BigDecimal (Java Platform SE 8)](https://docs.oracle.com/javase/jp/8/docs/api/java/math/BigDecimal.html)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
