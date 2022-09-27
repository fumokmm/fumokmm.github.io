---
title: 情報整理について
created: 2022-09-27
updated: 2022-09-27
---
こちらは情報整理についてのメモになります。

<ul>
    {% assign list = site.life_articles | where: 'category_id', 'life'
                                        | where: 'sub_category_id', 'information_arrangement'
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
