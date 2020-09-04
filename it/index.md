---
layout: default
title: 技術系メモ
---
## こちらは技術系メモになります


### こちらはプログラミング関連のメモになります

<table>
    {% for item in site.data.it.programming-language %}
    <tr>
        <td><a href="{{ item.link }}">{{ item.name }}</a></td>
        <td>{{ item.description }}</td>
    </tr>
    {% endfor %}
</table>

## こちらはデータベース関連のメモになります

<table>
    {% for item in site.data.it.database %}
    <tr>
        <td><a href="{{ item.link }}">{{ item.name }}</a></td>
        <td>{{ item.description }}</td>
    </tr>
    {% endfor %}
</table>
