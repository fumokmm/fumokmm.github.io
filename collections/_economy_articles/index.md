---
layout: default_layout
title: 経済についてのメモ
created: 2021-05-29
updated: 2023-01-10
---
{% comment %}
カテゴリグループ分、ループしながら記事テーブルを構築
{% endcomment %}

{% assign sub_category_groups = site.data.economy_sub_category_group | sort: 'sub_category_group_order' %}
{% for sub_cat_grp in sub_category_groups %}
{% include article_parts/article_table.html
    category_id="economy"
    sub_category_group=sub_cat_grp.sub_category_group
    description=sub_cat_grp.description %}
{% endfor %}
