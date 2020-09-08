---
layout: default
title: 読書についてのメモ
created: 2020-09-08
updated: 2020-09-08
---
## こちらは読書についてのメモになります

<table>
    {% for item in site.data.reading.sub_category %}
    <tr>
        <td><a href="{{ item.link }}">{{ item.name }}</a></td>
        <td>{{ item.description }}</td>
        <td>{{ item.updated }}更新</td>
    </tr>
    {% endfor %}
</table>
