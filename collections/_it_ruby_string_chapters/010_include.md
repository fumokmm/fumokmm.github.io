---
chapter_no: 010
chapter_id: include
chapter_title: 文字列にある文字列が含まれているかを調べる
created: 2021-03-09
updated: 2021-03-09
---
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