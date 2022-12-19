---
title: データベースの用語
article_group_id: basis-group
display_order: 10
created: 2021-02-25
updated: 2022-12-19
---
こちらはデータベースの用語のメモになります。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#CRUD (クラッド)">CRUD (クラッド)</a></li>
<li><a href="#DCL【Data Control Language】">DCL【Data Control Language】</a></li>
<li><a href="#DDL【Data Definition Language】">DDL【Data Definition Language】</a></li>
<li><a href="#DML【Data Manipulation Language】">DML【Data Manipulation Language】</a></li>
</ul>

* * *
## <a name="CRUD (クラッド)">CRUD (クラッド)</a><a class="heading-anchor-permalink" href="#CRUD (クラッド)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-02-25" updated="2021-02-25" %}</div>
システムに必要な4つの主要機能である「Create(生成)」「Read(読み取り)」「Update(更新)」「Delete(削除)」の頭文字を並べた用語。  
データベースでは、[DML](#DML【Data Manipulation Language】)のCREATE, SELECT, UPDATE, DELETEに、HTTPではPUT, GET, PUT, DELETEに対応する。  
各機能ごとのCRUDを一覧化した、CRUD図などがある。

### 関連用語
- [DML【Data Manipulation Language】](#DML【Data Manipulation Language】)

### 参考
- [(Wikipedia) Create, read, update and delete](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete)
- [(「分かりそう」で「分からない」でも「分かった」気になれるIT用語辞典)  クラッド (CRUD)](https://wa3.i-3-i.info/word123.html)

{% include goto_pagetop.html %}

* * *
## <a name="DCL【Data Control Language】">DCL【Data Control Language】</a><a class="heading-anchor-permalink" href="#DCL【Data Control Language】">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-02-25" updated="2021-02-25" %}</div>
BEGIN、COMMIT、ROLLBACKなどトランザクションの制御を行うためのコマンド。

### 参考
- [SQLの種類(DDL、DML、DCL)](https://morizyun.github.io/database/sql-ddl-dml-dcl.html)

{% include goto_pagetop.html %}

* * *
## <a name="DDL【Data Definition Language】">DDL【Data Definition Language】</a><a class="heading-anchor-permalink" href="#DDL【Data Definition Language】">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-02-25" updated="2021-02-25" %}</div>
CREATE、DROP、ALTERなどデータベースオブジェクトの生成や削除や変更を行うコマンド。

### 参考
- [SQLの種類(DDL、DML、DCL)](https://morizyun.github.io/database/sql-ddl-dml-dcl.html)

{% include goto_pagetop.html %}

* * *
## <a name="DML【Data Manipulation Language】">DML【Data Manipulation Language】</a><a class="heading-anchor-permalink" href="#DML【Data Manipulation Language】">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-02-25" updated="2021-02-25" %}</div>
SELECT、INSERT、UPDATE、DELETEなどテーブルに対するデータの取得、追加、更新、削除を行うコマンド。  
いわゆる[CRUD](#CRUD (クラッド))に対応。

### 参考
- [SQLの種類(DDL、DML、DCL)](https://morizyun.github.io/database/sql-ddl-dml-dcl.html)

### 関連用語
- [CRUD (クラッド)](#CRUD (クラッド))


{% include goto_pagetop.html %}

{% include articles_common_script.html %}
