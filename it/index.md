---
layout: default
title: 技術系メモ
---
## こちらはプログラミング関連のメモになります

<table>
    {% assign languages = site.data.it.sub_category | where: 'type', 'programming_language' %}
    {% for item in languages %}
    <tr>
        <td><a href="{{ item.link }}">{{ item.name }}</a></td>
        <td>{{ item.description }}</td>
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
    </tr>
    {% endfor %}
</table>
