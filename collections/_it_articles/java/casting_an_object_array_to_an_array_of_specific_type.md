---
title: Javaでオブジェクト配列を特定の型の配列にキャストする
article_group_id: tips-group
display_order: 25
created: 2008-09-02
updated: 2021-10-03
---
当メモは2008-09-02に[投稿されたもの](https://npnl.hatenablog.jp/entry/20080902/1220372739)を加筆修正し、再掲したものです。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#配列のキャスト">配列のキャスト</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="配列のキャスト">配列のキャスト</a><a class="heading-anchor-permalink" href="#配列のキャスト">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2008-09-02" updated="2021-10-03" %}</div>
以下を実行すると`java.lang.ClassCastException`が発生する。
<div class="code-box no-title">
<pre>
Object[] objArray = new Object[]{
    "aaa",
    "bbb",
    "ccc"
};
<em>String[] strArray = (String[]) objArray;</em>
for (String str : strArray) {
    System.out.println(str);
}
</pre>
</div>

これは、`Object配列(Object)`を一気に`String配列(String)`にキャストできないから。  
しかたないので、いったん`Collection`にしてから戻すとうまくいく。

<div class="code-box no-title">
<pre>
String[] strArray = <em>Arrays.asList(objArray).toArray(new String[objArray.length]);</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-03" updated="2021-10-03" %}</div>
### 元記事
- [(No Programming, No Life) 配列のキャスト](https://npnl.hatenablog.jp/entry/20080902/1220372739)

### サンプルソース
- [(language-examples) sample0001arraycast](https://github.com/fumokmm/language-examples/tree/main/Java/src/main/java/sample0001arraycast)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
