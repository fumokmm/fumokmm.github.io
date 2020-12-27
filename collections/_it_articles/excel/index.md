---
title: Excelのメモ
created: 2020-12-17
updated: 2020-12-17
---
こちらはExcelのメモになります。

<ul>
    {% assign list = site.it_articles  | where: 'category_id', 'it'
                                       | where: 'sub_category_id', 'excel'
                                       | sort: 'display_order' %}
    {% for item in list %}
        {% unless item.chapter_no %}
            {% assign filename = item.url | split: '/' | reverse | first %}
            {% if filename != 'index' %}
                <li>
                {% comment %}
                [{{ item.display_order }}]
                {% endcomment %}
                <a href="{{ item.url }}.html">{{ item.title }}</a> ({{ item.updated }}更新)
                </li>
            {% endif %}
        {% endunless %}
    {% endfor %}
</ul>
