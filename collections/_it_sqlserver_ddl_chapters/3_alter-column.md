---
chapter_no: 3
chapter_id: alter-column
chapter_title: 列変更
created: 2021-04-22
updated: 2021-04-22
---
テーブルの列を変更するALTER文です。

<div class="code-box-syntax">
<div class="title">構文</div>
<pre>
ALTER TABLE <em>&lt;テーブル名&gt;</em> ALTER COLUMN <em>&lt;変更する列名&gt;</em> <em>&lt;データ型&gt;</em>;
</pre>
</div>

### 例
以下は`User`テーブルの`Score`という名前の列をINT型で、NOT NULLでデフォルト値は0に変更する例。
<div class="code-box">
<div class="title">列、Scoreの変更</div>
<pre>
ALTER TABLE <em>dbo.[User]</em> ALTER COLUMN <em>Score</em> <em>INT NOT NULL DEFAULT 0</em>;
</pre>
</div>

### 参考
- [(PROJECT GROUP) テーブル定義を変更する（ALTER TABLE）](https://www.projectgroup.info/tips/SQLServer/SQL/SQL000005.html)
