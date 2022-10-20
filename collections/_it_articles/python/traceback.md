---
title: Pythonでスタックトレース(traceback)を出力する
article_group_id: tips-group
display_order: 10
created: 2021-10-29
updated: 2021-10-29
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#traceback">traceback</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-29" updated="2021-10-29" %}</div>
JavaであるようなスタックトレースをPythonでも出力する方法をメモしておきます。
- スタックトレースの情報を取得するには、`traceback`モジュールを`import`しておきます。

{% include goto_pagetop.html %}

* * *
## <a name="traceback">traceback</a><a class="heading-anchor-permalink" href="#traceback">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-29" updated="2021-10-29" %}</div>
ゼロ割で例外を発生させるサンプルです。
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
import <em>traceback</em>

try:
    num = 1 / 0  <em class="comment"># ここで例外が発生</em>

except Exception as e:
    <em class="comment"># 文字列を取得する</em>
    print("エラー情報\n" + <em>traceback.format_exc()</em>)
</pre>
</div>
<div class="code-box">
<div class="title">output</div>
<div class="copy-button">Copy</div>
<pre>
<em class="command">&gt; python .\0006_traceback.py</em>
エラー情報
Traceback (most recent call last):
  File ".\0006_traceback.py", line 4, in &lt;module&gt;
    num = 1 / 0
ZeroDivisionError: division by zero
</pre>
</div>
- tracebackの詳細については[こちら](https://docs.python.org/ja/3/library/traceback.html#module-traceback)を参照ください。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-29" updated="2021-10-29" %}</div>
### 参照
- [traceback --- スタックトレースの表示または取得](https://docs.python.org/ja/3/library/traceback.html#module-traceback)

### サンプルソース
- [(language-examples) 0006_traceback.py](https://github.com/fumokmm/language-examples/blob/main/Python/0006_traceback.py)

### 参考サイト
- [(Python学習講座) traceback スタックトレースの取得](https://www.python.ambitious-engineer.com/archives/657)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
