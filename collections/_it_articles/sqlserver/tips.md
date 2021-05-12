---
title: SQL ServerのTips
article_group_id: tips-group
display_order: 900
created: 2020-10-15
updated: 2020-12-16
---
ここではSQL ServerのちょっとしたTipsをまとめておきます。

## <a name="index">目次</a>

<ul id="index_ul">
<li><a href="#sql-for-backing-up-table">テーブルをバックアップするSQL</a></li>
<li><a href="#identity-insert">IDENTITY指定された列に明示的な値をINSERTする</a></li>
<li><a href="#collation">照合順序設定を確認するSQL</a></li>
<li><a href="#insert-select">SELECT結果をINSERTするSQL</a></li>
</ul>

* * *
## <a name="sql-for-backing-up-table">テーブルをバックアップするSQL</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-07-15" updated="2020-10-15" %}</div>
テーブルをサクっとバックアップしたい場合に使えるSQLです。

<div class="code-box">
<div class="title">テーブルをバックアップするSQL</div>
<pre>
SELECT * INTO <em>&lt;新しいテーブル名&gt;</em> FROM <em>&lt;テーブル名&gt;</em>;
</pre>
</div>

### 例
以下SQLを実行すると、`M_USER`と同じレイアウトの`M_USER_20201015`という名前のテーブルが作成されます。
<div class="code-box no-title">
<pre>
SELECT * INTO <em>M_USER_20201015</em> FROM <em>M_USER</em>;
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="identity-insert">IDENTITY指定された列に明示的な値をINSERTする</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-04" updated="2020-12-04" %}</div>
IDENTITYが指定された列の値を直接指定したINSERT文はエラーとなって実行できません。  
そこで、`IDENTITY_INSERT`を`ON`に設定することでそれを一時解除できます。

<div class="code-box">
<div class="title">IDENTITY_INSERTをONにする</div>
<pre>
SET IDENTITY_INSERT <em>&lt;テーブル名&gt;</em> ON;
</pre>
</div>

INSERT文を作るときに、列名は明示的に指定する必要があるようです。

元に戻す場合は、OFFにします。
<div class="code-box">
<div class="title">IDENTITY_INSERTをOFFにする</div>
<pre>
SET IDENTITY_INSERT <em>&lt;テーブル名&gt;</em> OFF;
</pre>
</div>

### 参考
- [(ilovex) 【SQLSERVER】自動採番列が定義されているテーブルへのデータ登録](https://www.ilovex.co.jp/blog/system/sqlserver/sqlserver-9.html)

{% include goto_pagetop.html %}

* * *
## <a name="collation">照合順序設定を確認するSQL</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-11" updated="2020-12-11" %}</div>
<div class="code-box">
<div class="title">サーバーの照合順序設定を確認するSQL</div>
<pre>
SELECT CONVERT (varchar(256), SERVERPROPERTY('collation'));
</pre>
</div>

<div class="code-box">
<div class="title">データベースの照合順序設定を確認するSQL</div>
<pre>
SELECT name, collation_name FROM sys.databases;
</pre>
</div>

<div class="code-box">
<div class="title">テーブルと列の照合順序設定を確認するSQL</div>
<pre>
SELECT
    t.name AS TableName,
    c.name AS ColumnName,
    collation_name
FROM
    sys.columns c
    inner join
    sys.tables t on t.object_id = c.object_id;
</pre>
</div>

### 参考
- [(Microsoft Docs) 照合順序情報の表示](https://docs.microsoft.com/ja-jp/sql/relational-databases/collations/view-collation-information?view=sql-server-ver15)

{% include goto_pagetop.html %}

* * *
## <a name="insert-select">SELECT結果をINSERTするSQL</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-16" updated="2020-12-16" %}</div>
いわゆるINSERT-SELECTです。

<div class="code-box">
<div class="title">TABLE2の内容をすべてTABLE1にINSERTする(列定義がすべて同じ場合)</div>
<pre>
INSERT INTO <em>TABLE1</em>
SELECT * FROM <em>TABLE2</em>
</pre>
</div>

<div class="code-box">
<div class="title">TABLE2の内容を列指定してTABLE1にINSERTする</div>
<pre>
INSERT (<em>COL1, COL2</em>) INTO TABLE1
SELECT <em>COL1, COL2</em> FROM TABLE2
</pre>
</div>

<div class="code-box">
<div class="title">TABLE2の内容を条件で絞り込んでTABLE1にINSERTする</div>
<pre>
INSERT (COL1, COL2) INTO TABLE1
SELECT <em class="blue">a.</em>COL1, <em class="blue">a.</em>COL2 FROM TABLE2 <em class="blue">a</em>
WHERE <em class="blue">a.</em>COL3 = <em>条件1</em> AND <em class="blue">a.</em>COL4 = <em>条件2</em>
</pre>
</div>
SELECTの方はテーブルに別名を付けたりもできる。(上記の`a`)

### 参考
- [(PROJECT GROUP) 表をSELECTして別の表へINSERTする（INSERT ～ SELECT）](https://www.projectgroup.info/tips/SQLServer/SQL/SQL000004.html)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
