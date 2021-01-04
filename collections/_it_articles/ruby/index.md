---
title: Rubyのメモ
created: 2020-12-03
updated: 2020-12-03
---
こちらはRubyのメモになります。

<ul>
    {% assign list = site.it_articles  | where: 'category_id', 'it'
                                       | where: 'sub_category_id', 'ruby'
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
