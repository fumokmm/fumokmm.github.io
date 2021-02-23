---
title: Javaのenumは継承できないけどインタフェースが継承できる
display_order: 10
created: 2012-05-03
updated: 2021-02-23
---
{% assign chapter_list = site.it_java_enums_cannot_be_inherited_but_interfaces_can_chapters %}

当メモは2012-05-03に[投稿されたもの](https://npnl.hatenablog.jp/entry/2012/05/03/103145)を加筆修正し、再掲したものです。

## <a name="index">目次</a>

<ul>
{% for chapter_item in chapter_list %}
<li><a href="#{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a></li>
{% endfor %}
</ul>

{% comment %} 以下、記事 {% endcomment %}

{% for chapter_item in chapter_list %}
## <a name="{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a>
<div class="chapter-updated">{% include update_info_inline.html created=chapter_item.created updated=chapter_item.updated %}</div>
{{ chapter_item.content | markdownify }}
{% include goto_pagetop.html %}
{% endfor %}
