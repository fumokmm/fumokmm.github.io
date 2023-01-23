---
layout: default_layout
title: 科学のメモ
created: 2021-02-18
updated: 2023-01-23
---
{% comment %}
カテゴリグループ分、ループしながら記事テーブルを構築
{% endcomment %}

{% assign sub_category_groups = site.data.science_sub_category_group | sort: 'sub_category_group_order' %}
{% for sub_cat_grp in sub_category_groups %}
{% include article_parts/article_table.html
    category_id="science"
    sub_category_group=sub_cat_grp.sub_category_group
    description=sub_cat_grp.description %}
{% endfor %}
