---
title: PostgreSQLのデータ型
article_group_id: basis-group
display_order: 10
created: 2022-10-19
updated: 2022-10-19
---
## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#文字列データ型">文字列データ型</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-19" updated="2022-10-19" %}</div>
- PostgreSQLのデータ型のメモです。

{% include goto_pagetop.html %}

* * *
## <a name="文字列データ型">文字列データ型</a><a class="heading-anchor-permalink" href="#文字列データ型">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-19" updated="2022-10-19" %}</div>
<table class="normal">
	<tr>
		<th markdown="span">型名</th>
		<th markdown="span">説明</th>
	</tr>
	<tr>
		<td markdown="span">character(n), char(n)</td>
		<td markdown="span">空白でパッドされた固定長文字列</td>
	</tr>
	<tr>
		<td markdown="span">character varying(n), varchar(n)</td>
		<td markdown="span">制限付き可変長文字列</td>
	</tr>
	<tr>
		<td markdown="span">text (テキスト)</td>
		<td markdown="span">制限無し可変長文字列</td>
	</tr>
</table>
- `n`は正の整数です。
- `character`は文字列の長さが`n`に満たない場合、右側がスペースで埋められます。(固定長)
- `varchar`の v は`varying`の v なんですね。

### 参考サイト
- [(PostgreSQL 7.3.4 ユーザガイド) Chapter 5. データ型](https://www.postgresql.jp/document/7.3/user/datatype-character.html)

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-19" updated="2022-10-19" %}</div>
### 参考サイト
- [(PostgreSQL 7.3.4 ユーザガイド) Chapter 5. データ型](https://www.postgresql.jp/document/7.3/user/datatype-character.html)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
