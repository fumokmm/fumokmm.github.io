---
title: Subversionのメモ
created: 2020-10-02
updated: 2021-02-16
---
こちらはSubversionのメモになります。

<ul>
    {% assign list = site.it_articles  | where: 'category_id', 'it'
                                       | where: 'sub_category_id', 'subversion'
                                       | sort: 'display_order' %}
    {% for item in list %}
        {% assign filename = item.url | split: '/' | reverse | first %}
        {% if filename != 'index' %}
            <li><a href="{{ item.url }}">{{ item.title }}</a> ({{ item.updated }}更新)</li>
        {% endif %}
    {% endfor %}
</ul>
