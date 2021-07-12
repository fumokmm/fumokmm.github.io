---
chapter_no: 1
chapter_title: zipメソッド
created: 2019-12-07
updated: 2021-07-13
---
Kotlinで`zip`はどうやるのかな？と思って調べた内容です。  
いろいろありそうだけど、とりあえずシンプルなものをメモしておきます。  
Kotlinにはそのものズバリの`zip`というメソッドが`List`や`Array`に用意されています。

```:listをzip
val list1 = listOf("A", "B", "C")
val list2 = listOf(100, 200, 300)
println(list1{em{.zip}em}(list2))
```

```output:出力結果
[(A, 100), (B, 200), (C, 300)]
```

```:arrayをzip
val array1 = arrayOf("a", "b", "c")
val array2 = arrayOf(400, 500, 600)
println(array1{em{.zip}em}(array2))
```

```output:出力結果
[(a, 400), (b, 500), (c, 600)]
```

出力結果の`(A, 100)`などの部分は、`Pair<out A, out B>`型となっているようです[^what-is-out]。

[^what-is-out]: ところでoutってなんだ？勉強不足

さて、これでペアのリストが得られました。  
例えば以下のようにすれば、1番目の最初の要素`"a"`が取得できます。

```
array1.zip(array2)[0].first {em:comment{// => "a"}em}
```
