---
title: Visual Studio Codeのメモ
created: 2020-09-16
updated: 2020-09-16
---
こちらはVisual Studio Codeのメモになります。

<ul>
    {% assign list = site.it_articles  | where: 'category_id', 'it'
                                       | where: 'sub_category_id', 'vscode'
                                       | sort: 'display_order' %}
    {% for item in list %}
        {% assign filename = item.url | split: '/' | reverse | first %}
        {% if filename != 'index' %}
            <li><a href="{{ item.url }}">{{ item.title }}</a> ({{ item.updated }}更新)</li>
        {% endif %}
    {% endfor %}
</ul>
