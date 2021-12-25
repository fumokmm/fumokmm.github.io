---
title: 日本語についてのメモ
created: 2021-12-26
updated: 2021-12-26
---
こちらは日本語についてのメモになります。  

<ul>
    {% assign list = site.trivia_articles  | where: 'category_id', 'trivia'
                                            | where: 'sub_category_id', 'japanese'
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
