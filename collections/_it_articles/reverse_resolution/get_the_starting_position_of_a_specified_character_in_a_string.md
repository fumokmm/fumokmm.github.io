---
title: 文字列中の指定した文字の開始位置を取得する
article_group_id: string-group
display_order: 10
created: 2021-12-29
updated: 2021-12-29
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#SQL(SQL Server)で文字列中の指定した文字の開始位置を取得する">SQL(SQL Server)で文字列中の指定した文字の開始位置を取得する</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="SQL(SQL Server)で文字列中の指定した文字の開始位置を取得する">SQL(SQL Server)で文字列中の指定した文字の開始位置を取得する</a><a class="heading-anchor-permalink" href="#SQL(SQL Server)で文字列中の指定した文字の開始位置を取得する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-29" updated="2021-12-29" %}</div>
SQL ServerのSQLでは、`CHARINDEX`関数を使います。

### 構文
<div class="code-box-syntax no-title">
<pre>
CHARINDEX(&lt;探す文字&gt;, &lt;探される文字列&gt; [, &lt;開始位置&gt;])   
</pre>
</div>
- `<探される文字列>`から`<探す文字>`を検索し、最初に見つかった開始位置(`1`始まり)を返却します。
- 見つからなかった場合は`0`が返ります。
- `<開始位置>`は省略可で、省略時は`1`が指定されたものと同等です。

### 例
<div class="code-box">
<div class="title">通常利用</div>
<pre>
SELECT CHARINDEX(<em>'C'</em>, 'AB<em>C</em>DEFG');  <em class="comment">-- =&gt; 3</em>
SELECT CHARINDEX(<em>'DE'</em>, 'ABC<em>DE</em>FG');  <em class="comment">-- =&gt; 4</em>
SELECT CHARINDEX(<em>'H'</em>, 'ABCDEFG');  <em class="comment">-- =&gt; 0</em>
</pre>
</div>
- 探す文字列は複数文字でもいけます。
- 見つからない場合は0が返却されます。

<div class="code-box">
<div class="title">開始位置を指定</div>
<pre>
SELECT CHARINDEX('<em>は</em>', '<em class="orange">うらにわに</em><em>は</em><em class="orange">にわにわに</em><em>は</em><em class="orange">にわにわとりがいる</em>');  <em class="comment">-- =&gt; 6</em>
SELECT CHARINDEX('<em>は</em>', 'うらにわには<em class="orange">にわにわに</em><em>は</em><em class="orange">にわにわとりがいる</em>', <em class="blue">7</em>);  <em class="comment">-- =&gt; 12</em>
SELECT CHARINDEX('<em>は</em>', 'うらにわにはにわにわには<em class="orange">にわにわとりがいる</em>', <em class="blue">13</em>);  <em class="comment">-- =&gt; 0</em>
</pre>
</div>
- 指定した開始位置から検索しはじめます。
- 返却される開始位置は文字列の先頭からのものになります。

### 参考
- [(Microsoft \|Docs) CHARINDEX (Transact-SQL)](https://docs.microsoft.com/ja-jp/sql/t-sql/functions/charindex-transact-sql?redirectedfrom=MSDN&view=sql-server-ver15)
- [(PROJECT GROUP) ある文字列の中から指定した文字の開始位置を取得する](https://www.projectgroup.info/tips/SQLServer/function/F000002.html)

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-29" updated="2021-12-29" %}</div>
### 参照
- [(Microsoft \|Docs) CHARINDEX (Transact-SQL)](https://docs.microsoft.com/ja-jp/sql/t-sql/functions/charindex-transact-sql?redirectedfrom=MSDN&view=sql-server-ver15)

### 参考サイト
- [(PROJECT GROUP) ある文字列の中から指定した文字の開始位置を取得する](https://www.projectgroup.info/tips/SQLServer/function/F000002.html)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
