---
title: PostgreSQLで最初のnullじゃない文字列を取得する関数(coalesce)
article_group_id: sql-group
display_order: 20
created: 2022-10-23
updated: 2022-10-23
---
## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#使い方">使い方</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-23" updated="2022-10-23" %}</div>
- 指定した引数のうち、最初に`null`じゃなくなった値を返却する関数です。
- `coalesce`って発音が全然わからないです。発音は「こぅるれす」みたいな感じです。

{% include goto_pagetop.html %}

* * *
## <a name="使い方">使い方</a><a class="heading-anchor-permalink" href="#使い方">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-23" updated="2022-10-23" %}</div>
<div class="code-box-syntax">
<div class="title">SQL</div>
<div class="copy-button">Copy</div>
<pre>
coalesce(文字列, [, 文字列...])
</pre>
</div>

<div class="code-box">
<div class="title">使用例</div>
<div class="copy-button">Copy</div>
<pre>
select coalesce(<em>'ABC'</em>, <em class="blue">null</em>);  <em class="comment">-- 'ABC'</em>
select coalesce(<em class="blue">null</em>, <em>'ABC'</em>);  <em class="comment">-- 'ABC'</em>
select coalesce(<em class="blue">null</em>, <em class="blue">null</em>, <em>'ABC'</em>, 'DEF');  <em class="comment">-- 'ABC'</em>
select coalesce(<em class="blue">null</em>, <em class="blue">null</em>, <em class="blue">null</em>);  <em class="comment">-- null</em>
</pre>
</div>
- さすがに全部`null`だと`null`が返却されます。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-23" updated="2022-10-23" %}</div>
### 参考サイト
- [(PostgresWeb) 【PostgreSQL】文字列の結合、nullを結合する](https://postgresweb.com/combine-strings)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
