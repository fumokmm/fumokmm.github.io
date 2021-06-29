---
title: Groovyのループいろいろ
display_order: 20
created: 2008-12-11
updated: 2021-06-29
---
当メモは2008-12-11に[投稿されたもの](https://npnl.hatenablog.jp/entry/20081211/1229015622)を加筆修正し、再掲したものです。  
当初の掲載からだいぶ時間が経過していますので、古い内容のものもあると思いますのでご注意下さい。  
順次アップデートしていく予定です。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#はじめに">はじめに</a></li>
<li><a href="#forループ">forループ</a></li>
<li><a href="#for-inでループ">for-inでループ</a></li>
<li><a href="#範囲(Range)でループ">範囲(Range)でループ</a></li>
<li><a href="#クロージャでループ">クロージャでループ</a></li>
<li><a href="#繰り返し用のメソッドでループ">繰り返し用のメソッドでループ</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="はじめに">はじめに</a><a class="heading-anchor-permalink" href="#はじめに">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2008-12-11" updated="2021-06-29" %}</div>
Groovyではループ処理がJavaより格段に便利になっている。ということでメモしておきます。  
以下ソースはいずれも Groovy Version: 3.0.7 で動作確認を行いました。

{% include goto_pagetop.html %}

* * *
## <a name="forループ">forループ</a><a class="heading-anchor-permalink" href="#forループ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2008-12-11" updated="2021-06-29" %}</div>
### 昔ながらの
<div class="code-box no-title">
<pre>
def array = [0, 1, 2, 3, 4]
for (int i = 0; i &lt; array.size(); i++) {
    assert array[i] == i
}
</pre>
</div>


{% include goto_pagetop.html %}

* * *
## <a name="for-inでループ">for-inでループ</a><a class="heading-anchor-permalink" href="#for-inでループ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2008-12-11" updated="2021-06-29" %}</div>
### コレクションのループ
<div class="code-box no-title">
<pre>
def array = [0, 1, 2, 3, 4]
def nums = ''
for (i in array) {
    nums += i 
}
assert nums == '01234'
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="範囲(Range)でループ">範囲(Range)でループ</a><a class="heading-anchor-permalink" href="#範囲(Range)でループ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2008-12-11" updated="2021-06-29" %}</div>
<div class="code-box no-title">
<pre>
def nums = ''

<em class="comment">// 0〜4</em>
for (i in 0..4) {
  nums += i
}
assert nums == '01234'

nums = ''
<em class="comment">// 0〜5より小さい</em>
for (i in 0..&lt;5) {
  nums += i
}
assert nums == '01234'

nums = ''
<em class="comment">// 4〜0 (逆範囲)</em>
for (i in 4..0) {
  nums += i 
}
assert nums == '43210'

nums = ''
<em class="comment">// 4〜0より大きい (逆範囲)</em>
for (i in 4..&lt;0) {
  nums += i 
}
assert nums == '4321'
</pre>
</div>
- 一番最後のRangeの逆範囲に対しても、`<`が有効なのがユニークですね😉

{% include goto_pagetop.html %}

* * *
## <a name="クロージャでループ">クロージャでループ</a><a class="heading-anchor-permalink" href="#クロージャでループ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2008-12-11" updated="2021-06-29" %}</div>
### コレクションをループ
<div class="code-box no-title">
<pre>
def array = [0, 1, 2, 3, 4]
def nums = ''

<em class="comment">// 各要素ごとに繰り返し</em>
array.each {
    nums += it
}
assert nums == '01234'

nums = ''
<em class="comment">// 各要素ごとに逆順で繰り返し</em>
array.reverseEach {
    nums += it
}
assert nums == '43210'
</pre>
</div>

### 範囲(Range)を利用して
<div class="code-box no-title">
<pre>
def nums = ''
<em class="comment">// 範囲を直接eachで回す</em>
(0..4).each {
    nums += it  
}
assert nums == '01234'

<em class="comment">// 範囲はIntRangeクラス</em>
def r = new IntRange(0, 4)
assert r == 0..4
nums = ''
r.each {
    nums += it  
}
assert nums == '01234'
</pre>
</div>


{% include goto_pagetop.html %}

* * *
## <a name="繰り返し用のメソッドでループ">繰り返し用のメソッドでループ</a><a class="heading-anchor-permalink" href="#繰り返し用のメソッドでループ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2008-12-11" updated="2021-06-29" %}</div>
### times
<div class="code-box no-title">
<pre>
def nums = ''
10.times { nums += it }
assert nums == '0123456789'
</pre>
</div>

### upto, downto
<div class="code-box no-title">
<pre>
def nums = ''
0.upto(9) { nums += it }
assert nums == '0123456789'

nums = ''
9.downto(0) { nums += it }
assert nums == '9876543210'
</pre>
</div>

### step
<div class="code-box no-title">
<pre>
def nums = ''
0.step(8, 2) { nums += it }
assert '02468'
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2008-12-11" updated="2021-06-29" %}</div>
### 元記事
- [元記事](https://npnl.hatenablog.jp/entry/20081211/1229015622)

### 参考記事
- [(No Programming, No Life) Groovyで頻出なコードの書き方のチートシート](https://npnl.hatenablog.jp/entry/20081224/1230124652)

### 参考書籍
- {% include book/book_609.html %} {% comment %} Groovyイン・アクション {% endcomment %}

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
