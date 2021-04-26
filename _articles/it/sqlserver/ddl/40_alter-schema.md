---
chapter_no: 40
chapter_id: alter-schema
chapter_title: スキーマ
created: 2021-04-06
updated: 2021-04-22
---
スキーマ関係のALTER文です。

<div class="code-box-syntax">
<div class="title">構文</div>
<pre>
ALTER SCHEMA <em>&lt;変更前のスキーマ名&gt;</em> TRANSFER <em>&lt;変更後のスキーマ名&gt;</em>.&lt;テーブル名&gt;;
</pre>
</div>

### 例
以下SQLを実行すると、`M_USER`のスキーマを`dbo`から`newschema`に変更します。
<div class="code-box">
<div class="title">スキーマ、dboをnewschemaに変更</div>
<pre>
ALTER SCHEMA <em>dbo</em> TRANSFER <em>newschema</em>.M_USER;
</pre>
</div>

### 参考
- [(iPentec) テーブルのスキーマを変更する - SQL Server Tips](https://www.ipentec.com/document/sql-server-change-table-scheme)