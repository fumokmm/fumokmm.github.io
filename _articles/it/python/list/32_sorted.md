---
chapter_no: 32
chapter_group: ソート系メソッド
chapter_title: sorted
created: 2021-11-28
updated: 2021-11-28
---
リストをソートした新たなリストを返却するには`sorted`関数を利用します。

```syntax
new_list = sorted(<リスト>)
```
- 引数 `reverse=True`を指定すると、逆順ソートになります。
- 引数 `key`を指定すると、様々なキーでソートできます。

### 例
```:ソートされた新しいリストを返却
list = [3, 10, 2, 1, 5]
list2 = {em{sorted}em}(list)
assert list2 == [1, 2, 3, 5, 10]
assert list == [3, 10, 2, 1, 5] {em:comment{# 元のリストは変化なし}em}
```
```:逆順
list3 = {em{sorted}em}(list, {em:blue{reverse=True}em})
assert list3 == [10, 5, 3, 2, 1]
assert list == [3, 10, 2, 1, 5] {em:comment{# 元のリストは変化なし}em}
```
```:キーを指定してソート
list = ["BB", "CCC", "A"]
list4 = {em{sorted}em}(list, {em:blue{key=lambda x: -len(x)}em}) {em:comment{# 文字数が多い順}em}
assert list4 == ["CCC", "BB", "A"]
assert list == ["BB", "CCC", "A"] {em:comment{# 元のリストは変化なし}em}
```

### 参考
- [(note.nkmk.me) Pythonでリストをソートするsortとsortedの違い](https://note.nkmk.me/python-list-sort-sorted/)

### サンプルソース
- [(language-examples) 0003_list.py](https://github.com/fumokmm/language-examples/blob/main/Python/0003_list.py)