---
title: スネークケースをキャメルケースに変換する
article_group_id: string-group
display_order: 30
created: 2022-03-31
updated: 2022-03-31
---
{% capture link_to_it_excel %}{% link _it_articles/excel/index.md %}{% endcapture %}{% assign link_to_it_excel = link_to_it_excel | remove: 'index' %}
## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#Excelでスネークケースをキャメルケースに変換する">Excelでスネークケースをキャメルケースに変換する</a></li>
<li><a href="#関連メモ">関連メモ</a></li>
</ul>

* * *
## <a name="Excelでスネークケースをキャメルケースに変換する">Excelでスネークケースをキャメルケースに変換する</a><a class="heading-anchor-permalink" href="#Excelでスネークケースをキャメルケースに変換する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-03-31" updated="2022-03-31" %}</div>
<div class="code-box">
<div class="title">ローワーキャメルケース</div>
<div class="copy-button">Copy</div>
<pre>
=
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
LOWER(A1)
,"_0", "0")
,"_1", "1")
,"_2", "2")
,"_3", "3")
,"_4", "4")
,"_5", "5")
,"_6", "6")
,"_7", "7")
,"_8", "8")
,"_9", "9")
,"_a", "A")
,"_b", "B")
,"_c", "C")
,"_d", "D")
,"_e", "E")
,"_f", "F")
,"_g", "G")
,"_h", "H")
,"_i", "I")
,"_j", "J")
,"_k", "K")
,"_l", "L")
,"_m", "M")
,"_n", "N")
,"_o", "O")
,"_p", "P")
,"_q", "Q")
,"_r", "R")
,"_s", "S")
,"_t", "T")
,"_u", "U")
,"_v", "V")
,"_w", "W")
,"_x", "X")
,"_y", "Y")
,"_z", "Z")
</pre>
</div>
例)
<div class="code-box-input">
<div class="title">A1セル</div>
<div class="copy-button">Copy</div>
<pre>
AAA_BBB_CCC
</pre>
</div>
<div class="code-box-output">
<div class="title">B2セル(上記の数式の結果)</div>
<div class="copy-button">Copy</div>
<pre>
aaaBbbCcc
</pre>
</div>

<div class="code-box">
<div class="title">アッパーキャメルケース</div>
<div class="copy-button">Copy</div>
<pre>
=UPPER(LEFT(A1, 1))&amp;
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
LOWER(MID(A1, 2, LEN(A1)))
,"_0", "0")
,"_1", "1")
,"_2", "2")
,"_3", "3")
,"_4", "4")
,"_5", "5")
,"_6", "6")
,"_7", "7")
,"_8", "8")
,"_9", "9")
,"_a", "A")
,"_b", "B")
,"_c", "C")
,"_d", "D")
,"_e", "E")
,"_f", "F")
,"_g", "G")
,"_h", "H")
,"_i", "I")
,"_j", "J")
,"_k", "K")
,"_l", "L")
,"_m", "M")
,"_n", "N")
,"_o", "O")
,"_p", "P")
,"_q", "Q")
,"_r", "R")
,"_s", "S")
,"_t", "T")
,"_u", "U")
,"_v", "V")
,"_w", "W")
,"_x", "X")
,"_y", "Y")
,"_z", "Z")
</pre>
</div>
<div class="code-box-input">
<div class="title">A1セル</div>
<div class="copy-button">Copy</div>
<pre>
AAA_BBB_CCC
</pre>
</div>
<div class="code-box-output">
<div class="title">B2セル(上記の数式の結果)</div>
<div class="copy-button">Copy</div>
<pre>
AaaBbbCcc
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="関連メモ">関連メモ</a><a class="heading-anchor-permalink" href="#関連メモ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-03-31" updated="2022-03-31" %}</div>
- [Excelのメモ]({{link_to_it_excel}})

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
