---
title: SQL ServerのT-SQLでテーブル変数を使う
article_group_id: t-sql-group
display_order: 10
created: 2021-09-10
updated: 2021-09-10
---
T-SQLでは`テーブル変数`というものが使えます。  
これは内部的には`tempdb`に作成されるようです。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#テーブル変数を宣言">テーブル変数を宣言</a></li>
<li><a href="#テーブル変数に値を設定">テーブル変数に値を設定</a></li>
<li><a href="#テーブル変数の値を参照">テーブル変数の値を参照</a></li>
<li><a href="#テーブル変数の値を削除">テーブル変数の値を削除</a></li>
<li><a href="#テーブル変数の値を取得し他の変数に設定">テーブル変数の値を取得し他の変数に設定</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="テーブル変数を宣言">テーブル変数を宣言</a><a class="heading-anchor-permalink" href="#テーブル変数を宣言">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-10" updated="2021-09-10" %}</div>
以下のような構文で宣言します。
<div class="code-box-syntax no-title">
<pre>
<em>DECLARE</em> <em class="blue">@変数名</em>m <em>TABLE</em> (
    &lt;テーブル定義&gt;
        :
        :
) 
</pre>
</div>
以降、`@変数名`で定義した変数名をテーブルとして利用できるようになります。

### 例
<div class="code-box no-title">
<pre>
<em>DECLARE</em> <em class="blue">@id_tables</em> <em>TABLE</em> (id nvarchar(16))
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="テーブル変数に値を設定">テーブル変数に値を設定</a><a class="heading-anchor-permalink" href="#テーブル変数に値を設定">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-10" updated="2021-09-10" %}</div>
`テーブル変数`に値を設定するには、通常のテーブルと同じように`INSERT文`を利用します。  
[上記](#テーブル変数を宣言)で宣言した`@id_tables`に値を設定するサンプルSQLは以下となります。

### 例
<div class="code-box no-title">
<pre>
INSERT INTO <em>@id_tables</em> VALUES
  ('A001'),
  ('A004'),
  ('A008');
</pre>
</div>
- なお、ここでは[複数行INSERT]({% link _it_articles/sqlserver/multi_line_insert.md %})を利用しています。

{% include goto_pagetop.html %}

* * *
## <a name="テーブル変数の値を参照">テーブル変数の値を参照</a><a class="heading-anchor-permalink" href="#テーブル変数の値を参照">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-10" updated="2021-09-10" %}</div>
`テーブル変数`の値を参照する場合も、通常のテーブルと同じように`SELECT文`を利用します。  

### 例
<div class="code-box no-title">
<pre>
SELECT * FROM <em>@id_tables</em>
</pre>
</div>

### 結果
<table class="normal">
	<tr>
		<th markdown="span">id</th>
	</tr>
	<tr>
		<td markdown="span">A001</td>
	</tr>
	<tr>
		<td markdown="span">A004</td>
	</tr>
	<tr>
		<td markdown="span">A008</td>
	</tr>
</table>

通常のテーブルと同じように、JOINしたりも出来ます。

### 例
<div class="code-box">
<div class="title">INNER JOINして使う</div>
<pre>
SELECT
    b.*
FROM
    <em>@id_tables</em> a
    INNER JOIN [dbo].[User] b ON b.Id = a.id
ORDER BY
    a.id DESC
</pre>
</div>
- 特定のキー情報を`テーブル変数`にINSERTしておいて、こんな風にJOINして抽出することができたりして便利ですね。

{% include goto_pagetop.html %}

* * *
## <a name="テーブル変数の値を削除">テーブル変数の値を削除</a><a class="heading-anchor-permalink" href="#テーブル変数の値を削除">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-10" updated="2021-09-10" %}</div>
お察しの通り、`テーブル変数`の値を削除する場合も、通常のテーブルと同じように`DELETE文`を利用します。  

### 例
<div class="code-box no-title">
<pre>
DELETE FROM <em>@id_tables</em> WHERE id = 'A001'
</pre>
</div>

[上記例](#テーブル変数の値を参照)の状態の後、この`DELETE文`を実行した後は、以下のようになります。

### 結果 (削除後)
<table class="normal">
	<tr>
		<th markdown="span">id</th>
	</tr>
	<tr>
		<td markdown="span">A004</td>
	</tr>
	<tr>
		<td markdown="span">A008</td>
	</tr>
</table>
- `A001`が削除されています。

{% include goto_pagetop.html %}

* * *
## <a name="テーブル変数の値を取得し他の変数に設定">テーブル変数の値を取得し他の変数に設定</a><a class="heading-anchor-permalink" href="#テーブル変数の値を取得し他の変数に設定">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-10" updated="2021-09-10" %}</div>
`テーブル変数`の値を取り出して、他の変数に設定することもできます。  
取得するSQLは`WHERE句`や`TOP(x)`で絞ったりして、データを一意にする必要があります。[^error-msg]

<div class="code-box-syntax no-title">
<pre>
SET <em>@変数名</em> = (<em class="blue">&lt;取得結果が一意になるSQL&gt;</em>)
</pre>
</div>

### 例
<div class="code-box no-title">
<pre>
SET <em>@last_id</em> = (<em class="blue">SELECT TOP 1 id FROM @id_tables ORDER BY id DESC</em>);
</pre>
</div>

[^error-msg]: もし、複数の結果を返すSQLだと以下のようなエラーメッセージが出力されます。  
			  メッセージ 512、レベル 16、状態 1、行 14  
              サブクエリは複数の値を返しました。サブクエリが =、!=、<、<=、>、>= の後に続く場合や、サブクエリが 1 つの式として使われる場合は複数の値は許可されません。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-10" updated="2021-09-10" %}</div>
- [(バヤシタ) テーブル変数を使用する方法](https://bayashita.com/p/entry/show/58)
- [(SQLShack) The Table Variable in SQL Server](https://www.sqlshack.com/the-table-variable-in-sql-server/)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
