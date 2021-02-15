---
chapter_no: 002
chapter_id: add-column
chapter_title: 列追加
created: 2021-02-15
updated: 2021-02-15
---
テーブルへの列追加

<div class="code-box-syntax">
<div class="title">構文</div>
<pre>
ALTER TABLE &lt;テーブル名&gt; ADD &lt;カラム名&gt; &lt;型定義...&gt;;
</pre>
</div>

### 例
以下は`User`テーブルに`Score`という名前の列(INT型で、NOT NULLでデフォルト値は0)を追加する例。
<div class="code-box">
<div class="title">列、Scoreの追加</div>
<pre>
ALTER TABLE dbo.[User] ADD Score INT NOT NULL DEFAULT 0;
</pre>
</div>

### 参考
- [(Microsoft \| Docs) テーブルへの列の追加 (データベース エンジン)](https://docs.microsoft.com/ja-jp/sql/relational-databases/tables/add-columns-to-a-table-database-engine?view=sql-server-ver15)
- [(Microsoft \| Docs) ALTER TABLE (Transact-SQL)](https://docs.microsoft.com/ja-jp/sql/t-sql/statements/alter-table-transact-sql?view=sql-server-ver15)