---
chapter_no: 002
chapter_id: caution
chapter_title: 注意点
created: 2009-01-16
updated: 2021-02-16
---
[ここ](https://sleepy-yoshi.hatenablog.com/entry/20080123/p1)にも書いてありますが、`java.util.TreeMap`の場合、キーとして指定できる値が`java.lang.Comparable`インタフェースを実装しているインスタンスを指定する必要があり、  
内部では`#compareTo()`を利用して、同一性を判定しています。(`#compareTo()`が0を返すと **同じインスタンス** と判定する。それ以外だと **"違うインスタンス"** と判定します)  

ということなので、上で紹介した`HashMap`などの例では`java.util.ArrayList`をキーとして使えるのですが、  
`java.util.ArrayList`は`java.lang.Comparable`でないので、`java.util.TreeMap`のキーとしては使えません。  
また、自作したクラスに`java.lang.Comparable`インタフェースを実装して`java.util.TreeMap`のキーとして使用する場合はこの判定方法に注意して下さい。
