---
title: SQL Serverの変換系関数(CAST, CONVERT, FORMAT, PARSE)
display_order: 30
created: 2020-12-20
updated: 2021-01-04
---
{% assign chapter_list = site.it_sqlserver_conversion_functions_chapters %}

SQL ServerのSQL内でよく使う変関係関数をメモしておきます。  
ここでは、`CAST`, `CONVERT`, `FORMAT`, `PARSE`について書いています。

## <a name="index">目次</a>

<ul>
{% for chapter_item in chapter_list %}
<li><a href="#{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a></li>
{% endfor %}
<li><a href="#explicit-convertion-table">参考：変換表</a></li>
</ul>

{% comment %} 以下、記事 {% endcomment %}

{% for chapter_item in chapter_list %}
## <a name="{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a>
{% include update_info.html created=chapter_item.created updated=chapter_item.updated %}
{{ chapter_item.content | markdownify }}
{% include goto_pagetop.html %}
{% endfor %}

## <a name="explicit-convertion-table">参考：変換表</a>

![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20201220/20201220151008.png)

- [CAST and CONVERT (Transact-SQL)](https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15)より参照
