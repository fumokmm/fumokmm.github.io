---
title: SQL Serverで現在時刻や現在日付を取得するSQL
article_group_id: sql-group
display_order: 70
created: 2021-12-27
updated: 2021-12-27
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#GETDATE()">GETDATE()</a></li>
<li><a href="#SYSDATETIME()">SYSDATETIME()</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="GETDATE()">GETDATE()</a><a class="heading-anchor-permalink" href="#GETDATE()">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-27" updated="2021-12-27" %}</div>
### ミリ秒まで取得
<div class="code-box-syntax no-title">
<pre>
GETDATE()
</pre>
</div>
- 戻りの型は`datetime`。

### 例
<div class="code-box no-title">
<pre>
SELECT <em>GETDATE()</em>;
</pre>
</div>
<div class="code-box-output">
<div class="title">取得結果</div>
<pre>
2021-12-27 21:17:21.800
</pre>
</div>

### 日付だけ取得
日付だけ取得するには、`date`にキャストするとよい。

### 例
<div class="code-box no-title">
<pre>
SELECT <em class="blue">CAST(</em><em>GETDATE()</em> <em class="blue">AS DATE</em>);
</pre>
</div>
<div class="code-box-output">
<div class="title">取得結果</div>
<pre>
2021-12-27
</pre>
</div>

### 参照
- [(Microsoft \| Docs) GETDATE (Transact-SQL)](https://docs.microsoft.com/ja-jp/sql/t-sql/functions/getdate-transact-sql)

{% include goto_pagetop.html %}

* * *
## <a name="SYSDATETIME()">SYSDATETIME()</a><a class="heading-anchor-permalink" href="#SYSDATETIME()">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-27" updated="2021-12-27" %}</div>
### マイクロ秒まで取得
<div class="code-box-syntax no-title">
<pre>
SYSDATETIME()
</pre>
</div>
- 戻りの型は`datetime2`。

### 例
<div class="code-box no-title">
<pre>
SELECT <em>SYSDATETIME()</em>;
</pre>
</div>
<div class="code-box-output">
<div class="title">取得結果</div>
<pre>
2021-12-27 21:21:53.7943457
</pre>
</div>

### 参照
- [(Microsoft \| Docs) SYSDATETIME (Transact-SQL)](https://docs.microsoft.com/ja-jp/sql/t-sql/functions/sysdatetime-transact-sql)

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-27" updated="2021-12-27" %}</div>
### 参照
- [(Microsoft \| Docs) GETDATE (Transact-SQL)](https://docs.microsoft.com/ja-jp/sql/t-sql/functions/getdate-transact-sql)
- [(Microsoft \| Docs) SYSDATETIME (Transact-SQL)](https://docs.microsoft.com/ja-jp/sql/t-sql/functions/sysdatetime-transact-sql)

### 参考サイト
- [(iPentec) SQLで現在の日時を取得する (SQL Server Tips)](https://www.ipentec.com/document/sql-server-get-current-datetime)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
