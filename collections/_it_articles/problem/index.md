---
title: プログラミングお題のメモ
created: 2021-01-29
updated: 2022-09-01
---
こちらはプログラミングお題のメモになります。  
私の見かけた面白そうなものや自分で考えたものをメモしています。

<ul>
    {% assign list = site.it_articles  | where: 'category_id', 'it'
                                       | where: 'sub_category_id', 'problem'
                                       | sort: 'display_order' %}
    {% for item in list %}
        {% assign filename = item.url | split: '/' | reverse | first %}
        {% if filename != 'index' %}
            <li><a href="{{ item.url }}">{{ item.title }}</a> ({{ item.updated }}更新)</li>
        {% endif %}
    {% endfor %}
</ul>
