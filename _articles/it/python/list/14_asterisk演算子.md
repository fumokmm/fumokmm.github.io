---
chapter_no: 14
chapter_group: 要素追加系メソッド
chapter_title: *演算子
created: 2021-10-31
updated: 2021-11-16
---
リストの要素を繰り返したリストを取得するには、`*`演算子を利用します。
```
list1 = ["a"] {em{* 3}em}
print(list1)
```
```output
['a', 'a', 'a']
```
```
list2 = [10, 20, 30] {em{* 2}em}
print(list2)
```
```output
[10, 20, 30, 10, 20, 30]
```
- 新しいリストが返却されるので、元のリスト(ここではlist1やlist2)に変化はありません。

元のリストに破壊的に変更し要素を追加するには`*=`を使います。
```
list3 = ["a", "b", "c"]
list3 {em{*= 2}em}
print(list3)
```
```output
['a', 'b', 'c', 'a', 'b', 'c']
```

### 参考
- [(Python Carnival) 【Python3入門】*(アスタリスク)1個の機能まとめ](https://pycarnival.com/one_asterisk/)