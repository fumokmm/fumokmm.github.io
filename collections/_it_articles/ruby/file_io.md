---
title: RubyでFile I/O
display_order: 30
created: 2021-03-09
updated: 2021-03-10
---
{% assign chapter_list = site.it_ruby_file_io_chapters %}

ここではRubyのファイルI/Oについて簡単にまとめておきます。

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