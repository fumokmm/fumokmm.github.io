---
title: Rubyで文字列操作
display_order: 20
created: 2021-03-09
updated: 2021-03-09
---
ここではRubyの文字列操作について簡単にまとめておきます。

## <a name="index">目次</a>

<ul id="index_ul">
<li><a href="#include">文字列にある文字列が含まれているかを調べる</a></li>
<li><a href="#reference">参考</a></li>
</ul>

* * *
## <a name="include">文字列にある文字列が含まれているかを調べる</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-09" updated="2021-03-09" %}</div>
<div class="code-box">
<div class="title">If文 - 条件式に後ろが改行の場合はthenを省略できる</div>
<pre>
"hello"<em>.include?</em> "lo"   <em class="comment">#=> true</em>
"hello"<em>.include?</em> "ol"   <em class="comment">#=> false</em>
"hello"<em>.include?</em> ?h     <em class="comment">#=> true</em>
</pre>
</div>

### 参考
- [instance method String#include?](https://docs.ruby-lang.org/ja/latest/method/String/i/include=3f.html)

{% include goto_pagetop.html %}

* * *
## <a name="reference">参考</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-09" updated="2021-03-09" %}</div>
- [オブジェクト指向スクリプト言語 Ruby リファレンスマニュアル](https://docs.ruby-lang.org/ja/latest/doc/index.html)
- [class String](https://docs.ruby-lang.org/ja/latest/class/String.html)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
