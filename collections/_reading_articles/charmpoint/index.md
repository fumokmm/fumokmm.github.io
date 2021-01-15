---
title: 読書の魅力
created: 2021-01-15
updated: 2021-01-15
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
            {% comment %}
            [{{ item.display_order }}]
            {% endcomment %}
            <a href="{{ item.url }}.html">{{ item.title }}</a> ({{ item.updated }}更新)
            </li>
        {% endif %}
    {% endfor %}
</ul>
