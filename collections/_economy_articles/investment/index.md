---
title: 投資についてのメモ
created: 2021-05-29
updated: 2021-06-01
---
こちらは投資についてのメモになります。

<ul>
    {% assign list = site.economy_articles  | where: 'category_id', 'economy'
                                            | where: 'sub_category_id', 'investment'
                                            | sort: 'display_order' %}
    {% for item in list %}
        {% assign filename = item.url | split: '/' | reverse | first %}
        {% if filename != 'index' %}
            <li><a href="{{ item.url }}">{{ item.title }}</a> ({{ item.updated }}更新)</li>
        {% endif %}
    {% endfor %}
</ul>
