---
layout: default
title: 技術系メモ
created: 2020-09-02
updated: 2020-09-08
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
    {% for item in operating_systems %}
    <tr>
        <td><a href="{{ item.link }}">{{ item.name }}</a></td>
        <td>{{ item.description }}</td>
        <td>{{ item.updated }}更新</td>
    </tr>
    {% endfor %}
</table>

