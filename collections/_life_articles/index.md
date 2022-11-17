---
layout: default_layout
title: 人生についてのメモ
created: 2021-01-20
updated: 2022-11-16
---
## こちらはミニマリズムについてのメモになります
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

## こちらは目的についてのメモになります
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

## こちらは成功についてのメモになります
<table>
    {% assign sub_categories = site.data.life_sub_category | where: 'sub_category_group', 'success'
                                                           | sort: 'sub_category_order' %}
    {% for sub_cat in sub_categories %}
    <tr>
        {% assign articles = site.life_articles | where: 'category_id', 'life'
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

## こちらは人間関係についてのメモになります
<table>
    {% assign sub_categories = site.data.life_sub_category | where: 'sub_category_group', 'human_relations'
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

## こちらは精神や心についてのメモになります
<table>
    {% assign sub_categories = site.data.life_sub_category | where: 'sub_category_group', 'mind'
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

## こちらは習慣化についてのメモになります
<table>
    {% assign sub_categories = site.data.life_sub_category | where: 'sub_category_group', 'habituation'
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

## こちらは過ごし方についてのメモになります
<table>
    {% assign sub_categories = site.data.life_sub_category | where: 'sub_category_group', 'spend'
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

{% comment %}
カテゴリグループ分、ループしながら記事テーブルを構築
{% endcomment %}
{% assign sub_category_groups = site.data.life_sub_category_group | sort: 'sub_category_group_order' %}
{% for sub_cat_grp in sub_category_groups %}
{% include article_parts/article_table.html
    category_id="life"
    sub_category_group=sub_cat_grp.sub_category_group
    description=sub_cat_grp.description %}
{% endfor %}
