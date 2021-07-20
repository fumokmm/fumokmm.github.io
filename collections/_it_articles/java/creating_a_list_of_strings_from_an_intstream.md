---
title: JavaでIntStreamからStringのListを作る
article_group_id: tips-group
display_order: 60
created: 2020-08-28
updated: 2021-07-13
---
当メモは2020-08-28に[投稿されたもの](https://npnl.hatenablog.jp/entry/2020/08/28/190738)を加筆修正し、再掲したものです。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#mapToObj">mapToObj</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="mapToObj">mapToObj</a><a class="heading-anchor-permalink" href="#mapToObj">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-08-28" updated="2021-07-13" %}</div>
`IntStream`から`String`の`List(List)`を作りたかったんですが、`#map`だと`int`にしか変換できないなと思っていたら`#mapToObj`を使えばいいようです。

<div class="code-box no-title">
<pre>
List&lt;String&gt; numList = IntStream.range(1, 10)
    <em>.mapToObj</em>(new DecimalFormat("000")::format)
    .collect(Collectors.toList());
</pre>
</div>

こんな感じで。 numListには
<div class="code-box-output no-title">
<pre>
["000", "001", ... "009"]
</pre>
</div>
が入ります。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-13" updated="2021-07-13" %}</div>
### 元記事
- [(No Programming, No Life) JavaでIntStreamからStringのListを作る](https://npnl.hatenablog.jp/entry/2020/08/28/190738)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
