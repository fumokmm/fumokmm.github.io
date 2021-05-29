---
layout: default_layout
title: 経済についてのメモ
created: 2021-05-29
updated: 2021-05-29
---
## こちらは投資についてのメモになります
<table>
    {% assign sub_categories = site.data.economy_sub_category | where: 'sub_category_group', 'investment'
                                                              | sort: 'sub_category_order' %}
    {% for sub_cat in sub_categories %}
    <tr>
        {% assign articles = site.economy_articles  | where: 'category_id', 'investment'
                                                    | where: 'sub_category_id', sub_cat.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_cat.link }}">{{ sub_cat.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_cat.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>
