---
title: PostgreSQLで処理結果のみ取得する(DUAL表)
article_group_id: tips-group
display_order: 30
created: 2022-10-19
updated: 2022-10-19
---
{% capture link_to_it_oracle %}{% link _it_articles/oracle/index.md %}{% endcapture %}{% assign link_to_it_oracle = link_to_it_oracle | remove: 'index' %}
## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#取得方法">取得方法</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-19" updated="2022-10-19" %}</div>
- SQLの動作確認をする時にテーブルから取得するものが何もない場合の書き方です。
- いわゆる[Oracle]({{link_to_it_oracle}})でいうところの`DUAL表`のような書き方です。

{% include goto_pagetop.html %}

* * *
## <a name="取得方法">取得方法</a><a class="heading-anchor-permalink" href="#取得方法">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-19" updated="2022-10-19" %}</div>
### select句に指定する
単純に`select句`に取得したいものを指定します。  
`from句`以降は省略してOKです。
<div class="code-box-syntax no-title">
<div class="copy-button">Copy</div>
<pre>
select <em>&lt;取得したいもの&gt;</em>;
</pre>
</div>

<div class="code-box">
<div class="title">例</div>
<div class="copy-button">Copy</div>
<pre>
select <em>'1';</em>
select <em>'aa' as col1, 'BB' as col2, '123' as col3;</em>
select <em>now();</em>
select <em>current_date;</em>
select <em>cast(1234.56 as integer);</em>
</pre>
</div>

### from句に指定する(関数や定数)
関数や定数などは`from句`に指定でも取得できます。
<div class="code-box">
<div class="title">例</div>
<div class="copy-button">Copy</div>
<pre>
select * <em class="blue">from</em> <em>now();</em>
select * <em class="blue">from</em> <em>current_date;</em>
select * <em class="blue">from</em> <em>cast(1234.56 as integer);</em>
</pre>
</div>
- 敢えてこの使い方をする機会は少なそうな気はしますが。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-19" updated="2022-10-19" %}</div>
### 参考サイト
- [(PostgresWeb) PostgreSQLでのdual表の使い方](https://postgresweb.com/post-6054)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
