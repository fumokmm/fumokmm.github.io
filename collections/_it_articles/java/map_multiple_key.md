---
title: JavaでMapに複数のキーを指定する方法
display_order: 20
created: 2009-01-16
updated: 2021-02-16
---
{% assign chapter_list = site.it_java_map_multiple_key_chapters %}

当メモは2009-01-16に[投稿されたもの](https://npnl.hatenablog.jp/entry/20090116/1232123160)を加筆修正し、再掲したものです。

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
