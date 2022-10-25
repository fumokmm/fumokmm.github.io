---
title: Oracleでプラガブルデータベース(PDB)に接続する方法
article_group_id: tips-group
display_order: 10
created: 2022-10-25
updated: 2022-10-25
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#コンテナデータベース(CDB)にログインしてから接続">コンテナデータベース(CDB)にログインしてから接続</a></li>
<li><a href="#パスワード認証で接続">パスワード認証で接続</a></li>
<li><a href="#現在接続中のコンテナを確認">現在接続中のコンテナを確認</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-25" updated="2022-10-25" %}</div>
Oracleではバージョン12cから内部構造が大きく変わったようです。  
こちらは、Oracleでプラガブルデータベース(PDB)に接続する方法のメモです。

{% include goto_pagetop.html %}

* * *
## <a name="コンテナデータベース(CDB)にログインしてから接続">コンテナデータベース(CDB)にログインしてから接続</a><a class="heading-anchor-permalink" href="#コンテナデータベース(CDB)にログインしてから接続">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-25" updated="2022-10-25" %}</div>
### コンテナデータベース(CDB)にログイン
まずコンテナデータベース(CDB)にログインします。
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
$ sqlplus /nolog
<em class="command">SQL&gt;</em> connect / as sysdba
</pre>
</div>

### ALTER SESSIONでコンテナを接続先を切り替え
次にALTER SESSIONでコンテナの接続先をプラガブルデータベース(PDB)に切り替えます。
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
<em class="command">SQL&gt;</em> select name,open_mode from v$pdbs;
<em class="command">SQL&gt;</em> alter session set container=<em>&lt;接続するプラガブルデータベース名&gt;</em>;
</pre>
</div>

### プラガブルデータベースが起動していなかった場合
- [こちら]({% link _it_articles/oracle/how_to_keep_a_pluggable_database_pdb_automatically_started.md %}#停止している場合)の「停止している場合」を参考に起動させておいてください。

### 切り替わったか確認
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
<em class="command">SQL&gt;</em> show con_name

CON_NAME
------------------------------
<em>&lt;接続しているプラガブルデータベース名&gt;</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="パスワード認証で接続">パスワード認証で接続</a><a class="heading-anchor-permalink" href="#パスワード認証で接続">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-25" updated="2022-10-25" %}</div>
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
$ sqlplus &lt;ユーザ名&gt;/&lt;パスワード&gt;@&lt;プラガブルDBのコンテナ名&gt;
</pre>
</div>
- プラガブルDBには基本的にはパスワード認証で接続するらしいです。

{% include goto_pagetop.html %}

* * *
## <a name="現在接続中のコンテナを確認">現在接続中のコンテナを確認</a><a class="heading-anchor-permalink" href="#現在接続中のコンテナを確認">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-25" updated="2022-10-25" %}</div>
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
<em class="command">$ SQL&gt;</em> show con_name

CON_NAME
------------------------------
<em>(コンテナ名)</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-25" updated="2022-10-25" %}</div>
### 関連メモ
- [Oracleでプラガブルデータベース(PDB)を自動起動させておく方法]({% link _it_articles/oracle/how_to_keep_a_pluggable_database_pdb_automatically_started.md %})

### 参考サイト
- [(データベースひとりでできるもん) CDB/PDBへの接続](https://xn--w8j8bac3czf5bl7e.com/2018/06/14/cdbpdb%E3%81%B8%E3%81%AE%E6%8E%A5%E7%B6%9A/)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
