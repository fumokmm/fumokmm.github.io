---
title: 構造化テキストデータフォーマットのメモ
created: 2021-04-20
updated: 2021-04-20
---
こちらは構造化テキストデータフォーマットのメモになります。

<ul>
    {% assign list = site.it_articles  | where: 'category_id', 'it'
                                       | where: 'sub_category_id', 'structured_text_data_format'
                                       | sort: 'display_order' %}
    {% for item in list %}
        {% assign filename = item.url | split: '/' | reverse | first %}
        {% if filename != 'index' %}
            <li><a href="{{ item.url }}">{{ item.title }}</a> ({{ item.updated }}更新)</li>
        {% endif %}
    {% endfor %}
</ul>
