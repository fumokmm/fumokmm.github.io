---
layout: default_layout
title: 読書についてのメモ
created: 2020-09-09
updated: 2020-09-09
---
## こちらは読書についてのメモになります

<table>
    {% assign methods = site.data.reading_sub_category | where: 'sub_category_group', 'method'
                                                       | sort: 'sub_category_order' %}
    {% for method in methods %}
    <tr>
        {% assign articles = site.reading_articles  | where: 'category_id', 'reading'
                                                    | where: 'sub_category_id', method.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ method.link }}">{{ method.sub_category_label }}</a></td>
        <td>{{ method.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>
