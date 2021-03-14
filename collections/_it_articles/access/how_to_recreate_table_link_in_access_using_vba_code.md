---
title: AccessでVBAコードを使ってテーブルリンクを再作成する方法
display_order: 20
created: 2020-10-14
updated: 2020-10-15
---
{% assign chapter_list = site.it_access_how_to_recreate_table_link_in_access_using_vba_code_chapters %}

Accessでテーブルリンクを作成する場合、ローカルPCに設定したDSNを使って設定したりできますが、  
個人的に使うような用途以外で、複数人のPCで利用するようなAccessファイルを作成した場合に、  
あちらのPCにDNS設定が入っていないから動かないといったような事が起こり問題となることがあります。  
個別にDSN設定をしてもらえる場合はまだいいですが、そうでない場合、  
以下に示すようなVBAコードでDSNなしのテーブルリンク設定をすることができます。  
(SQL Serverへのテーブルリンクを想定しています)

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
