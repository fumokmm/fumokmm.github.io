---
chapter_no: 1
chapter_title: str.joinメソッド
created: 2021-10-18
updated: 2021-10-18
---
`str`の`joinメソッド`を使います。  
```output
>>> list = ["a", "b", "c"]
>>> {em{"/"}em}.{em:blue{join(}em}list{em:blue{)}em}
'a/b/c'
```
- 結合したい文字列のjoinメソッドの引数にリストを渡すと結合した文字列が取得できます。

ただし、リストの中身が文字列じゃないとエラーになるので注意して下さい。
```output:TypeError
>>> list2 = [100, 200, 300]
>>> "/".join(list2)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
{em{TypeError: sequence item 0: expected str instance, int found}em}
```
