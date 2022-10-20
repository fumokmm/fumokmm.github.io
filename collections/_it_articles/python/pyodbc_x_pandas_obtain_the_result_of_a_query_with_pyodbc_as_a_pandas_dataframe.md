---
title: 【pyodbc×pandas】pyodbcでクエリの結果をpandasのDataFrameとして取得する
article_group_id: library-group
display_order: 50
created: 2022-03-23
updated: 2022-03-23
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#取得方法">取得方法</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-03-23" updated="2022-03-23" %}</div>
- `pyodbc`で取得してきた結果を`pandas`の`DataFrame`として取得する方法をメモしておきます。
- 例は、`DataFrame`にした後、CSVファイルとして出力しています。

{% include goto_pagetop.html %}

* * *
## <a name="取得方法">取得方法</a><a class="heading-anchor-permalink" href="#取得方法">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-03-23" updated="2022-03-23" %}</div>
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
import pyodbc
import pandas
import csv

conn = pyodbc.connect("&lt;接続文字列&gt;")
conn.autocommit = False
cursor = conn.cursor()
result = cursor.execute("&lt;SQL&gt;")
desc = result.description
<em class="orange">column_names</em> = [d[0] for d in desc] <em class="comment"># 取得結果の列名を取得</em>
<em>rows</em> = cursor.fetchall() <em class="comment"># データを取得</em>
cursor.close()

<em class="comment"># pyodbcの取得結果=rows</em>
<em class="comment"># rowsをpandasのDataFrameへ</em>
<em class="comment"># ついでにcolumn_namesとして列名のリストも取得し列として指定</em>
df = <em class="blue">pandas.DataFrame(numpy.array(</em><em>rows</em><em class="blue">)</em>, columns=<em class="orange">column_names</em>, index=None)

<em class="comment"># CSVへ出力</em>
df.to_csv("&lt;出力先パス&gt;", sep=",", encoding="UTF-8", index=False, mode="w", quoting=csv.QUOTE_ALL)
</pre>
</div>
- `pyodbc`の取得結果は`rows`という変数に入れています。
- この`rows`を`pandas.DataFrame()`へ、`numpy.array()`にして指定します。
  - `DataFrame`は`df`という変数に入れています。
- 上記は、CSVとして出力するサンプルなので、`pyodbc`の取得結果の`description`から列名を取得し、`column_names`という変数に入れています。
  - `DataFrame`を作る際に、この列名も`columns=`で指定しています。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-03-23" updated="2022-03-23" %}</div>
### 参照
- [pandas](https://pandas.pydata.org/)
- [pyodbc](https://github.com/mkleehammer/pyodbc/wiki)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
