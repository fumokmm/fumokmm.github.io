---
layout: default
title: Programmingのメモ
---
こちらはプログラミング関連のメモになります。

<table>
    {% for item in site.data.programming.languages %}
    <tr>
        <td><a href="{{ item.link }}">{{ item.name }}</a></td>
        <td>{{ item.description }}</td>
    </tr>
    {% endfor %}
</table>
