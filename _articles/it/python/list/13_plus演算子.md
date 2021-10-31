---
chapter_no: 13
chapter_group: 要素追加系メソッド
chapter_title: +演算子
created: 2021-10-31
updated: 2021-10-31
---
リストにリストの要素を1階層展開してすべて追加した新しいリストを取得するには、`+`演算子を利用します。
```
list1 = [100, 200, 300]
list2 = ["aaa", "bbb"]
list3 = {em{list1 + list2}em}
print(list3)
print(list1)
print(list2)
```
```output
{em{[100, 200, 300, 'aaa', 'bbb']}em}
[100, 200, 300]
['aaa', 'bbb']
```
- 新しいリストが返却されるので、元のリスト(ここではlist1, list2)には変化はありません。

### 参考
- [(Let'sプログラミング) リストへの要素の追加と別のリストとの結合](https://www.javadrive.jp/python/list/index6.html)
