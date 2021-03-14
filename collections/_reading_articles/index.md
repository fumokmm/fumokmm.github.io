---
layout: default_layout
title: 読書についてのメモ
created: 2020-09-09
updated: 2021-02-20
---
## こちらは読書の魅力についてのメモになります
<table>
    {% assign sub_categories = site.data.reading_sub_category | where: 'sub_category_group', 'charmpoint'
                                                              | sort: 'sub_category_order' %}
    {% for sub_cat in sub_categories %}
    <tr>
        {% assign articles = site.reading_articles  | where: 'category_id', 'reading'
                                                    | where: 'sub_category_id', sub_cat.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_cat.link }}">{{ sub_cat.sub_category_label }}</a></td>
        <td>{{ sub_cat.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらは読書法についてのメモになります
<table>
    {% assign sub_categories = site.data.reading_sub_category | where: 'sub_category_group', 'method'
                                                              | sort: 'sub_category_order' %}
    {% for sub_cat in sub_categories %}
    <tr>
        {% assign articles = site.reading_articles  | where: 'category_id', 'reading'
                                                    | where: 'sub_category_id', sub_cat.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_cat.link }}">{{ sub_cat.sub_category_label }}</a></td>
        <td>{{ sub_cat.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>
