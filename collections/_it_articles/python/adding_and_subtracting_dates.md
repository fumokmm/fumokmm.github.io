---
title: Pythonで日付の足し算、引き算をする
article_group_id: reverse-lookup-group
display_order: 90
created: 2022-02-08
updated: 2022-02-08
---


## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#日付の足し算、引き算">日付の足し算、引き算</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-08" updated="2022-02-08" %}</div>
- 日付の足し算、引き算には、`+演算子`と`timedelta`オブジェクトを使います。

{% include goto_pagetop.html %}

* * *
## <a name="日付の足し算、引き算">日付の足し算、引き算</a><a class="heading-anchor-permalink" href="#日付の足し算、引き算">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-08" updated="2022-02-08" %}</div>
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
import datetime

now = datetime.datetime.now()
print(type(now))  <em class="comment"># =&gt; &lt;class 'datetime.datetime'&gt;</em>
print(now)        <em class="comment"># =&gt; 2022-02-08 21:46:45.976739</em>

<em class="comment"># 日付1日の増分</em>
<em>delta</em> = datetime.timedelta(days=1)
print(type(delta))  <em class="comment"># =&gt; &lt;class 'datetime.timedelta'&gt;</em>
print(delta)        <em class="comment"># =&gt; 1 day, 0:00:00</em>

tomorrow = now <em>+ delta</em>
print(type(tomorrow))  <em class="comment"># =&gt; &lt;class 'datetime.datetime'&gt;</em>
print(tomorrow)        <em class="comment"># =&gt; 2022-02-09 21:46:45.976739</em>

yesterday = now <em>- delta</em>
print(type(yesterday))  <em class="comment"># =&gt; &lt;class 'datetime.datetime'&gt;</em>
print(yesterday)        <em class="comment"># =&gt; 2022-02-07 21:46:45.976739</em>
</pre>
</div>

<div class="code-box-output">
<div class="title">出力結果</div>
<div class="copy-button">Copy</div>
<pre>
&lt;class 'datetime.datetime'&gt;
2022-02-08 21:46:45.976739
&lt;class 'datetime.timedelta'&gt;
1 day, 0:00:00
&lt;class 'datetime.datetime'&gt;
2022-02-<em>09</em> 21:46:45.976739
&lt;class 'datetime.datetime'&gt;
2022-02-<em>07</em> 21:46:45.976739
</pre>
</div>
- 1つ目の日付がnow(今日)
- 2つ目の日付がtomorrow(明日)
- 3つ目の日付がyesterday(昨日)

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-08" updated="2022-02-08" %}</div>
### ソース
- [(language-examples) 0016_timedelta.py](https://github.com/fumokmm/language-examples/blob/main/Python/0016_timedelta.py)

### 参照
- [(Python) timedelta オブジェクト](https://docs.python.org/ja/3/library/datetime.html#timedelta-objects)

### 参考サイト
- [(Python Snippets) 日付の加算 減算 timedelta](https://python.civic-apps.com/timedelta/)
- [(Let'sプログラミング) 日付や時刻の値への加算・減算と値の比較](https://www.javadrive.jp/python/date/index8.html)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
