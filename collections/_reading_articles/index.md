---
layout: default
title: 読書についてのメモ
created: 2020-09-09
updated: 2020-09-09
---
## こちらは読書についてのメモになります

<table>
    {% assign methods = site.data.sub_category_reading | where: 'type', 'method' %}
    {% for method in methods %}
    <tr>
        {% assign articles = site.reading_articles  | where: 'category', 'Reading'
                                                    | where: 'sub_category', method.name %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ method.link }}">{{ method.name }}</a></td>
        <td>{{ method.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>
