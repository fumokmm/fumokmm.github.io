---
layout: default
title: Databaseのメモ
---
<p>こちらはデータベース関連のメモになります。</p>

<table>
    {% for item in site.data.database.databases %}
    <tr>
        <td><a href="{{ item.link }}">{{ item.name }}</a></td>
        <td>{{ item.description }}</td>
    </tr>
    {% endfor %}
</table>
