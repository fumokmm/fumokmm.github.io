---
chapter_no: 002
chapter_id: add-column
chapter_title: 列追加
created: 2021-02-15
updated: 2021-02-15
---
テーブルへ列を追加するALTER文です。

<div class="code-box-syntax">
<div class="title">構文</div>
<pre>
ALTER TABLE <em>&lt;テーブル名&gt;</em> ADD <em>&lt;カラム名&gt;</em> <em>&lt;型定義...&gt;</em>;
</pre>
</div>

### 例
以下は`User`テーブルに`Score`という名前の列(INT型で、NOT NULLでデフォルト値は0)を追加する例。
<div class="code-box">
<div class="title">列、Scoreの追加</div>
<pre>
ALTER TABLE <em>dbo.[User]</em> ADD <em>Score</em> <em>INT NOT NULL DEFAULT 0</em>;
</pre>
</div>

### 参考
- [(Microsoft \| Docs) テーブルへの列の追加 (データベース エンジン)](https://docs.microsoft.com/ja-jp/sql/relational-databases/tables/add-columns-to-a-table-database-engine?view=sql-server-ver15)
- [(Microsoft \| Docs) ALTER TABLE (Transact-SQL)](https://docs.microsoft.com/ja-jp/sql/t-sql/statements/alter-table-transact-sql?view=sql-server-ver15)