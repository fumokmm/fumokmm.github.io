---
chapter_no: 20
chapter_title: 種(seed)に完全にランダムなlong値を
created: 2009-01-16
updated: 2009-01-16
---
ってことは、種(seed)に完全なランダムなlong値を指定できさえすれば、毎回完全に異なる乱数ジェネレータを生成できるはず。

### java.lang.System#currentTimeMillis()
よく使われるものに、*現在時刻のミリ秒*を使うものがある。

```
long seed = System.currentTimeMillis(); {em:comment{// 現在時刻のミリ秒}em}
Random r = new Random(seed);
```

ただ、これだと極稀に複数スレッドから同時にアクセスした時にseedが被ってしまう危険性がある(かもしれない)。

### java.lang.Runtime#freeMemory()
そこで、環境に依存する値として、*空きメモリ量*[^空きメモリ量]を指定する方法は以下のようになる。

```
long seed = Runtime.getRuntime().freeMemory(); {em:comment{// 空きメモリ量}em}
Random r = new Random(seed);
```

これで、JavaVMを実行しているマシンの実行時の空きメモリ量に応じて乱数が生成されることになるため、かなり安全性が高まると思われる。  
さらに追い討ちで、*現在時刻のミリ秒＋空きメモリ量*なんていう種(seed)を利用するのもありかもしれない。

```
long seed = System.currentTimeMillis() + Runtime.runtime.freeMemory();
Random r = new Random(seed);
```

[^空きメモリ量]: 空きメモリ量は刻一刻と変化し続ける。
