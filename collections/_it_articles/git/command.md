---
title: Gitコマンドのメモ
display_order: 10
created: 2010-11-07
updated: 2021-03-03
---
{% assign chapter_list = site.it_git_command_chapters %}

当メモは2010-11-07に[投稿されたもの](https://npnl.hatenablog.jp/entry/20101107/1289121576)を加筆修正し、再掲したものです。
基本的に当時の内容そのままとなっておりますので、8割りくらいは今でも通用すると思いますが、  
廃止になっている機能もあるかもしれませんのでご注意下さい。  

このリファレンスはGitのコマンドの網羅的な説明にはなっていません。  
よく使う(と思われる)機能をさらっと調べるためのリファレンスですので、  
より詳細な機能を調べる際には[Git ユーザマニュアル (バージョン 1.5.3 以降用)](https://img.atwikiimg.com/www8.atwiki.jp/git_jp/pub/Documentation.ja/user-manual.html)や[Gitマニュアルのリファレンス](https://git-scm.com/docs)などをご参照下さい。

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
