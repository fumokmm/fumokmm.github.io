---
title: Excel作業効率を上げるキーコンビネーション
display_order: 900
created: 2020-12-17
updated: 2020-12-23
---
{% include article_def.html type="article" %}

{% assign chapter_list = site.it_articles  | where: 'category_id', 'it'
                                           | where: 'sub_category_id', 'excel'
                                           | where: 'article', page.url
                                           | sort: 'chapter_no' %}

ここではExcel作業するときに知っていると作業効率の上がるキーコンビネーションをまとめておきます。

## <a name="index">目次</a>

<ul>
{% for chapter_item in chapter_list %}
<li><a href="#{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a></li>
{% endfor %}
</ul>

{% comment %} 以下、記事 {% endcomment %}

{% for chapter_item in chapter_list %}
## <a name="{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a>
{% include update_info.html created=chapter_item.created updated=chapter_item.updated %}
{{ chapter_item.content | markdownify }}
{% include goto_pagetop.html %}
{% endfor %}
