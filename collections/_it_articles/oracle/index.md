---
title: Oracleのメモ
created: 2020-11-21
updated: 2020-11-21
---
こちらはOracleのメモになります。

<ul>
    {% assign list = site.it_articles  | where: 'category', 'IT'
                                       | where: 'sub_category', 'Oracle'
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