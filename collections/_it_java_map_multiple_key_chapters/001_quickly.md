---
chapter_no: 001
chapter_id: quickly
chapter_title: 手っ取り早く複数のキーを指定する
created: 2009-01-16
updated: 2021-02-16
---
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
