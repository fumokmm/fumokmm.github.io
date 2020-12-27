---
article: /it/sqlserver/tips
chapter_no: 006
chapter_id: insert-select
chapter_title: SELECT結果をINSERTするSQL
created: 2020-12-16
updated: 2020-12-16
---
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