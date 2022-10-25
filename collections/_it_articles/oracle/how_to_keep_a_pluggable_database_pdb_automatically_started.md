---
title: Oracleでプラガブルデータベース(PDB)を自動起動させておく方法
article_group_id: tips-group
display_order: 20
created: 2022-10-25
updated: 2022-10-25
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#オープン状態の確認(show pdbs)">オープン状態の確認(show pdbs)</a></li>
<li><a href="#停止している場合">停止している場合</a></li>
<li><a href="#自動起動を設定(save state)">自動起動を設定(save state)</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-25" updated="2022-10-25" %}</div>
Oracleではバージョン12cから内部構造が大きく変わったようです。  
こちらは、Oracleでプラガブルデータベース(PDB)を自動起動させておく方法のメモです。

{% include goto_pagetop.html %}

* * *
## <a name="オープン状態の確認(show pdbs)">オープン状態の確認(show pdbs)</a><a class="heading-anchor-permalink" href="#オープン状態の確認(show pdbs)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-25" updated="2022-10-25" %}</div>
自動起動を設定するには、対象のプラガブルデータベース(PDB)がオープン状態になっている必要があります。  
ですので、まず`show pdbs`コマンドで、`OPEN MODE`が`READ WRITE`になっていることを確認します。

<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
<em class="command">SQL&gt;</em> show pdbs

  CON_ID PDB_NAME   OPEN MODE    RESTRICTED
-------- ---------- ------------ ------------
       2 PDB$SEED   READ ONLY    NO
       3 PDB1       <em>READ WRITE</em>   YES
       4 PDB2       <em>READ WRITE</em>   YES
       5 PDB3       MOUNT        NO
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="停止している場合">停止している場合</a><a class="heading-anchor-permalink" href="#停止している場合">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-25" updated="2022-10-25" %}</div>
`OPEN MODE`が`MOUNT`になっている場合はプラガブルデータベース(PDB)が停止しています。  
以下のプラガブルデータベース(PDB)起動コマンドを実行してください。

<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
<em class="command">SQL&gt;</em> alter pluggable database <em>&lt;PDB名&gt;</em> open;
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="自動起動を設定(save state)">自動起動を設定(save state)</a><a class="heading-anchor-permalink" href="#自動起動を設定(save state)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-25" updated="2022-10-25" %}</div>
### オープンしている全てのプラガブルデータベース(PDB)を対象として自動起動を設定
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
<em class="command">SQL&gt;</em> alter pluggable database <em class="blue">all</em> <em>save state</em>;
</pre>
</div>

### 個別に自動起動を設定
プラガブルデータベース(PDB)名をカンマ区切りで指定します。
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
<em class="command">SQL&gt;</em> alter pluggable database <em class="blue">pdb1, pdb2, ...</em> <em>save state</em>;
</pre>
</div>

### 自動起動が有効になったか確認
- コンテナデータベース(CDB)を再起動します。
- [オープン状態の確認(show pdbs)](#オープン状態の確認(show pdbs))で`OPEN MODE`が`READ WRITE`になっていることを確認します。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-25" updated="2022-10-25" %}</div>
### 関連メモ
- [Oracleでプラガブルデータベース(PDB)に接続する方法]({% link _it_articles/oracle/how_to_connect_to_a_pluggable_database_pdb.md %})

### 参考サイト
- [(Oracle使いのネタ帳。) PDB自動起動の確認と設定方法](https://www.sql-dbtips.com/multitenant/save-state/)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
