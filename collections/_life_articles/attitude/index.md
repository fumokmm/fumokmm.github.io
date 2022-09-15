---
title: 態度について
created: 2021-01-20
updated: 2022-09-15
---
こちらは態度についてのメモになります。

<ul>
    {% assign list = site.life_articles | where: 'category_id', 'life'
                                        | where: 'sub_category_id', 'attitude'
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

