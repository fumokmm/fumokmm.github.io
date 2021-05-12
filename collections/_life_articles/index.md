---
layout: default_layout
title: 人生についてのメモ
created: 2021-01-20
updated: 2021-05-12
---
## こちらは断捨離についてのメモになります
<table>
    {% assign sub_categories = site.data.life_sub_category | where: 'sub_category_group', 'minimalism'
                                                           | sort: 'sub_category_order' %}
    {% for sub_cat in sub_categories %}
    <tr>
        {% assign articles = site.life_articles  | where: 'category_id', 'life'
                                                 | where: 'sub_category_id', sub_cat.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_cat.link }}">{{ sub_cat.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_cat.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらは態度についてのメモになります
<table>
    {% assign sub_categories = site.data.life_sub_category | where: 'sub_category_group', 'attitude'
                                                           | sort: 'sub_category_order' %}
    {% for sub_cat in sub_categories %}
    <tr>
        {% assign articles = site.life_articles  | where: 'category_id', 'life'
                                                 | where: 'sub_category_id', sub_cat.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_cat.link }}">{{ sub_cat.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_cat.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらは人生の目的についてのメモになります
<table>
    {% assign sub_categories = site.data.life_sub_category | where: 'sub_category_group', 'purpose'
                                                           | sort: 'sub_category_order' %}
    {% for sub_cat in sub_categories %}
    <tr>
        {% assign articles = site.life_articles  | where: 'category_id', 'life'
                                                 | where: 'sub_category_id', sub_cat.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_cat.link }}">{{ sub_cat.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_cat.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらは失敗についてのメモになります
<table>
    {% assign sub_categories = site.data.life_sub_category | where: 'sub_category_group', 'failure'
                                                           | sort: 'sub_category_order' %}
    {% for sub_cat in sub_categories %}
    <tr>
        {% assign articles = site.life_articles  | where: 'category_id', 'life'
                                                 | where: 'sub_category_id', sub_cat.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_cat.link }}">{{ sub_cat.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_cat.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらは時間管理についてのメモになります
<table>
    {% assign sub_categories = site.data.life_sub_category | where: 'sub_category_group', 'time_management'
                                                           | sort: 'sub_category_order' %}
    {% for sub_cat in sub_categories %}
    <tr>
        {% assign articles = site.life_articles  | where: 'category_id', 'life'
                                                 | where: 'sub_category_id', sub_cat.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_cat.link }}">{{ sub_cat.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_cat.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらは食事についてのメモになります
<table>
    {% assign sub_categories = site.data.life_sub_category | where: 'sub_category_group', 'health'
                                                           | sort: 'sub_category_order' %}
    {% for sub_cat in sub_categories %}
    <tr>
        {% assign articles = site.life_articles  | where: 'category_id', 'life'
                                                 | where: 'sub_category_id', sub_cat.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_cat.link }}">{{ sub_cat.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_cat.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらは幸せについてのメモになります
<table>
    {% assign sub_categories = site.data.life_sub_category | where: 'sub_category_group', 'happiness'
                                                           | sort: 'sub_category_order' %}
    {% for sub_cat in sub_categories %}
    <tr>
        {% assign articles = site.life_articles  | where: 'category_id', 'life'
                                                 | where: 'sub_category_id', sub_cat.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_cat.link }}">{{ sub_cat.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_cat.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらは運についてのメモになります
<table>
    {% assign sub_categories = site.data.life_sub_category | where: 'sub_category_group', 'luck'
                                                           | sort: 'sub_category_order' %}
    {% for sub_cat in sub_categories %}
    <tr>
        {% assign articles = site.life_articles  | where: 'category_id', 'life'
                                                 | where: 'sub_category_id', sub_cat.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_cat.link }}">{{ sub_cat.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_cat.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>
