---
title: Windowsのメモ
created: 2020-12-28
updated: 2021-12-02
---
こちらはWindowsのメモになります。

{% comment %} ----- グループを取得 ----- {% endcomment %}
{% assign sub_category = site.data.it_sub_category | where: "sub_category_id", "windows" | first %}
{% assign article_groups = sub_category.article_group %}

{% comment %} ----- 記事リストを取得 ----- {% endcomment %}
{% assign list = site.it_articles  | where: 'category_id', 'it'
                                   | where: 'sub_category_id', 'windows'
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
