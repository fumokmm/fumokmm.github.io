---
article: /it/sqlserver/conversion_functions
chapter_no: 003
chapter_id: convert
chapter_title: CONVERT
created: 2020-12-20
updated: 2021-01-04
---
CONVERT関数は、任意の値を指定した型に変換する関数です。  
[CAST](#cast)関数との違いとしては、`style`を指定して、型と同時に値の表現も変換できることろです。

<div class="code-box">
<div class="title">CONVERTの構文</div>
<pre>
CONVERT(data_type [(length)], expression　[, style])
</pre>
</div>

- `expression`の部分に値が入り、その値を `data_type`の型に変換してくれます
- `length` は型の桁数を指定しますが、省略可能です
- `style` の部分に値の表現の仕方を指定します。`data_type`のグループごとに指定できる値が違い、種類も多いので、下に表でまとめておきます。
- 変換元の値は任意なので、どんな型でも構いませんが、マッチングタイプがあって、それに外れると変換エラーとなってしまいますので注意しましょう。([参考：変換表](#explicit-convertion-table)を参照)  
  - 例えば、numericからdateへの変換は「×」になっていますので、エラーなります。

### 日付と時刻のスタイル


[Date and Time styles](https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15#date-and-time-styles)



### 参考
- [(Microsoft Docs) CAST and CONVERT (Transact-SQL)](https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15)
- [(w3schools.com) SQL Server CONVERT() Function](https://www.w3schools.com/sql/func_sqlserver_convert.asp)