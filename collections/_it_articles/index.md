---
layout: default_layout
title: IT技術メモ
created: 2020-09-02
updated: 2023-02-20
---
## こちらはプログラミング関連のメモになります
<table>
    {% assign sub_categories = site.data.it_sub_category | where: 'sub_category_group', 'programming_language'
                                                         | sort: 'sub_category_order' %}
    {% for sub_category in sub_categories %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', sub_category.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_category.link }}">{{ sub_category.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_category.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはシェルスクリプト関連のメモになります
<table>
    {% assign sub_categories = site.data.it_sub_category | where: 'sub_category_group', 'shellscript'
                                                         | sort: 'sub_category_order' %}
    {% for sub_category in sub_categories %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', sub_category.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_category.link }}">{{ sub_category.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_category.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはプログラミング全般のメモになります
<table>
    {% assign sub_categories = site.data.it_sub_category | where: 'sub_category_group', 'programming_in_general'
                                                         | sort: 'sub_category_order' %}
    {% for sub_category in sub_categories %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', sub_category.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_category.link }}">{{ sub_category.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_category.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはデータベース関連のメモになります
<table>
    {% assign sub_categories = site.data.it_sub_category | where: 'sub_category_group', 'database'
                                                         | sort: 'sub_category_order' %}
    {% for sub_category in sub_categories %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', sub_category.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_category.link }}">{{ sub_category.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_category.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはOS関連のメモになります
<table>
    {% assign sub_categories = site.data.it_sub_category | where: 'sub_category_group', 'operating_system'
                                                         | sort: 'sub_category_order' %}
    {% for sub_category in sub_categories %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', sub_category.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_category.link }}">{{ sub_category.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_category.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはエディタ関連のメモになります
<table>
    {% assign sub_categories = site.data.it_sub_category | where: 'sub_category_group', 'editor'
                                                         | sort: 'sub_category_order' %}
    {% for sub_category in sub_categories %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', sub_category.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_category.link }}">{{ sub_category.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_category.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはブラウザ関連のメモになります
<table>
    {% assign sub_categories = site.data.it_sub_category | where: 'sub_category_group', 'browser'
                                                         | sort: 'sub_category_order' %}
    {% for sub_category in sub_categories %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', sub_category.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_category.link }}">{{ sub_category.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_category.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはバージョン管理システム関連のメモになります
<table>
    {% assign sub_categories = site.data.it_sub_category | where: 'sub_category_group', 'version_control_system'
                                                         | sort: 'sub_category_order' %}
    {% for sub_category in sub_categories %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', sub_category.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_category.link }}">{{ sub_category.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_category.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはインスタントメッセンジャー関連のメモになります
<table>
    {% assign sub_categories = site.data.it_sub_category | where: 'sub_category_group', 'instant_messenger'
                                                         | sort: 'sub_category_order' %}
    {% for sub_category in sub_categories %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', sub_category.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_category.link }}">{{ sub_category.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_category.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはメールクライアント関連のメモになります
<table>
    {% assign sub_categories = site.data.it_sub_category | where: 'sub_category_group', 'mail_client'
                                                         | sort: 'sub_category_order' %}
    {% for sub_category in sub_categories %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', sub_category.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_category.link }}">{{ sub_category.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_category.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはテンプレート言語関連のメモになります
<table>
    {% assign sub_categories = site.data.it_sub_category | where: 'sub_category_group', 'template_language'
                                                         | sort: 'sub_category_order' %}
    {% for sub_category in sub_categories %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', sub_category.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_category.link }}">{{ sub_category.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_category.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはシステム開発のメモになります
<table>
    {% assign sub_categories = site.data.it_sub_category | where: 'sub_category_group', 'system_development'
                                                         | sort: 'sub_category_order' %}
    {% for sub_category in sub_categories %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', sub_category.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_category.link }}">{{ sub_category.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_category.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはポータブル関連のメモになります
<table>
    {% assign sub_categories = site.data.it_sub_category | where: 'sub_category_group', 'portable'
                                                         | sort: 'sub_category_order' %}
    {% for sub_category in sub_categories %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category_id', 'it'
                                               | where: 'sub_category_id', sub_category.sub_category_id %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_category.link }}">{{ sub_category.sub_category_label }}</a></td>
        <td markdown="span">{{ sub_category.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

{% comment %}
カテゴリグループ分、ループしながら記事テーブルを構築
{% endcomment %}
{% assign sub_category_groups = site.data.it_sub_category_group | sort: 'sub_category_group_order' %}
{% for sub_cat_grp in sub_category_groups %}
{% include article_parts/article_table.html
    category_id="it"
    sub_category_group=sub_cat_grp.sub_category_group
    description=sub_cat_grp.description %}
{% endfor %}
