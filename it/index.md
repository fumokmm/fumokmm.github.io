---
layout: default
title: 技術系メモ
created: 2020-09-02
updated: 2020-09-14
---
## こちらはプログラミング関連のメモになります

<table>
    {% assign languages = site.data.it.sub_category | where: 'type', 'programming_language' %}
    {% for item in languages %}
    <tr>
        <td><a href="{{ item.link }}">{{ item.name }}</a></td>
        <td>{{ item.description }}</td>
        <td>{{ item.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはデータベース関連のメモになります

<table>
    {% assign databases = site.data.it.sub_category | where: 'type', 'database' %}
    {% for item in databases %}
    <tr>
        <td><a href="{{ item.link }}">{{ item.name }}</a></td>
        <td>{{ item.description }}</td>
        <td>{{ item.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

## こちらはOS関連のメモになります

<table>
    {% assign operating_systems = site.data.it.sub_category | where: 'type', 'operating_system' %}
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
    {% assign shell_scripts = site.data.it.sub_category | where: 'type', 'shellscript' %}
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