---
title: SQL ServerでUPDATEするSQL
article_group_id: sql-group
display_order: 10
created: 2021-04-06
updated: 2021-04-06
---
こちらは更新系(UPDATE)のSQLのメモになります。

## <a name="index">目次</a><a href="#目次">§</a>

<ul id="index_ul">
<li><a href="#update-data-with-information-from-other-tables">他テーブルの情報でデータを更新する</a></li>
</ul>

* * *
## <a name="update-data-with-information-from-other-tables">他テーブルの情報でデータを更新する</a><a href="#update-data-with-information-from-other-tables">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-04-06" updated="2021-04-06" %}</div>
<div class="code-box">
<div class="title">他テーブルの情報でデータを更新するSQL</div>
<pre>
UPDATE
  <em>&lt;更新したいテーブル&gt;</em>
SET
  aaa = <em class="blue">a</em>.xxx
  bbb = <em class="blue">a</em>.yyy
  ccc = <em class="blue">a</em>.zzz
FROM
  <em class="blue">&lt;他テーブル&gt; a</em>
WHERE
    <em>&lt;更新したいテーブル&gt;</em>.id1 = <em class="blue">a</em>.id1
AND <em>&lt;更新したいテーブル&gt;</em>.id2 = <em class="blue">a</em>.id2
AND <em>&lt;更新したいテーブル&gt;</em>.id3 = <em class="blue">a</em>.id3
</pre>
</div>
- `<他テーブル>`は別名指定(上記例では`a`)できるのですが、`<更新したいテーブル>`は別名指定できないようなので、フルでテーブル名を指定します。

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
