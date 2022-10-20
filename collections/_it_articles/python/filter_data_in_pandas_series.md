---
title: pandasのSeriesのデータを絞り込む
article_group_id: library-group
display_order: 40
created: 2021-11-07
updated: 2021-11-07
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#boolのリストを取得">boolのリストを取得</a></li>
<li><a href="#絞り込み">絞り込み</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-07" updated="2021-11-07" %}</div>
`pandas`の`Series`のデータを絞り込む方法をメモしておきます。
- `Series`対して処理を行い、条件にマッチする場合は`True`、マッチしなければ`False`をとなるような`Series`や`boolのリスト`に変換します。
- `boolのリスト`を`Series`のインデックスとして渡すことで、`True`となる部分のみ抽出します。


{% include goto_pagetop.html %}

* * *
## <a name="boolのリストを取得">boolのリストを取得</a><a class="heading-anchor-permalink" href="#boolのリストを取得">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-07" updated="2021-11-07" %}</div>
`pandas`の`Series`のデータから`bool`のリストやSeriesを取得します。  
ここでは例として以下のような`Series`を利用します。

<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
import pandas as pd

ser = pd.Series(["晴れ", "雨", "くもり","晴れ時々くもり", "雨"])
print(ser)
</pre>
</div>
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
0         晴れ
1          雨
2        くもり
3    晴れ時々くもり
4          雨
dtype: object
</pre>
</div>

### 完全一致
完全一致する場合`True`を返却するようにする場合は`==`を利用します。
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
print(ser <em>==</em> "雨")
</pre>
</div>
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
0    False
<em>1     True</em>
2    False
3    False
<em>4     True</em>
dtype: bool
</pre>
</div>

### 含まれる文字列(str.contains)
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
print(ser<em>.str.contains</em>("時々"))
</pre>
</div>
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
0    False
1    False
2    False
<em>3     True</em>
4    False
dtype: bool
</pre>
</div>

### 指定文字で終わる(str.endswith)
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
print(ser<em>.str.endswith</em>("くもり"))
</pre>
</div>
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
0    False
1    False
<em>2     True</em>
<em>3     True</em>
4    False
dtype: bool
</pre>
</div>

# 指定文字で始まる(str.startswith)
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
print(ser<em>.str.startswith</em>("晴れ"))
</pre>
</div>
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
<em>0     True</em>
1    False
2    False
<em>3     True</em>
4    False
dtype: bool
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="絞り込み">絞り込み</a><a class="heading-anchor-permalink" href="#絞り込み">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-07" updated="2021-11-07" %}</div>
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
print(ser[<em>ser == "雨"</em>])
</pre>
</div>
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
1    雨
4    雨
dtype: object
</pre>
</div>
- 赤時の部分が[boolのリスト](#boolのリストを取得)となっているため、`True`の部分のみ抽出されます。

### リスト内包表記にて
`boolのリスト`であれば良いので、以下のような`リスト内包表記`でも同じ結果が得られます。
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
print(ser[<em>[x == "雨" for x in ser]</em>])
</pre>
</div>
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
1    雨
4    雨
dtype: object
</pre>
</div>
- 複雑な条件を組み立てるときは利用できそうですが、通常のケースではシンプルに書けるので、前者の方でよいかなと思います。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-07" updated="2021-11-07" %}</div>
### サンプルソース
- [(language-examples) 0007_pandas_Series.py](https://github.com/fumokmm/language-examples/blob/main/Python/0007_pandas_Series.py)

### 参考サイト
- [(note.nkmk.me) pandasで特定の文字列を含む行を抽出（完全一致、部分一致）](https://note.nkmk.me/python-pandas-str-contains-match/)
- [(AI-interのPython3入門) Pandas Seriesを徹底解説！(作成、結合、要素の抽出・追加・削除、index、ソートなど)](https://ai-inter1.com/python-series/)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
