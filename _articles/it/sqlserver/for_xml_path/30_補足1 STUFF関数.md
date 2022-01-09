---
chapter_no: 30
chapter_title: 補足1 STUFF関数
created: 2020-11-07
updated: 2020-11-07
---
`STUFF関数`は、引数を4つ取る関数で、指定した文字列(第1引数)の、指定した位置(第2引数)から、指定した文字数(第3引数)分を、置換文字列(第4引数)に置き換える関数です。以下のような感じになります。

```:STUFF関数
SELECT
    {em{STUFF(}em}'abcdefg', 2, 3, '**new**'{em{)}em} AS "結果";
```

```:結果
a**new**efg
```
