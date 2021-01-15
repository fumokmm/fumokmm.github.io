---
title: 読書法
created: 2020-09-09
updated: 2020-09-09
---
こちらは読書法についてのメモになります。  
様々な書籍に色々と読書法が書かれていますが、どれも似通ったことを言っていることがほとんどです。  
本質的なことをまとめておきたいと思います。

<ul>
    {% assign list = site.reading_articles  | where: 'category_id', 'reading'
                                            | where: 'sub_category_id', 'method'
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
