---
layout: default_layout
title: 雑学についてのメモ
created: 2021-12-26
updated: 2021-12-26
---
## こちらは言語関連のメモになります
<table>
    {% assign sub_categories = site.data.trivia_sub_category | where: 'sub_category_group', 'language'
                                                              | sort: 'sub_category_order' %}
    {% for sub_cat in sub_categories %}
    <tr>
        {% assign articles = site.trivia_articles  | where: 'category_id', 'trivia'
                                                    | where: 'sub_category_id', sub_cat.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_cat.link }}">{{ sub_cat.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_cat.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>
