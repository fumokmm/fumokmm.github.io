---
title: 更新履歴
created: 2020-09-09
updated: 2023-03-31
---
{% assign rev_history = site.history | reverse %}
{% for item in rev_history %}
## <a name="{{ item.updated }}">{{ item.updated }}</a>
{{ item.content | markdownify }}
{% endfor %}
