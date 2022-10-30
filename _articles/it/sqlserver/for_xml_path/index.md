---
title: SQL Serverで取得結果行を1列に連結するSQL(FOR XML PATH)
article_group_id: sql-group
display_order: 30
created: 2020-11-07
updated: 2022-10-27
---
{% capture link_to_it_oracle %}{% link _it_articles/oracle/index.md %}{% endcapture %}{% assign link_to_it_oracle = link_to_it_oracle | remove: 'index' %}
{% capture link_to_it_postgresql %}{% link _it_articles/postgresql/index.md %}{% endcapture %}{% assign link_to_it_postgresql = link_to_it_postgresql | remove: 'index' %}

複数取得される結果を結合して1列で取得したい場合があります。SQL Serverでそれを行うSQLについてメモしておきます。
