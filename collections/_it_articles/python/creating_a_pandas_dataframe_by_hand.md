---
title: pandasのDataFrameを手で作成する
article_group_id: library-group
display_order: 30
created: 2021-10-27
updated: 2021-10-27
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#辞書(ハッシュ)で作成">辞書(ハッシュ)で作成</a></li>
<li><a href="#2次元リストで作成">2次元リストで作成</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-27" updated="2021-10-27" %}</div>
`pandas`の`DataFrame`を手で作成する方法をメモしておきます。
辞書(ハッシュ)で作成する場合と2次元リストで作成する場合、行と列の方向が違うので注意。  
- 辞書(ハッシュ)で作成した時は、列を軸(辞書のキー)にして行のデータをリストで指定します。
- 2次元リストで作成の時は、データは普通の行・列で指定します。


{% include goto_pagetop.html %}

* * *
## <a name="辞書(ハッシュ)で作成">辞書(ハッシュ)で作成</a><a class="heading-anchor-permalink" href="#辞書(ハッシュ)で作成">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-27" updated="2021-10-27" %}</div>
<div class="code-box">
<div class="title">辞書(ハッシュ)で作成</div>
<pre>
import pandas as pd

print("-" * 30)
df1 = pd.DataFrame(<em>{
    "A": [1, 2, 3, 4, 5],
    "B": [6, 7, 8, 9, 10],
    "C": [11, 12, 13, 14, 15],
}</em>)
print(df1)
</pre>
</div>

<div class="code-box-output">
<div class="title">出力</div>
<pre>
   A   B   C
0  1   6  11
1  2   7  12
2  3   8  13
3  4   9  14
4  5  10  15
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="2次元リストで作成">2次元リストで作成</a><a class="heading-anchor-permalink" href="#2次元リストで作成">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-27" updated="2021-10-27" %}</div>
<div class="code-box">
<div class="title">2次元リストで作成</div>
<pre>
import pandas as pd

print("-" * 30)
df2 = pd.DataFrame(<em>[
    [1, 2, 3, 4, 5],
    [6, 7, 8, 9, 10],
    [11, 12, 13, 14, 15],
]</em>, <em class="blue">columns=["A", "B", "C", "D", "E"]</em>)
print(df2)
</pre>
</div>
- 2次元配列で指定する時は、列名や行名を別で指定します。

<div class="code-box-output">
<div class="title">出力</div>
<pre>
    A   B   C   D   E
0   1   2   3   4   5
1   6   7   8   9  10
2  11  12  13  14  15
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-27" updated="2021-10-27" %}</div>
### サンプルソース
- [(language-examples) 0005_pandas_DataFrame.py](https://github.com/fumokmm/language-examples/blob/main/Python/0005_pandas_DataFrame.py)

### 参考サイト
- [(Python でデータサイエンス) Pandas でデータフレームを作ってみよう](https://pythondatascience.plavox.info/pandas/pandas%E3%81%A7%E3%83%87%E3%83%BC%E3%82%BF%E3%83%95%E3%83%AC%E3%83%BC%E3%83%A0%E3%82%92%E4%BD%9C%E3%81%A3%E3%81%A6%E3%81%BF%E3%82%88%E3%81%86)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
