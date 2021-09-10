---
title: パラドックスのメモ
created: 2021-09-10
updated: 2021-09-10
---
こちらはパラドックスについてのメモになります。  

{% comment %} ----- グループを取得 ----- {% endcomment %}
{% assign sub_category = site.data.science_sub_category | where: "sub_category_id", "paradox" | first %}
{% assign article_groups = sub_category.article_group %}

{% comment %} ----- 記事リストを取得 ----- {% endcomment %}
{% assign list = site.science_articles  | where: 'category_id', 'science'
                                        | where: 'sub_category_id', 'paradox'
                                        | sort: 'display_order' %}

{% for group in article_groups %}
## {{ group.label }}
<ul>
    {% assign item_in_group = list | where: "article_group_id", group.id %}
    {% for item in item_in_group %}
        <li><a href="{{ item.url }}">{{ item.title }}</a> ({{ item.updated }}更新)</li>
    {% endfor %}
</ul>
{% endfor %}
