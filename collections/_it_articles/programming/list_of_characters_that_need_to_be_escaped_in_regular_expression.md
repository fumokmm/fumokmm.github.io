---
title: 正規表現でエスケープが必要な文字一覧
article_group_id: regular-expression-group
display_order: 10
created: 2022-01-20
updated: 2022-01-20
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#一覧">一覧</a></li>
</ul>

* * *
## <a name="一覧">一覧</a><a class="heading-anchor-permalink" href="#一覧">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-01-20" updated="2022-01-20" %}</div>
<table class="normal">
	<tr>
		<th markdown="span">エスケープ前</th>
		<th markdown="span">エスケープ後</th>
		<th markdown="span">補足</th>
	</tr>
	<tr>
		<td markdown="span">\</td>
		<td markdown="span">\\\\</td>
		<td markdown="span">エスケープ用の文字列なのでエスケープが必要です。</td>
	</tr>
	<tr>
		<td markdown="span">*</td>
		<td markdown="span">\\*</td>
		<td markdown="span"></td>
	</tr>
	<tr>
		<td markdown="span">+</td>
		<td markdown="span">\\+</td>
		<td markdown="span"></td>
	</tr>
	<tr>
		<td markdown="span">.</td>
		<td markdown="span">\\.</td>
		<td markdown="span"></td>
	</tr>
	<tr>
		<td markdown="span">?</td>
		<td markdown="span">\\?</td>
		<td markdown="span"></td>
	</tr>
	<tr>
		<td markdown="span">{ }</td>
		<td markdown="span">\\{\\}</td>
		<td markdown="span"></td>
	</tr>
	<tr>
		<td markdown="span">( )</td>
		<td markdown="span">\\(\\)</td>
		<td markdown="span"></td>
	</tr>
	<tr>
		<td markdown="span">[ ]</td>
		<td markdown="span">\[\]</td>
		<td markdown="span"></td>
	</tr>
	<tr>
		<td markdown="span">^</td>
		<td markdown="span">\\^</td>
		<td markdown="span"></td>
	</tr>
	<tr>
		<td markdown="span">$</td>
		<td markdown="span">\\$</td>
		<td markdown="span"></td>
	</tr>
	<tr>
		<td markdown="span">-</td>
		<td markdown="span">\\-</td>
		<td markdown="span">`[``]`の中に書く場合のみエスケープが必要</td>
	</tr>
	<tr>
		<td markdown="span">|</td>
		<td markdown="span">\\|</td>
		<td markdown="span"></td>
	</tr>
	<tr>
		<td markdown="span">/</td>
		<td markdown="span">\\/</td>
		<td markdown="span">`/`が正規表現の指定文字になる言語（Perlなど）ではエスケープが必要です。</td>
	</tr>
</table>

### 参考
- [(Qiita) 【保存版】正規表現でエスケープが必要な文字一覧表](https://qiita.com/katsukii/items/1c1550f064b4686c04d4)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
