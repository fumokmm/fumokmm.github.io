---
title: Pythonのメモ
created: 2020-12-10
updated: 2020-12-10
---
こちらはPythonのメモになります。

<ul>
    {% assign list = site.it_articles  | where: 'category', 'IT'
                                       | where: 'sub_category', 'Python'
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
