---
title: Teamsのメモ
created: 2020-10-30
updated: 2020-10-30
---
こちらはTeamsのメモになります。

<ul>
    {% assign list = site.it_articles  | where: 'category', 'IT'
                                       | where: 'sub_category', 'Teams'
                                       | sort: 'display_order' %}
    {% for item in list %}
        {% assign filename = item.url | split: '/' | reverse | first %}
        {% if filename != 'index' %}
            {% comment %}
            <li>[{{ item.display_order }}]<a href="{{ item.url }}.html">{{ item.title }}</a> ({{ item.updated }}更新)</li>
            {% endcomment %}
            <li><a href="{{ item.url }}.html">{{ item.title }}</a> ({{ item.updated }}更新)</li>
        {% endif %}
    {% endfor %}
</ul>
