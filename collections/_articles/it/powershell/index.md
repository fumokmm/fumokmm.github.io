---
title: PowerShellのメモ
created: 2020-09-14
updated: 2020-09-14
---
こちらはPowerShellのメモになります。

<ul>
    {% assign list = site.articles  | where: 'category', 'IT'
                                    | where: 'sub_category', 'PowerShell' %}
    {% for item in list %}
        {% assign filename = item.url | split: '/' | reverse | first %}
        {% if filename != 'index' %}
            <li><a href="{{ item.url }}.html">{{ item.title }}</a> ({{ item.updated }}更新)</li>
        {% endif %}
    {% endfor %}
</ul>
