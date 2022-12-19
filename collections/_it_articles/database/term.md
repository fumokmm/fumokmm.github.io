---
title: データベースの用語
article_group_id: basis-group
display_order: 10
created: 2022-12-19
updated: 2022-12-19
---
こちらはデータベースの用語のメモになります。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#C">C</a></li>
<li><a href="#D">D</a></li>
</ul>

* * *
## <a name="C">C</a><a class="heading-anchor-permalink" href="#C">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-02-25" updated="2021-05-29" %}</div>
<dl>
  {% include article_parts/term_dt.html type="it" title="CRUD (クラッド)" %}
  <dd markdown="span">システムに必要な4つの主要機能である「Create(生成)」「Read(読み取り)」「Update(更新)」「Delete(削除)」の頭文字を並べた用語。  
  データベースでは、[DML]({% link _it_articles/other/term.md %}#DML【Data Manipulation Language】)のCREATE, SELECT, UPDATE, DELETEに、HTTPではPUT, GET, PUT, DELETEに対応する。  
  各機能ごとのCRUDを一覧化した、CRUD図などがある。
  {% include update_info_inline.html created="2021-02-25" updated="2021-02-25" %}
  </dd>
</dl>

### 関連用語
- [DML【Data Manipulation Language】]({% link _it_articles/other/term.md %}#DML【Data Manipulation Language】)

### 参考
- [(Wikipedia) Create, read, update and delete](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete)
- [(「分かりそう」で「分からない」でも「分かった」気になれるIT用語辞典)  クラッド (CRUD)](https://wa3.i-3-i.info/word123.html)

{% include goto_pagetop.html %}

* * *
## <a name="D">D</a><a class="heading-anchor-permalink" href="#D">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-02-25" updated="2021-08-27" %}</div>
<dl>
  {% include article_parts/term_dt.html category_id="it" title="DCL【Data Control Language】" %}
  <dd markdown="span">BEGIN、COMMIT、ROLLBACKなどトランザクションの制御を行うためのコマンド。
  {% include update_info_inline.html created="2021-02-25" updated="2021-02-25" %}
  </dd>
</dl>

### 参考
- [SQLの種類(DDL、DML、DCL)](https://morizyun.github.io/database/sql-ddl-dml-dcl.html)

<dl>
  {% include article_parts/term_dt.html category_id="it" title="DDL【Data Definition Language】" %}
  <dd markdown="span">CREATE、DROP、ALTERなどデータベースオブジェクトの生成や削除や変更を行うコマンド。
  {% include update_info_inline.html created="2021-02-25" updated="2021-02-25" %}
  </dd>
</dl>

### 参考
- [SQLの種類(DDL、DML、DCL)](https://morizyun.github.io/database/sql-ddl-dml-dcl.html)

<dl>
  {% include article_parts/term_dt.html category_id="it" title="DML【Data Manipulation Language】" %}
  <dd markdown="span">SELECT、INSERT、UPDATE、DELETEなどテーブルに対するデータの取得、追加、更新、削除を行うコマンド。  
  いわゆる[CRUD]({% link _it_articles/other/term.md %}#CRUD (クラッド))に対応。
  {% include update_info_inline.html created="2021-02-25" updated="2021-02-25" %}</dd>
</dl>

### 参考
- [SQLの種類(DDL、DML、DCL)](https://morizyun.github.io/database/sql-ddl-dml-dcl.html)

### 関連用語
- [CRUD (クラッド)]({% link _it_articles/other/term.md %}#CRUD (クラッド))

<dl>
  {% include article_parts/term_dt.html category_id="it" title="DX【Digital Transformation】" %}
  <dd markdown="span">デジタルトランスフォーメーション）の略語。  
  企業がデジタル技術を活用し、ビジネスモデルや企業そのものを変革していくことを意味する。
  {% include update_info_inline.html created="2021-08-27" updated="2021-08-27" %}</dd>
</dl>

### 参考
- [(まもりの種) IT化とDXの違いは？DXの前提となる電子化の重要性とは？](https://www.mamoru-kun.com/tips/it-dx/)


{% include goto_pagetop.html %}

{% include articles_common_script.html %}
