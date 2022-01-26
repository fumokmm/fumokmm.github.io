---
title: Pythonでタイムスタンプ文字列を作成する
article_group_id: reverse-lookup-group
display_order: 70
created: 2000-01-01
updated: 2021-12-22
---


## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#年月日時分秒ミリ秒">年月日時分秒ミリ秒</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="年月日時分秒ミリ秒">年月日時分秒ミリ秒</a><a class="heading-anchor-permalink" href="#年月日時分秒ミリ秒">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-22" updated="2021-12-22" %}</div>
### datetime.strftimeを使う
<div class="code-box no-title">
<pre>
import datetime

now = datetime.datetime.now()
print(now<em>.strftime</em>(<em class="blue">"%Y-%m-%d %H:%M:%S.%f"</em>))
</pre>
</div>
<div class="code-box-output">
<div class="title">実行結果</div>
<pre>
2021-12-22 20:57:49.181353
</pre>
</div>
これだとマイクロ秒まで出力されてしまうので、  
ミリ秒までに削りたい場合、文字列なので末尾の3桁を削れば良いようです。
<div class="code-box no-title">
<pre>
print(now.strftime("%Y-%m-%d %H:%M:%S.%f")<em>[:-3]</em>)
</pre>
</div>
<div class="code-box-output">
<div class="title">実行結果</div>
<pre>
2021-12-22 20:57:49.181
</pre>
</div>

### utcnowを使う
<div class="code-box no-title">
<pre>
from datetime import datetime
print(datetime<em>.utcnow</em>().isoformat(sep=" ", <em class="blue">timespec="milliseconds"</em>))
</pre>
</div>
<div class="code-box-output">
<div class="title">実行結果</div>
<pre>
2021-12-22 11:57:49.182
</pre>
</div>
`timespec`に`milliseconds`と与えることでミリ秒までの出力にすることができます。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-22" updated="2021-12-22" %}</div>
### ソース
- [(language-examples) 0011_timestamp_str.py](https://github.com/fumokmm/language-examples/blob/main/Python/0011_timestamp_str.py)

### 参照
- [(Python) time.strftime](https://docs.python.org/ja/3/library/time.html#time.strftime)

### 参考サイト
- [(DelftStack) Python で DateTime をミリ秒単位の文字列に変換する](https://www.delftstack.com/ja/howto/python/python-datetime-milliseconds/)
- [(Python Snippets) 日付フォーマット(datetime⇔文字列）](https://python.civic-apps.com/date-format/)
- [(stack overflow) Format a datetime into a string with milliseconds](https://stackoverflow.com/questions/7588511/format-a-datetime-into-a-string-with-milliseconds)
- [(まくまくPythonノート) 現在時刻から YYYY-MM-DD のような日付文字列を生成する (strftime)](https://maku77.github.io/python/datetime/date-string.html)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
