---
title: Kotlinで二つのリストの要素をペアにしたリストやマップにまとめる
article_group_id: howto-group
display_order: 10
created: 2019-12-07
updated: 2021-07-13
---
当メモは2019-12-04に[投稿されたもの](https://npnl.hatenablog.jp/entry/2019/12/07/001024)を加筆修正し、再掲したものです。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#zipメソッド">zipメソッド</a></li>
<li><a href="#associateメソッド">associateメソッド</a></li>
<li><a href="#使い心地">使い心地</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="zipメソッド">zipメソッド</a><a class="heading-anchor-permalink" href="#zipメソッド">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2019-12-07" updated="2021-07-13" %}</div>
Kotlinで`zip`はどうやるのかな？と思って調べた内容です。  
いろいろありそうだけど、とりあえずシンプルなものをメモしておきます。  
Kotlinにはそのものズバリの`zip`というメソッドが`List`や`Array`に用意されています。

<div class="code-box">
<div class="title">listをzip</div>
<pre>
val list1 = listOf("A", "B", "C")
val list2 = listOf(100, 200, 300)
println(list1<em>.zip</em>(list2))
</pre>
</div>

<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
[(A, 100), (B, 200), (C, 300)]
</pre>
</div>

<div class="code-box">
<div class="title">arrayをzip</div>
<pre>
val array1 = arrayOf("a", "b", "c")
val array2 = arrayOf(400, 500, 600)
println(array1<em>.zip</em>(array2))
</pre>
</div>

<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
[(a, 400), (b, 500), (c, 600)]
</pre>
</div>

出力結果の`(A, 100)`などの部分は、`Pair<out A, out B>`型となっているようです[^what-is-out]。

[^what-is-out]: ところでoutってなんだ？勉強不足

さて、これでペアのリストが得られました。  
例えば以下のようにすれば、1番目の最初の要素`"a"`が取得できます。

<div class="code-box no-title">
<pre>
array1.zip(array2)[0].first <em class="comment">// =&gt; "a"</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="associateメソッド">associateメソッド</a><a class="heading-anchor-permalink" href="#associateメソッド">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2019-12-07" updated="2021-07-13" %}</div>
さて、次はマップにまとめましょう。それには`Collection#associate`を使うといいらしいです。  
ペアのリスト`List<Pair<A, B>>`をアソシエイトすると、マップ` Map<A, B>`が出来上がるようです。

<div class="code-box">
<div class="title">associate map</div>
<pre>
val list1 = listOf("A", "B", "C")
val list2 = listOf(100, 200, 300)
println(list1.zip(list2)<em>.associate</em>{ it })
</pre>
</div>
<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
{A=100, B=200, C=300}
200
</pre>
</div>
いい感じにマップが得られました。

{% include goto_pagetop.html %}

* * *
## <a name="使い心地">使い心地</a><a class="heading-anchor-permalink" href="#使い心地">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2019-12-07" updated="2021-07-13" %}</div>
使い心地はこんな感じです。
<div class="code-box no-title">
<pre>
list1.zip(list2).associate{ it }["B"] <em class="comment">// =&gt; 200</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2019-12-07" updated="2021-07-13" %}</div>
### 元記事
- [(No Programming, No Life) Kotlinで二つのリストの要素をペアにしたリストやマップにまとめる](https://npnl.hatenablog.jp/entry/2019/12/07/001024)

### 参照
- [zip - Kotlin Programming Language](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/zip.html)
- [Pair - Kotlin Programming Language](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin/-pair/)
- [associate - Kotlin Programming Language](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/associate.html)

### 参考
- [(Qiita)【Kotlin】複数の値を返したい！](https://qiita.com/sdkei/items/2d5dab51b53975286945)
- [(Qiita) Kotlin の Collection まとめ ～List編～](https://qiita.com/kiririnyo/items/aee905225902d096f7c0)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
