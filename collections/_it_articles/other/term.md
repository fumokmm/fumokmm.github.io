---
title: IT用語
display_order: 30
created: 2020-10-09
updated: 2021-02-25
---
{% assign chapter_list = site.it_other_term_chapters %}

IT用語のひとこと説明です。

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
