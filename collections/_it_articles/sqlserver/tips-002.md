---
article: /it/sqlserver/tips
chapter_no: 002
chapter_id: sql-for-backing-up-table
chapter_title: テーブルをバックアップするSQL
created: 2020-07-15
updated: 2020-10-15
---
{% include article_def.html type="chapter" %}

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
