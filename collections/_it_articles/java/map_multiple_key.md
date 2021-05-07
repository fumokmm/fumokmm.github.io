---
title: JavaでMapに複数のキーを指定する方法
display_order: 20
created: 2009-01-16
updated: 2021-02-16
---
当メモは2009-01-16に[投稿されたもの](https://npnl.hatenablog.jp/entry/20090116/1232123160)を加筆修正し、再掲したものです。


## <a name="index">目次</a>

<ul id="index_ul">
<li><a href="#quickly">手っ取り早く複数のキーを指定する</a></li>
<li><a href="#caution">注意点</a></li>
<li><a href="#reference">参考</a></li>
</ul>

* * *
## <a name="quickly">手っ取り早く複数のキーを指定する</a>
<div class="chapter-updated">{% include update_info_inline.html created="2009-01-16" updated="2021-02-16" %}</div>
`java.util.Map`のキーとして複数のキーを手っ取り早く指定するには、Stringが格納された`java.util.ArrayList<String>`あたりをキーにするとよいです。  
これは、`java.util.ArrayList`はインスタンスが異なっても、格納されている要素が同じ場合は適切なハッシュコード`#hashCode()`と`#equals()`による同一性が保証されるためです。  

<div class="code-box">
<div class="title">サンプルコード</div>
<pre>
<em class="comment">// "a", "b", "c" という3つの文字列を</em>
<em class="comment">// キーとするListを用意する</em>
List&lt;String&gt; key1 = new ArrayList&lt;String&gt;();
key1.add("a");
key1.add("b");
key1.add("c");

<em class="comment">// key1でmapに "hoge" を詰める</em>
Map&lt;List, String&gt; map = new HashMap&lt;List, String&gt;();
map.put(key1, "hoge");

<em class="comment">// key1と同じ内容のListを用意する</em>
List&lt;String&gt; key2 = new ArrayList&lt;String&gt;();
key2.add("a");
key2.add("b");
key2.add("c");

<em class="comment">// key2で "hoge" が取得できる</em>
String result = map.get(key2);
assert result.equals("hoge");

<em class="comment">// 内容が違うListを用意する</em>
List&lt;String&gt; key3 = new ArrayList&lt;String&gt;();
key3.add("a");
key3.add("b");
key3.add("d"); <em class="comment">// c → d に変更すると…</em>
   
<em class="comment">// key3で "hoge" は取得できない</em>
result = map.get(key3);
assert result == null;
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="caution">注意点</a>
<div class="chapter-updated">{% include update_info_inline.html created="2009-01-16" updated="2021-02-16" %}</div>
[ここ](https://sleepy-yoshi.hatenablog.com/entry/20080123/p1)にも書いてありますが、`java.util.TreeMap`の場合、キーとして指定できる値が`java.lang.Comparable`インタフェースを実装しているインスタンスを指定する必要があり、  
内部では`#compareTo()`を利用して、同一性を判定しています。(`#compareTo()`が0を返すと*同じインスタンス*と判定します。それ以外だと*違うインスタンス*と判定します。)  

ということなので、上で紹介した`HashMap`などの例では`java.util.ArrayList`をキーとして使えるのですが、  
`java.util.ArrayList`は`java.lang.Comparable`でないので、`java.util.TreeMap`のキーとしては使えません。  
また、自作したクラスに`java.lang.Comparable`インタフェースを実装して`java.util.TreeMap`のキーとして使用する場合はこの判定方法に注意して下さい。

{% include goto_pagetop.html %}

* * *
## <a name="reference">参考</a>
<div class="chapter-updated">{% include update_info_inline.html created="2009-01-16" updated="2021-02-16" %}</div>
- [(シリコンの谷のゾンビ) TreeMapのキーに注意](https://sleepy-yoshi.hatenablog.com/entry/20080123/p1)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
