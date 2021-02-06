---
chapter_no: 004
chapter_id: identity-insert
chapter_title: IDENTITY指定された列に明示的な値をINSERTする
created: 2020-12-04
updated: 2020-12-04
---
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
