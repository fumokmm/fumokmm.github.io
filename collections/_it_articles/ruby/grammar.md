---
title: Rubyの文法
display_order: 10
created: 2020-12-03
updated: 2021-03-18
---
{% assign chapter_list = site.it_ruby_grammar_chapters %}
{% assign chapter_groups = chapter_list | group_by: "chapter_group" %}

ここではRubyの文法を簡単にまとめておきます。

## <a name="index">目次</a>

<div style="column-count: 2;">
{% for chapter_group_items in chapter_groups %}
    {% assign group_name = chapter_group_items.name %}
    {% assign group_label_item = chapter_group_items.items | where_exp: "chapter_group_label", "chapter_group_label != nil" | first %}
    {% assign group_label = group_label_item.chapter_group_label %}
    {% assign chapter_items = chapter_group_items.items | sort: "chapter_no" %}
    <ul>
        <li><a href="#{{ group_name }}">{{ group_label }}</a>
            <ul>{% for chapter_item in chapter_items %}
                {% if chapter_item.chapter_group_label == nil %}
                <li><a href="#{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a></li>
                {% endif %}{% endfor %}
            </ul>
        </li>
    </ul>{% endfor %}
</div>

{% comment %} 以下、記事 {% endcomment %}

{% for chapter_group_items in chapter_groups %}
    {% assign group_name = chapter_group_items.name %}
    {% assign group_label_item = chapter_group_items.items | where_exp: "chapter_group_label", "chapter_group_label != nil" | first %}
    {% assign group_label = group_label_item.chapter_group_label %}
    {% assign chapter_items = chapter_group_items.items | sort: "chapter_no" %}

## <a name="{{ group_name }}">{{ group_label }}</a>

    {% for chapter_item in chapter_items %}
    {% if chapter_item.chapter_group_label == nil %}

## <a name="{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a>
<div class="chapter-updated">{% include update_info_inline.html created=chapter_item.created updated=chapter_item.updated %}</div>
{{ chapter_item.content | markdownify }}
{% include goto_pagetop.html %}

    {% endif %}
    {% endfor %}
{% endfor %}
