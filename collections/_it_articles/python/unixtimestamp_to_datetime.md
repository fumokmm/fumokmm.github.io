---
title: PythonでUNIXタイムスタンプからdatetimeへ変換する
article_group_id: reverse-lookup-group
display_order: 80
created: 2022-01-26
updated: 2022-01-26
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#datetime.fromtimestamp()">datetime.fromtimestamp()</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-01-26" updated="2022-01-26" %}</div>
UNIX時間をdatetimeに変換するには、`datetime.fromtimestamp()`を使います。  
UNIX時間は1970年1月1日午前0時0分0秒（UNIXエポック）から経過秒数のことです。

{% include goto_pagetop.html %}

* * *
## <a name="datetime.fromtimestamp()">datetime.fromtimestamp()</a><a class="heading-anchor-permalink" href="#datetime.fromtimestamp()">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-01-26" updated="2022-01-26" %}</div>
<div class="code-box no-title">
<pre>
import datetime

d = datetime.datetime.fromtimestamp(1643155801)
print(type(d)) <em class="comment"># =&gt; "&lt;class 'datetime.datetime'&gt;"</em>
print(d) <em class="comment"># =&gt; "2022-01-26 09:10:01"</em>
</pre>
</div>
<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
&lt;class 'datetime.datetime'&gt;
2022-01-26 09:10:01
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-01-26" updated="2022-01-26" %}</div>
### 参照
- [(Wikipedia) UNIX時間](https://ja.wikipedia.org/wiki/UNIX%E6%99%82%E9%96%93)

### 参考サイト
- [(note.nkmk.me) PythonでUNIX時間（エポック秒）と日時datetimeを相互変換](https://note.nkmk.me/python-unix-time-datetime/)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
