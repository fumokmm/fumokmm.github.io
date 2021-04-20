---
title: CSVのメモ
display_order: 10
created: 2021-04-20
updated: 2021-04-20
---
{% assign chapter_list = site.it_structured_text_data_format_csv_chapters %}

そのうち書きます。

## <a name="index">目次</a>

<ul>
{% for chapter_item in chapter_list %}
<li><a href="#{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a></li>
{% endfor %}
</ul>

{% comment %} 以下、記事 {% endcomment %}

{% for chapter_item in chapter_list %}
## <a name="{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a>
{% comment %}
<div class="chapter-updated">{% include update_info_inline.html created=chapter_item.created updated=chapter_item.updated %}</div>
{% endcomment %}
{{ chapter_item.content | markdownify }}
{% include goto_pagetop.html %}
{% endfor %}
