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

<div style="
    display: flex;
    flex-wrap;
    margin-left: -8px;
    margin-right: -8px;
">
    <div style="
        flex-basis: 33%;
        margin-left: 8px;
        margin-right: 8px;
    ">
        <ul>
            <li><a href="#basic">基礎文法</a>
                <ul>{% for chapter_item in chapter_a %}
                <li><a href="#{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a></li>{% endfor %}
                </ul>
            </li>
        </ul>
    </div>

    <div style="
        flex-basis: 33%;
        margin-left: 8px;
        margin-right: 8px;
    ">
        <ul>
            <li><a href="#external-library">外部ライブラリの読み込み</a>
                <ul>{% for chapter_item in chapter_b %}
                <li><a href="#{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a></li>{% endfor %}
                </ul>
            </li>
        </ul>
    </div>
    
    <div style="
        flex-basis: 33%;
        margin-left: 8px;
        margin-right: 8px;
    ">
        <ul>
            <li><a href="#reference_g">参照・参考</a>
                <ul>{% for chapter_item in chapter_c %}
                <li><a href="#{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a></li>{% endfor %}
                </ul>
            </li>
        </ul>
    </div>
</div>

{% comment %} 以下、記事 {% endcomment %}

## <a name="basic">基礎文法</a>

{% for chapter_item in chapter_a %}
## <a name="{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a>
<div class="chapter-updated">{% include update_info_inline.html created=chapter_item.created updated=chapter_item.updated %}</div>
{{ chapter_item.content | markdownify }}
{% include goto_pagetop.html %}
{% endfor %}

## <a name="external-library">外部ライブラリの読み込み</a>

{% for chapter_item in chapter_b %}
## <a name="{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a>
<div class="chapter-updated">{% include update_info_inline.html created=chapter_item.created updated=chapter_item.updated %}</div>
{{ chapter_item.content | markdownify }}
{% include goto_pagetop.html %}
{% endfor %}

## <a name="reference_g">参照・参考</a>

{% for chapter_item in chapter_c %}
## <a name="{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a>
<div class="chapter-updated">{% include update_info_inline.html created=chapter_item.created updated=chapter_item.updated %}</div>
{{ chapter_item.content | markdownify }}
{% include goto_pagetop.html %}
{% endfor %}
