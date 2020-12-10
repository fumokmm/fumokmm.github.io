---
title: Pythonの文法
display_order: 10
created: 2020-12-10
updated: 2020-12-10
---
{% include article_def.html type="article" %}

{% assign chapter_list = site.it_articles  | where: 'category', 'IT'
                                           | where: 'sub_category', 'Python'
                                           | where: 'article', page.url
                                           | sort: 'chapter_no' %}

ここではPythonの文法を簡単にまとめておきます。特に記載のない場合、Python3を対象としています。

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
