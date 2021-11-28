---
chapter_no: 31
chapter_group: ソート系メソッド
chapter_title: sort
created: 2021-11-28
updated: 2021-11-28
---
リストの要素を破壊的にソートするには、リストのメソッドである`sort`を利用します。

```syntax
list.sort()
```
- 引数 `reverse=True`を指定すると、逆順ソートになります。
- 引数 `key`を指定すると、様々なキーでソートできます。

### 例
```:元のリストのソート（破壊的）
list = [3, 10, 2, 1, 5]
list.{em{sort}em}()
assert list == [1, 2, 3, 5, 10]
```
```:逆順
list.{em{sort}em}({em:blue{reverse=True}em})
assert list == [10, 5, 3, 2, 1]
```
```:キーを指定してソート
list = ["BB", "CCC", "A"]
list.{em{sort}em}({em:blue{key=lambda x: -len(x)}em}) {em:comment{# 文字数が多い順}em}
assert list == ["CCC", "BB", "A"]
```

### 参考
- [(note.nkmk.me) Pythonでリストをソートするsortとsortedの違い](https://note.nkmk.me/python-list-sort-sorted/)

### サンプルソース
- [(language-examples) 0003_list.py](https://github.com/fumokmm/language-examples/blob/main/Python/0003_list.py)