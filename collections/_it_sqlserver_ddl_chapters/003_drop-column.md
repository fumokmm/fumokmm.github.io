---
chapter_no: 003
chapter_id: drop-column
chapter_title: 列削除
created: 2020-10-28
updated: 2021-02-15
---
テーブルから列を削除するALTER文です。

<div class="code-box-syntax">
<div class="title">テーブルから列を削除するSQL</div>
<pre>
ALTER TABLE <em>&lt;テーブル名&gt;</em> DROP COLUMN <em>&lt;カラム名&gt;</em>;
</pre>
</div>

### 例
以下SQLを実行すると、`M_USER`テーブルの`EMAIL_ADDRESS`というカラムが削除されます。
<div class="code-box no-title">
<pre>
ALTER TABLE <em>M_USER</em> DROP COLUMN <em>EMAIL_ADDRESS</em>;
</pre>
</div>

### 注意事項
- テーブルから列を削除すると、列および列に含まれているすべてのデータが削除されます。
- CHECK制約がある列を削除することはできません。最初に制約を削除する必要があります。

### 参考
- [(Microsoft \| Docs) テーブルからの列の削除](https://docs.microsoft.com/ja-jp/sql/relational-databases/tables/delete-columns-from-a-table?view=sql-server-ver15)
