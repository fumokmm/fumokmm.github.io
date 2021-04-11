---
title: 物理学のメモ
created: 2021-02-18
updated: 2021-02-18
---
こちらは物理学についてのメモになります。  

<ul>
    {% assign list = site.science_articles  | where: 'category_id', 'science'
                                            | where: 'sub_category_id', 'physics'
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
