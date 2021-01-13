---
title: Javaのenumは継承できないけどインタフェースが継承できる
display_order: 10
created: 2012-05-03
updated: 2021-01-12
---
{% assign chapter_list = site.it_java_java_enums_cannot_be_inherited_but_interfaces_can_chapters %}

## <a name="index">目次</a>

<ul>
{% for chapter_item in chapter_list %}
<li><a href="#{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a></li>
{% endfor %}
</ul>

{% comment %} 以下、記事 {% endcomment %}

{% for chapter_item in chapter_list %}
## <a name="{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a>
{% include update_info.html created=chapter_item.created updated=chapter_item.updated %}
{{ chapter_item.content | markdownify }}
{% include goto_pagetop.html %}
{% endfor %}
