---
title: VBAのメモ
created: 2020-09-02
updated: 2020-09-08
---
こちらはVBAのメモになります。

<ul>
    {% assign list = site.it_articles  | where: 'category', 'IT'
                                       | where: 'sub_category', 'VBA'
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
