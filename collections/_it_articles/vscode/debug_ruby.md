---
title: Visual Studio CodeでRubyをデバッグする
display_order: 10
created: 2021-03-16
updated: 2021-03-16
---
{% assign chapter_list = site.it_vscode_debug_ruby_chapters %}

{% capture link_to_it_ruby %}{% link _it_articles/ruby/index.md %}{% endcapture %}
{% assign link_to_it_ruby = link_to_it_ruby | remove: 'index' %}
[Ruby]({{link_to_it_ruby}})をVisual Studio Codeで書く時にデバッグする方法のメモです。

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