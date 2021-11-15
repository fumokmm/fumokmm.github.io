---
chapter_no: 13
chapter_group: 要素追加系メソッド
chapter_title: +演算子
created: 2021-10-31
updated: 2021-11-16
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
- 新しいリストが返却されるので、元のリスト(ここではlist1, list2)に変化はありません。

元のリストに破壊的に要素を追加するには`+=`を使います。
```
list4 = [400, 500]
list4 {em{+=}em} ["ccc", "ddd"]
print(list4)
```
```output
[400, 500, 'ccc', 'ddd']
```
- 同じ挙動をするメソッドとしては[extend](#extend)があります。

### 参考
- [(Let'sプログラミング) リストへの要素の追加と別のリストとの結合](https://www.javadrive.jp/python/list/index6.html)
- [(@IT) ［解決！Python］リスト（配列）に要素を追加するには（+演算子／+=演算子／append／extend／insertメソッド）](https://atmarkit.itmedia.co.jp/ait/articles/2012/11/news015.html)