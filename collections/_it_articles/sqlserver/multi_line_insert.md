---
title: SQL Serverで複数行INSERTするSQL
article_group_id: sql-group
display_order: 5
created: 2021-09-02
updated: 2021-09-02
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#複数行INSERT">複数行INSERT</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="複数行INSERT">複数行INSERT</a><a class="heading-anchor-permalink" href="#複数行INSERT">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-02" updated="2021-09-02" %}</div>
<div class="code-box no-title">
<pre>
INSERT INTO TABLE1
  (COL1, COL2, COL3)
VALUES 
  <em>(1, 'VALUE1', 100),
  (2, 'VALUE2', 200),
  (3, 'VALUE3', 300),
  (4, 'VALUE4', 400),
  (5, 'VALUE5', 500),
  (6, 'VALUE6', 600),
  (7, 'VALUE7', 700),
  (8, 'VALUE8', 800),
  (9, 'VALUE9', 900),
  (10, 'VALUE10', 1000)</em>;
</pre>
</div>

### 解説
- INSERTする列定義までは1回だけ書きます。
- VALUES以降は、挿入するデータを()で囲んだものをカンマ区切りにして複数指定します。
- 複数行INSERTでエラーが発生した場合、1件も行挿入は行われません。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-02" updated="2021-09-02" %}</div>
- [(JOHOBASE) 1回のINSERT（インサートSQL）で複数行のレコードを一括挿入（追加）する](https://johobase.com/multiple-insert-sql/)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
