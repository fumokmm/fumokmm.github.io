---
title: Rubyの文法
display_order: 10
created: 2020-12-03
updated: 2021-03-10
---
{% assign chapter_list = site.it_ruby_grammar_chapters %}

ここではRubyの文法を簡単にまとめておきます。

## <a name="index">目次</a>

{% assign chapter_a = chapter_list | where: 'chapter_group', 'a' %}
{% assign chapter_b = chapter_list | where: 'chapter_group', 'b' %}
{% assign chapter_c = chapter_list | where: 'chapter_group', 'c' %}

<table>
    <tr>
        <td>
            <ul>
                <li>基礎文法
                    <ul>{% for chapter_item in chapter_a %}
                    <li><a href="#{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a></li>{% endfor %}
                    </ul>
                </li>
            </ul>
            <ul>
            <li>外部ライブラリの読み込み
                <ul>{% for chapter_item in chapter_b %}
                <li><a href="#{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a></li>{% endfor %}
                </ul>
            </li>
            </ul>
        </td>
        <td>
            <ul>
            <li>参照・参考
                <ul>{% for chapter_item in chapter_c %}
                <li><a href="#{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a></li>{% endfor %}
                </ul>
            </li>
            </ul>
        </td>
    </tr>
</table>

{% comment %} 以下、記事 {% endcomment %}

{% for chapter_item in chapter_list %}
## <a name="{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a>
<div class="chapter-updated">{% include update_info_inline.html created=chapter_item.created updated=chapter_item.updated %}</div>
{{ chapter_item.content | markdownify }}
{% include goto_pagetop.html %}
{% endfor %}
