---
title: Pythonで文字列が数字かどうかを判定する
article_group_id: reverse-lookup-group
display_order: 60
created: 2021-11-24
updated: 2021-11-24
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#文字列が十進数字かどうかを判定する(str.isdecimal)">文字列が十進数字かどうかを判定する(str.isdecimal)</a></li>
<li><a href="#文字列が数字かどうかを判定する(str.isdigit)">文字列が数字かどうかを判定する(str.isdigit)</a></li>
<li><a href="#文字列が数を表す文字かどうかを判定する(str.isnumeric)">文字列が数を表す文字かどうかを判定する(str.isnumeric)</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-24" updated="2021-11-24" %}</div>
文字列が数字かどうかを判定するには、`str`型に用意されている`str.isdecimal()`や`str.isdigit()`や`str.isnumeric()`メソッドを利用します。

{% include goto_pagetop.html %}

* * *
## <a name="文字列が十進数字かどうかを判定する(str.isdecimal)">文字列が十進数字かどうかを判定する(str.isdecimal)</a><a class="heading-anchor-permalink" href="#文字列が十進数字かどうかを判定する(str.isdecimal)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-24" updated="2021-11-24" %}</div>
- `isdecimal()`は、すべての文字が十進数字(Unicodeの一般カテゴリ`Nd`に含まれる文字)だと`True`となります。
- 全角のアラビア数字なども`True`となります。

### 例
<div class="code-box">
<div class="title">isnumeric()</div>
<div class="copy-button">Copy</div>
<pre>
<em class="comment"># 半角数値</em>
assert "1234567890".isdecimal() == <em class="blue">True</em>

<em class="comment"># 全角数字</em>
assert "１２３４５６７８９０".isdecimal() == <em class="blue">True</em>

<em class="comment"># 2乗を表す上付き数字²</em>
assert "²".isdecimal() == <em>False</em>

<em class="comment"># 分数</em>
assert "½".isdecimal() == <em>False</em>

<em class="comment"># ローマ数字</em>
assert "Ⅶ".isdecimal() == <em>False</em>

<em class="comment"># 漢数字</em>
assert "一二三四五六七八九〇".isdecimal() == <em>False</em>
assert "壱億参阡萬".isdecimal() == <em>False</em>
</pre>
</div>

### 参照
- [str.isdecimal()](https://docs.python.org/ja/3/library/stdtypes.html#str.isdecimal)

{% include goto_pagetop.html %}

* * *
## <a name="文字列が数字かどうかを判定する(str.isdigit)">文字列が数字かどうかを判定する(str.isdigit)</a><a class="heading-anchor-permalink" href="#文字列が数字かどうかを判定する(str.isdigit)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-24" updated="2021-11-24" %}</div>
- `isdigit()`は、`isdecimal()`で`True`となる数字に加え、Unicodeのプロパティ値Numeric_TypeがDigitまたはDecimalである数字も`True`となります。
- 例えば、2乗を表す上付き数字`²`（\u00B2）は`isdecimal()`では`False`ですが、`isdigit()`では`True`です。

### 例
<div class="code-box">
<div class="title">isnumeric()</div>
<div class="copy-button">Copy</div>
<pre>
<em class="comment"># 半角数値</em>
assert "1234567890".isdigit() == <em class="blue">True</em>

<em class="comment"># 全角数字</em>
assert "１２３４５６７８９０".isdigit() == <em class="blue">True</em>

<em class="comment"># 2乗を表す上付き数字²</em>
assert "²".isdigit() == <em class="blue">True</em>

<em class="comment"># 分数</em>
assert "½".isdigit() == <em>False</em>

<em class="comment"># ローマ数字</em>
assert "Ⅶ".isdigit() == <em>False</em>

<em class="comment"># 漢数字</em>
assert "一二三四五六七八九〇".isdigit() == <em>False</em>
assert "壱億参阡萬".isdigit() == <em>False</em>
</pre>
</div>

### 参照
- [str.isdigit()](https://docs.python.org/ja/3/library/stdtypes.html#str.isdigit)

{% include goto_pagetop.html %}

* * *
## <a name="文字列が数を表す文字かどうかを判定する(str.isnumeric)">文字列が数を表す文字かどうかを判定する(str.isnumeric)</a><a class="heading-anchor-permalink" href="#文字列が数を表す文字かどうかを判定する(str.isnumeric)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-24" updated="2021-11-24" %}</div>
- `isnumeric()`は、`isdigit()`で`True`となる数字に加え、Unicodeのプロパティ値Numeric_TypeがNumericである数字も`True`となります。  
- 分数やローマ数字、漢数字なども`True`となります。

### 例
<div class="code-box">
<div class="title">isnumeric()</div>
<div class="copy-button">Copy</div>
<pre>
<em class="comment"># 半角数値</em>
assert "1234567890".isnumeric() == <em class="blue">True</em>

<em class="comment"># 全角数字</em>
assert "１２３４５６７８９０".isnumeric() == <em class="blue">True</em>

<em class="comment"># 2乗を表す上付き数字²</em>
assert "²".isnumeric() == <em class="blue">True</em>

<em class="comment"># 分数</em>
assert "½".isnumeric() == <em class="blue">True</em>

<em class="comment"># ローマ数字</em>
assert "Ⅶ".isnumeric() == <em class="blue">True</em>

<em class="comment"># 漢数字</em>
assert "一二三四五六七八九〇".isnumeric() == <em class="blue">True</em>
assert "壱億参阡萬".isnumeric() == <em class="blue">True</em>
</pre>
</div>

### 参照
- [str.isnumeric()](https://docs.python.org/ja/3/library/stdtypes.html#str.isnumeric)

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-24" updated="2021-11-24" %}</div>
### 参照
- [文字列メソッド](https://docs.python.org/ja/3/library/stdtypes.html#string-methods)
- [str.isdecimal()](https://docs.python.org/ja/3/library/stdtypes.html#str.isdecimal)
- [str.isdigit()](https://docs.python.org/ja/3/library/stdtypes.html#str.isdigit)
- [str.isnumeric()](https://docs.python.org/ja/3/library/stdtypes.html#str.isnumeric)

### 参考サイト
- [(note.nkmk.me) Pythonで文字列が数字か英字か英数字か判定・確認](https://note.nkmk.me/python-str-num-determine/)


{% include goto_pagetop.html %}

{% include articles_common_script.html %}
