---
article: /it/sqlserver/conversion_functions
chapter_no: 003
chapter_id: convert
chapter_title: CONVERT
created: 2020-12-20
updated: 2020-12-20
---
<div class="code-box">
<div class="title">CONVERTの構文</div>
<pre>
CONVERT(data_type [(length)], expression　[, style])
</pre>
</div>

CONVERT関数は、任意の値を指定した型に変換する関数です。  
任意の値なので、どんな型でも構いませんが、マッチングタイプがあって、それに外れると変換エラーとなってしまいますので注意しましょう。(下記の[変換表](#explicit-convertion-table)を参照)  
例えば、numericからdateへの変換は「×」になっていますので、エラーなります。

### 参考
- [(Microsoft Docs) CAST and CONVERT (Transact-SQL)](https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15)
- [(w3schools.com) SQL Server CONVERT() Function](https://www.w3schools.com/sql/func_sqlserver_convert.asp)