---
chapter_no: 5
chapter_id: collation
chapter_title: 照合順序設定を確認するSQL
created: 2020-12-11
updated: 2020-12-11
---
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
