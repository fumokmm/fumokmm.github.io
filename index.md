---
title: Home
created: 2020-09-02
updated: 2022-04-25
---
# これは何？
Think Twiceにお越しいただき、ありがとうございます。このサイトは[@fumokmm](https://twitter.com/fumokmm)のメモサイトです。  
ブログでの情報整理に限界を感じ、サイトでの整理方法に戻ってきました。  
主にプログラミングのネタが多いです。日々更新中ですので、良かったら見て行って下さい。  

## メモ
{% capture link_to_it %}{% link _it_articles/index.md %}{% endcapture %}
{% assign link_to_it = link_to_it | remove: 'index' %}
{% assign last_updated_it_articles = site.it_articles | sort: 'updated' | last %}
{% capture link_to_life %}{% link _life_articles/index.md %}{% endcapture %}
{% assign link_to_life = link_to_life | remove: 'index' %}
{% assign last_updated_life_articles = site.life_articles | sort: 'updated' | last %}
{% capture link_to_reading %}{% link _reading_articles/index.md %}{% endcapture %}
{% assign link_to_reading = link_to_reading | remove: 'index' %}
{% assign last_updated_reading_articles = site.reading_articles | sort: 'updated' | last %}
{% capture link_to_science %}{% link _science_articles/index.md %}{% endcapture %}
{% assign link_to_science = link_to_science | remove: 'index' %}
{% assign last_updated_science_articles = site.science_articles | sort: 'updated' | last %}
{% capture link_to_economy %}{% link _economy_articles/index.md %}{% endcapture %}
{% assign link_to_economy = link_to_economy | remove: 'index' %}
{% assign last_updated_economy_articles = site.economy_articles | sort: 'updated' | last %}
{% capture link_to_trivia %}{% link _trivia_articles/index.md %}{% endcapture %}
{% assign link_to_trivia = link_to_trivia | remove: 'index' %}
{% assign last_updated_trivia_articles = site.trivia_articles | sort: 'updated' | last %}
- [IT技術メモ]({{ link_to_it }}) ({{ last_updated_it_articles.updated }}更新)
- [人生についてのメモ]({{ link_to_life }}) ({{ last_updated_life_articles.updated }}更新)
- [読書についてのメモ]({{ link_to_reading }}) ({{ last_updated_reading_articles.updated }}更新)
- [科学のメモ]({{ link_to_science }}) ({{ last_updated_science_articles.updated }}更新)
- [経済についてのメモ]({{ link_to_economy }}) ({{ last_updated_economy_articles.updated }}更新)
- [雑学についてのメモ]({{ link_to_trivia }}) ({{ last_updated_trivia_articles.updated }}更新)

## その他のページ
{% capture link_to_all %}{% link all/index.md %}{% endcapture %}
{% assign link_to_all = link_to_all | remove: 'index' %}
{% capture link_to_history %}{% link history/index.md %}{% endcapture %}
{% assign link_to_history = link_to_history | remove: 'index' %}
{% capture link_to_about %}{% link about/index.md %}{% endcapture %}
{% assign link_to_about = link_to_about | remove: 'index' %}

- [全メモのリスト]({{ link_to_all }})
- [更新履歴]({{ link_to_history }})
- [Think Twiceについて]({{ link_to_about }})
 