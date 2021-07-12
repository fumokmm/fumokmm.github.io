---
chapter_no: 2
chapter_title: associateメソッド
created: 2019-12-07
updated: 2021-07-13
---
さて、次はマップにまとめましょう。それには`Collection#associate`を使うといいらしいです。  
ペアのリスト`List<Pair<A, B>>`をアソシエイトすると、マップ` Map<A, B>`が出来上がるようです。

```:associate map
val list1 = listOf("A", "B", "C")
val list2 = listOf(100, 200, 300)
println(list1.zip(list2){em{.associate}em}{ it })
```
```output:出力結果
{A=100, B=200, C=300}
200
```
いい感じにマップが得られました。
