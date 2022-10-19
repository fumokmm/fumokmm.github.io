---
title: PostgreSQLでデータベース論理名とかテーブル論理名とか列論理名を指定する方法
article_group_id: control-group
display_order: 10
created: 2022-10-19
updated: 2022-10-19
---
## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#データベースへ論理名を指定">データベースへ論理名を指定</a></li>
<li><a href="#テーブルへ論理名を指定">テーブルへ論理名を指定</a></li>
<li><a href="#テーブル列へ論理名を指定">テーブル列へ論理名を指定</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-19" updated="2022-10-19" %}</div>
- PostgreSQLでデータベースやテーブルやテーブルの列に論理名をつける方法のメモです。
- PostgreSQLではこの論理名のことを`コメント`と呼んでいるようです。

{% include goto_pagetop.html %}

* * *
## <a name="データベースへ論理名を指定">データベースへ論理名を指定</a><a class="heading-anchor-permalink" href="#データベースへ論理名を指定">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-19" updated="2022-10-19" %}</div>
### 論理名を追加
<div class="code-box-syntax no-title">
<pre>
COMMENT ON <em class="blue">DATABASE</em> <em class="orange">&lt;データベース名&gt;</em> IS '<em>&lt;データベース論理名&gt;</em>'; 
</pre>
</div>
<div class="code-box">
<div class="title">例：データベースDATABASE_01へデータベースワンという論理名を追加</div>
<pre>
COMMENT ON <em class="blue">DATABASE</em> <em class="orange">DATABASE_01</em> IS '<em>データベースワン</em>'; 
</pre>
</div>

### 論理名を削除
削除は`NULL`を指定するだけです。
<div class="code-box no-title">
<pre>
COMMENT ON <em class="blue">DATABASE</em> <em class="orange">&lt;データベース名&gt;</em> IS <em>NULL</em>; 
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="テーブルへ論理名を指定">テーブルへ論理名を指定</a><a class="heading-anchor-permalink" href="#テーブルへ論理名を指定">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-19" updated="2022-10-19" %}</div>
### 論理名を追加
<div class="code-box-syntax no-title">
<pre>
COMMENT ON <em class="blue">TABLE</em> <em class="orange">&lt;テーブル名&gt;</em> IS '<em>&lt;テーブル論理名&gt;</em>'; 
</pre>
</div>
<div class="code-box">
<div class="title">例：テーブルTABLE_01へテーブル１という論理名を追加</div>
<pre>
COMMENT ON <em class="blue">TABLE</em> <em class="orange">TABLE_01</em> IS '<em>テーブル１</em>'; 
</pre>
</div>

### 論理名を削除
削除は`NULL`を指定するだけです。
<div class="code-box no-title">
<pre>
COMMENT ON <em class="blue">TABLE</em> <em class="orange">&lt;テーブル名&gt;</em> IS <em>NULL</em>; 
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="テーブル列へ論理名を指定">テーブル列へ論理名を指定</a><a class="heading-anchor-permalink" href="#テーブル列へ論理名を指定">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-19" updated="2022-10-19" %}</div>
列名は`テーブル名.列名`の形で指定します。

### 論理名を追加
<div class="code-box-syntax no-title">
<pre>
COMMENT ON <em class="blue">COLUMN</em> <em class="orange">&lt;テーブル名.列名&gt;</em> IS '<em>&lt;テーブル列論理名&gt;</em>'; 
</pre>
</div>
<div class="code-box">
<div class="title">例：テーブルTABLE_01のCOL_01へ列１という論理名を追加</div>
<pre>
COMMENT ON <em class="blue">COLUMN</em> <em class="orange">TABLE_01.COL_01</em> IS '<em>列１</em>'; 
</pre>
</div>

### 論理名を削除
削除は`NULL`を指定するだけです。
<div class="code-box no-title">
<pre>
COMMENT ON <em class="blue">COLUMN</em> <em class="orange">&lt;テーブル名.列名&gt;</em> IS <em>NULL</em>; 
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-19" updated="2022-10-19" %}</div>
### 関連メモ
- [SQL Serverでテーブル論理名とか列論理名を指定する方法]({% link _it_articles/sqlserver/logical_name.md %})

### 参考サイト
- [(PostgresWeb)  【PostgreSQL】データベース、テーブル、列へコメントをつける](https://postgresweb.com/post-5022)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
