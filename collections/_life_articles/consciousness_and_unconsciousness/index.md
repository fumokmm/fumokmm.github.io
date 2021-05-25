---
title: 意識と無意識について
created: 2021-05-25
updated: 2021-05-25
---
こちらは意識と無意識についてのメモになります。

<ul>
    {% assign list = site.life_articles | where: 'category_id', 'life'
                                        | where: 'sub_category_id', 'consciousness_and_unconsciousness'
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
