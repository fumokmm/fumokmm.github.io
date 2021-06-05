---
title: SQL ServerのORDER BYでNULLのソート順を指定する
article_group_id: sql-group
display_order: 50
created: 2021-05-26
updated: 2021-05-26
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#NULLのソート順">NULLのソート順</a></li>
<li><a href="#reference">参考</a></li>
</ul>

* * *
## <a name="NULLのソート順">NULLのソート順</a><a class="heading-anchor-permalink" href="#NULLのソート順">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-26" updated="2021-05-26" %}</div>
SQL ServerにはOracleのような`nulls first`や`nulls last`がありません。  
SQL ServerでNULLのソート順を指定するには、`CASE句`を使いましょう。
<div class="code-box no-title">
<pre>
ORDER BY
  <em>CASE WHEN</em> <em class="blue">[項目]</em> <em>IS NULL THEN 0 ELSE 1 END</em>,
  <em class="blue">[項目]</em>
</pre>
</div>
- 項目が`NULL`の場合`0`となり、`NULL`でなければ`1`となります。
  - → `NULL`のデータが先に並び、その後`NULL`でないデータが並びます(`nulls first`)
- 逆順にしたい場合は`0`と`1`をひっくり返すか、`DESC`を付けて下さい。


{% include goto_pagetop.html %}

* * *
## <a name="reference">参考</a><a class="heading-anchor-permalink" href="#reference">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-26" updated="2021-05-26" %}</div>
- [(DB & SQL 技術ブログ) NULLのソート順](https://www.dbsheetclient.jp/blog/?p=566)
- [(stack overflow) SQL Server equivalent to Oracle's NULLS FIRST?](https://stackoverflow.com/questions/1456653/sql-server-equivalent-to-oracles-nulls-first)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
