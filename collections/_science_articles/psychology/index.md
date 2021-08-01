---
title: 心理学のメモ
created: 2021-04-13
updated: 2021-08-01
---
こちらは心理学についてのメモになります。  

<ul>
    {% assign list = site.science_articles  | where: 'category_id', 'science'
                                            | where: 'sub_category_id', 'psychology'
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
