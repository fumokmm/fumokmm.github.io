---
title: PostgreSQLで取得結果行を1列に連結するSQL(string_agg)
article_group_id: sql-group
display_order: 10
created: 2022-10-15
updated: 2022-10-15
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#使い方">使い方</a></li>
<li><a href="#順番を指定したい場合">順番を指定したい場合</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-15" updated="2022-10-15" %}</div>
- 取得結果行を1列に連結するには、PostgreSQLでは、`string_agg関数`を利用することで可能です。
- v9以降のバージョンで利用可能です。
- 取得結果行を1列に連結して取得します。

{% include goto_pagetop.html %}

* * *
## <a name="使い方">使い方</a><a class="heading-anchor-permalink" href="#使い方">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-15" updated="2022-10-15" %}</div>
<div class="code-box">
<div class="title">SQL</div>
<pre>
select
    <em>string_agg(</em>dat, '/' order by dat desc<em>)</em>
from
(
    select 'a' as dat
    union
    select 'b' as dat
    union
    select 'c' as dat
) as dat_table
</pre>
</div>

SQL中に登場しているサブクエリ(別名として`dat_table`を付けてある)
<table class="normal">
	<tr>
		<th markdown="span">dat</th>
	</tr>
	<tr>
		<td markdown="span">a</td>
	</tr>
	<tr>
		<td markdown="span">b</td>
	</tr>
	<tr>
		<td markdown="span">c</td>
	</tr>
</table>

<div class="code-box-output">
<div class="title">取得結果</div>
<pre>
a/b/c
</pre>
</div>
- `string_agg`の`第一引数`にて、集約する列名を指定します。
- `string_agg`の`第二引数`にて、結合する時に使う文字列を指定します（例：'/'）
- その後ろにオプションを指定します（例：[order by](#順番を指定したい場合)）。

{% include goto_pagetop.html %}

* * *
## <a name="順番を指定したい場合">順番を指定したい場合</a><a class="heading-anchor-permalink" href="#順番を指定したい場合">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-15" updated="2022-10-15" %}</div>
`string_agg`の中で`order by`を使ってデータの並び順を指定します。

<div class="code-box">
<div class="title">SQL</div>
<pre>
select
    string_agg(dat, '/' <em>order by dat desc</em>)
from (
    select 'a' as dat
    union
    select 'b' as dat
    union
    select 'c' as dat
) as dat_table
</pre>
</div>

<div class="code-box">
<div class="title">取得結果</div>
<pre>
c/b/a
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-15" updated="2022-10-15" %}</div>
### 関連メモ
- [SQL Serverで取得結果行を1列に連結するSQL(FOR XML PATH)]({% link _it_articles/sqlserver/for_xml_path.md %})

### 参考サイト
- [(Let's POSTGRES) PostgreSQL 9.0 のその他の新機能](https://workmemo.techblog.jp/archives/33958716.html)
- [(仕事メモとか) postgresqlでlistaggみたいなことを探してみた](https://lets.postgresql.jp/documents/technical/9.0/1)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
