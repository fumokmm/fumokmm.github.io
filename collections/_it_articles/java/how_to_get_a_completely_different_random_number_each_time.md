---
title: Javaで毎回完全に異なる乱数を取得する方法
display_order: 40
created: 2009-01-16
updated: 2021-06-21
---
当メモは2009-01-16に[投稿されたもの](https://npnl.hatenablog.jp/entry/20090116/1232120896)を加筆修正し、再掲したものです。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#Randomクラスを利用">Randomクラスを利用</a></li>
<li><a href="#種(seed)に完全にランダムなlong値を">種(seed)に完全にランダムなlong値を</a></li>
<li><a href="#シンプルな別解">シンプルな別解</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="Randomクラスを利用">Randomクラスを利用</a><a class="heading-anchor-permalink" href="#Randomクラスを利用">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2009-01-16" updated="2009-01-16" %}</div>
Javaで乱数を利用する場合、`java.util.Random`あたりを使うと思います。  
`java.util.Random`は乱数ジェネレータですので、乱数の種(long seed)を与えて、それぞれ違った順序で乱数を発生させるジェネレータを生成することができます。

<div class="code-box no-title">
<pre>
Random r = new Random(seed);
</pre>
</div>

ということなんですが、この種に同じ値を指定してしまうと、毎回同じ順番で同じ値が取得できてしまい、あまり嬉しくありません。

<div class="code-box no-title">
<pre>
long seed = 1L;
Random r = new Random(seed);
assert r.nextDouble() == 0.7308781907032909;
assert r.nextDouble() == 0.41008081149220166;
assert r.nextDouble() == 0.20771484130971707;
                      <em class="comment">// ↑1Lだとこの順番で乱数が生成される</em>
r = new Random(seed);
assert r.nextDouble() == 0.7308781907032909;
assert r.nextDouble() == 0.41008081149220166;
assert r.nextDouble() == 0.20771484130971707;
                      <em class="comment">// ↑1Lだとこの順番で乱数が生成される</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="種(seed)に完全にランダムなlong値を">種(seed)に完全にランダムなlong値を</a><a class="heading-anchor-permalink" href="#種(seed)に完全にランダムなlong値を">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2009-01-16" updated="2009-01-16" %}</div>
ってことは、種(seed)に完全なランダムなlong値を指定できさえすれば、毎回完全に異なる乱数ジェネレータを生成できるはず。

### java.lang.System#currentTimeMillis()
よく使われるものに、*現在時刻のミリ秒*を使うものがある。

<div class="code-box no-title">
<pre>
long seed = System.currentTimeMillis(); <em class="comment">// 現在時刻のミリ秒</em>
Random r = new Random(seed);
</pre>
</div>

ただ、これだと極稀に複数スレッドから同時にアクセスした時にseedが被ってしまう危険性がある(かもしれない)。

### java.lang.Runtime#freeMemory()
そこで、環境に依存する値として、*空きメモリ量*[^空きメモリ量]を指定する方法は以下のようになる。

<div class="code-box no-title">
<pre>
long seed = Runtime.getRuntime().freeMemory(); <em class="comment">// 空きメモリ量</em>
Random r = new Random(seed);
</pre>
</div>

これで、JavaVMを実行しているマシンの実行時の空きメモリ量に応じて乱数が生成されることになるため、かなり安全性が高まると思われる。  
さらに追い討ちで、*現在時刻のミリ秒＋空きメモリ量*なんていう種(seed)を利用するのもありかもしれない。

<div class="code-box no-title">
<pre>
long seed = System.currentTimeMillis() + Runtime.runtime.freeMemory();
Random r = new Random(seed);
</pre>
</div>

[^空きメモリ量]: 空きメモリ量は刻一刻と変化し続ける。

{% include goto_pagetop.html %}

* * *
## <a name="シンプルな別解">シンプルな別解</a><a class="heading-anchor-permalink" href="#シンプルな別解">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2009-01-16" updated="2021-06-21" %}</div>
これで完璧！と思っていたのですが、実は単純にもっとシンプルな別解があったようです。

### java.lang.Math#random()

<div class="code-box no-title">
<pre>
Math.random()
</pre>
</div>

これは、最初にこのメソッドが利用された時に、`new java.util.Random()`でジェネレータが一回だけ作成されて、以降ずっとそのジェネレータが利用されるらしいです。しかもスレッドセーフ。

[ソース](http://hg.openjdk.java.net/jdk/jdk11/file/1ddf9a99e4ad/src/java.base/share/classes/java/lang/Math.java)を見るとこんな感じになっています。こちらはOpenJDK11のもの。

<div class="code-box">
<div class="title">java/lang/Math.java より抜粋</div>
<pre>
public static double random() {
    return RandomNumberGeneratorHolder.randomNumberGenerator<em>.nextDouble();</em>
}
    :
    :
private static final class RandomNumberGeneratorHolder {
    static final Random randomNumberGenerator = <em>new Random();</em>
}
</pre>
</div>

戻されるdouble値は毎回異なるし、何の問題もないな。なんだ…こんなにシンプルな解決法があったんだ。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2009-01-16" updated="2021-06-21" %}</div>
### 元記事
- [(No Programming, No Life) Javaで毎回完全に異なる乱数を取得する方法](https://npnl.hatenablog.jp/entry/20090116/1232120896)

### 参照
- [(Java Platform SE 6) Random](https://docs.oracle.com/javase/6/docs/api/java/util/Random.html)
- [(Java Platform SE 6) System#currentTimeMillis()](https://docs.oracle.com/javase/6/docs/api/java/lang/System.html#currentTimeMillis())
- [(Java Platform SE 6) Runtime#freeMemory()](https://docs.oracle.com/javase/6/docs/api/java/lang/Runtime.html#freeMemory())
- [(Java Platform SE 6) Math#random()](https://docs.oracle.com/javase/6/docs/api/java/lang/Math.html#random())
- [(OpenJDK / jdk / jdk11) java/lang/Math.java](http://hg.openjdk.java.net/jdk/jdk11/file/1ddf9a99e4ad/src/java.base/share/classes/java/lang/Math.java)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
