---
title: 失敗について
created: 2021-03-04
updated: 2021-03-04
---
こちらは失敗についてのメモになります。

<ul>
    {% assign list = site.life_articles | where: 'category_id', 'life'
                                        | where: 'sub_category_id', 'failure'
                                        | sort: 'display_order' %}
    {% for item in list %}
        {% assign filename = item.url | split: '/' | reverse | first %}
        {% if filename != 'index' %}
            <li>
            <a href="{{ item.url }}">{{ item.title }}</a> ({{ item.updated }}更新)
            </li>
        {% endif %}
    {% endfor %}
</ul>
