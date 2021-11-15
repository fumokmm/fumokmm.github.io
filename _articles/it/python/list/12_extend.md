---
chapter_no: 12
chapter_group: 要素追加系メソッド
chapter_title: extend
created: 2021-10-31
updated: 2021-11-16
---
リストにリストの要素を1階層展開してすべて追加するには`extend`メソッドを利用します。
```
list1 = [100, 200, 300]
list2 = ["aaa", "bbb"]
list1{em{.extend(list2)}em}
print(list1)
```
```output
[100, 200, 300, {em{'aaa', 'bbb'}em}]
```
`extend`と同じ挙動は、[+演算子](#+演算子)を使い`+=`とすることでも可能です。


ちなみに、`extend`の代わりに`append`でリストを追加すると、リスト毎追加されてしまいます。
```
list1 = [100, 200, 300]
list2 = ["aaa", "bbb"]
list1{em{.append(list2)}em}  {em:comment{# appendでリストを追加する}em}
print(list1)
```
```output
[100, 200, 300, {em{['aaa', 'bbb']}em}]
```

### 参考
- [(Let'sプログラミング) リストへの要素の追加と別のリストとの結合](https://www.javadrive.jp/python/list/index6.html)
