---
chapter_no: 1
chapter_title: Randomクラスを利用
created: 2009-01-16
updated: 2009-01-16
---
Javaで乱数を利用する場合、`java.util.Random`あたりを使うと思います。  
`java.util.Random`は乱数ジェネレータですので、乱数の種(long seed)を与えて、それぞれ違った順序で乱数を発生させるジェネレータを生成することができます。

```
Random r = new Random(seed);
```

ということなんですが、この種に同じ値を指定してしまうと、毎回同じ順番で同じ値が取得できてしまい、あまり嬉しくありません。

```
long seed = 1L;
Random r = new Random(seed);
assert r.nextDouble() == 0.7308781907032909;
assert r.nextDouble() == 0.41008081149220166;
assert r.nextDouble() == 0.20771484130971707;
                      {em:comment{// ↑1Lだとこの順番で乱数が生成される}em}
r = new Random(seed);
assert r.nextDouble() == 0.7308781907032909;
assert r.nextDouble() == 0.41008081149220166;
assert r.nextDouble() == 0.20771484130971707;
                      {em:comment{// ↑1Lだとこの順番で乱数が生成される}em}
```
