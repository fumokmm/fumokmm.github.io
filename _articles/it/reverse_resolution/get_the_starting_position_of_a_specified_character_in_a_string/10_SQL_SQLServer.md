---
chapter_no: 10
chapter_title: SQL(SQL Server)で文字列中の指定した文字の開始位置を取得する
sub_category_id: sqlserver
created: 2021-12-29
updated: 2021-12-29
---
SQL ServerのSQLでは、`CHARINDEX`関数を使います。

### 構文
```syntax
CHARINDEX(<探す文字>, <探される文字列> [, <開始位置>])   
```
- `<探される文字列>`から`<探す文字>`を検索し、最初に見つかった開始位置(`1`始まり)を返却します。
- 見つからなかった場合は`0`が返ります。
- `<開始位置>`は省略可で、省略時は`1`が指定されたものと同等です。

### 例
```:通常利用
SELECT CHARINDEX({em{'C'}em}, 'AB{em{C}em}DEFG');  {em:comment{-- => 3}em}
SELECT CHARINDEX({em{'DE'}em}, 'ABC{em{DE}em}FG');  {em:comment{-- => 4}em}
SELECT CHARINDEX({em{'H'}em}, 'ABCDEFG');  {em:comment{-- => 0}em}
```
- 探す文字列は複数文字でもいけます。
- 見つからない場合は0が返却されます。

```:開始位置を指定
SELECT CHARINDEX('{em{は}em}', '{em:orange{うらにわに}em}{em{は}em}{em:orange{にわにわに}em}{em{は}em}{em:orange{にわにわとりがいる}em}');  {em:comment{-- => 6}em}
SELECT CHARINDEX('{em{は}em}', 'うらにわには{em:orange{にわにわに}em}{em{は}em}{em:orange{にわにわとりがいる}em}', {em:blue{7}em});  {em:comment{-- => 12}em}
SELECT CHARINDEX('{em{は}em}', 'うらにわにはにわにわには{em:orange{にわにわとりがいる}em}', {em:blue{13}em});  {em:comment{-- => 0}em}
```
- 指定した開始位置から検索しはじめます。
- 返却される開始位置は文字列の先頭からのものになります。

### 参考
- [(Microsoft \|Docs) CHARINDEX (Transact-SQL)](https://docs.microsoft.com/ja-jp/sql/t-sql/functions/charindex-transact-sql?redirectedfrom=MSDN&view=sql-server-ver15)
- [(PROJECT GROUP) ある文字列の中から指定した文字の開始位置を取得する](https://www.projectgroup.info/tips/SQLServer/function/F000002.html)
