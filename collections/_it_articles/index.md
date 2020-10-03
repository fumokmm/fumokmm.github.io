---
layout: default
title: 技術系メモ
created: 2020-09-02
updated: 2020-09-16
---
## こちらはプログラミング関連のメモになります

<table>
    {% assign programming_languages = site.data.sub_category_it | where: 'type', 'programming_language' %}
    {% for programming_language in programming_languages %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category', 'IT'
                                               | where: 'sub_category', programming_language.name %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ programming_language.link }}">{{ programming_language.name }}</a></td>
        <td>{{ programming_language.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはデータベース関連のメモになります

<table>
    {% assign databases = site.data.sub_category_it | where: 'type', 'database' %}
    {% for database in databases %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category', 'IT'
                                               | where: 'sub_category', database.name %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ database.link }}">{{ database.name }}</a></td>
        <td>{{ database.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはOS関連のメモになります

<table>
    {% assign operating_systems = site.data.sub_category_it | where: 'type', 'operating_system' %}
    {% for operating_system in operating_systems %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category', 'IT'
                                               | where: 'sub_category', operating_system.name %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ operating_system.link }}">{{ operating_system.name }}</a></td>
        <td>{{ operating_system.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはシェルスクリプト関連のメモになります

<table>
    {% assign shell_scripts = site.data.sub_category_it | where: 'type', 'shellscript' %}
    {% for shell_script in shell_scripts %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category', 'IT'
                                               | where: 'sub_category', shell_script.name %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ shell_script.link }}">{{ shell_script.name }}</a></td>
        <td>{{ shell_script.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはエディタ関連のメモになります

<table>
    {% assign editors = site.data.sub_category_it | where: 'type', 'editor' %}
    {% for editor in editors %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category', 'IT'
                                               | where: 'sub_category', editor.name %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ editor.link }}">{{ editor.name }}</a></td>
        <td>{{ editor.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはブラウザ関連のメモになります

<table>
    {% assign browsers = site.data.sub_category_it | where: 'type', 'browser' %}
    {% for browser in browsers %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category', 'IT'
                                               | where: 'sub_category', browser.name %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ browser.link }}">{{ browser.name }}</a></td>
        <td>{{ browser.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはバージョン管理システム関連のメモになります

<table>
    {% assign sub_categories = site.data.sub_category_it | where: 'type', 'version_control_system' %}
    {% for sub_category in sub_categories %}
    <tr>
        {% assign articles = site.it_articles  | where: 'category', 'IT'
                                               | where: 'sub_category', sub_category.name %}
        {% assign last_updated_article = articles | sort: 'updated' | last %}

        <td><a href="{{ sub_category.link }}">{{ sub_category.name }}</a></td>
        <td>{{ sub_category.description }}</td>
        <td>{{ last_updated_article.updated }}更新</td>
    </tr>
    {% endfor %}
</table>
