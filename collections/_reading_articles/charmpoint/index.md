---
title: 読書の魅力
created: 2021-01-15
updated: 2021-02-20
---
こちらは読書の魅力についてのメモになります。

<ul>
    {% assign list = site.reading_articles  | where: 'category_id', 'reading'
                                            | where: 'sub_category_id', 'charmpoint'
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
