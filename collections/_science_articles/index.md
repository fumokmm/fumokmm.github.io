---
layout: default_layout
title: 科学のメモ
created: 2021-02-18
updated: 2021-09-10
---
## こちらは物理学のメモになります
<table>
    {% assign sub_categories = site.data.science_sub_category | where: 'sub_category_group', 'physics'
                                                              | sort: 'sub_category_order' %}
    {% for sub_cat in sub_categories %}
    <tr>
        {% assign articles = site.science_articles  | where: 'category_id', 'science'
                                                    | where: 'sub_category_id', sub_cat.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_cat.link }}">{{ sub_cat.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_cat.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらは心理学のメモになります
<table>
    {% assign sub_categories = site.data.science_sub_category | where: 'sub_category_group', 'psychology'
                                                              | sort: 'sub_category_order' %}
    {% for sub_cat in sub_categories %}
    <tr>
        {% assign articles = site.science_articles  | where: 'category_id', 'science'
                                                    | where: 'sub_category_id', sub_cat.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_cat.link }}">{{ sub_cat.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_cat.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはパラドックスのメモになります
<table>
    {% assign sub_categories = site.data.science_sub_category | where: 'sub_category_group', 'paradox'
                                                              | sort: 'sub_category_order' %}
    {% for sub_cat in sub_categories %}
    <tr>
        {% assign articles = site.science_articles  | where: 'category_id', 'science'
                                                    | where: 'sub_category_id', sub_cat.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_cat.link }}">{{ sub_cat.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_cat.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>