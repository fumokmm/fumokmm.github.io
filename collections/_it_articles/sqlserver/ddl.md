---
title: SQL ServerのDDL
article_group_id: control-group
display_order: 10
created: 2020-10-28
updated: 2021-04-22
---


## <a name="index">目次</a>

<ul>
<li><a href="#index">INDEX</a></li>
<li><a href="#add-column">列追加</a></li>
<li><a href="#alter-column">列変更</a></li>
<li><a href="#drop-column">列削除</a></li>
<li><a href="#alter-schema">スキーマ</a></li>
<li><a href="#reference">参考</a></li>
</ul>

## <a name="index">INDEX</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-02-03" updated="2021-02-15" %}</div>
インデックス関連

<div class="code-box-syntax">
<div class="title">インデックス(nonclustered)の作成</div>
<pre>
CREATE INDEX &lt;インデックス名&gt; ON &lt;テーブル名&gt; (&lt;列&gt;);
</pre>
</div>

<div class="code-box-syntax">
<div class="title">clusteredなインデックスの作成</div>
<pre>
CREATE <em>CLUSTERED</em> INDEX &lt;インデックス名&gt; ON &lt;データベース名&gt;.&lt;スキーマ名&gt;.&lt;テーブル名&gt; (&lt;列&gt;);
</pre>
</div>
`CLUSTERED`を付けるとクラスタードなインデックスを作成できます。テーブル名の部分はデータベース・スキーマ名・テーブル名の3パート指定もできます。

<div class="code-box-syntax">
<div class="title">ユニークインデックス(nonclustered)の作成</div>
<pre>
CREATE <em>UNIQUE</em> INDEX &lt;インデックス名&gt; ON &lt;テーブル名&gt; (&lt;列1&gt; DESC, &lt;列2&gt; ASC, &lt;列3&gt; DESC);
</pre>
</div>
列定義は複数指定できます。また各列に並べ方も(ASC:昇順, DESC:降順)指定できます。

### 参考
- [(Microsoft \| Docs) CREATE INDEX (Transact-SQL)](https://docs.microsoft.com/ja-jp/sql/t-sql/statements/create-index-transact-sql?view=sql-server-ver15)

{% include goto_pagetop.html %}

## <a name="add-column">列追加</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-02-15" updated="2021-02-15" %}</div>
テーブルへ列を追加するALTER文です。

<div class="code-box-syntax">
<div class="title">構文</div>
<pre>
ALTER TABLE <em>&lt;テーブル名&gt;</em> ADD <em>&lt;カラム名&gt;</em> <em>&lt;型定義...&gt;</em>;
</pre>
</div>

### 例
以下は`User`テーブルに`Score`という名前の列(INT型で、NOT NULLでデフォルト値は0)を追加する例。
<div class="code-box">
<div class="title">列、Scoreの追加</div>
<pre>
ALTER TABLE <em>dbo.[User]</em> ADD <em>Score</em> <em>INT NOT NULL DEFAULT 0</em>;
</pre>
</div>

### 参考
- [(Microsoft \| Docs) テーブルへの列の追加 (データベース エンジン)](https://docs.microsoft.com/ja-jp/sql/relational-databases/tables/add-columns-to-a-table-database-engine?view=sql-server-ver15)
- [(Microsoft \| Docs) ALTER TABLE (Transact-SQL)](https://docs.microsoft.com/ja-jp/sql/t-sql/statements/alter-table-transact-sql?view=sql-server-ver15)

{% include goto_pagetop.html %}

## <a name="alter-column">列変更</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-04-22" updated="2021-04-22" %}</div>
テーブルの列を変更するALTER文です。

<div class="code-box-syntax">
<div class="title">構文</div>
<pre>
ALTER TABLE <em>&lt;テーブル名&gt;</em> ALTER COLUMN <em>&lt;変更する列名&gt;</em> <em>&lt;データ型&gt;</em>;
</pre>
</div>

### 例
以下は`User`テーブルの`Score`という名前の列をINT型で、NOT NULLでデフォルト値は0に変更する例。
<div class="code-box">
<div class="title">列、Scoreの変更</div>
<pre>
ALTER TABLE <em>dbo.[User]</em> ALTER COLUMN <em>Score</em> <em>INT NOT NULL DEFAULT 0</em>;
</pre>
</div>

### 参考
- [(PROJECT GROUP) テーブル定義を変更する（ALTER TABLE）](https://www.projectgroup.info/tips/SQLServer/SQL/SQL000005.html)

{% include goto_pagetop.html %}

## <a name="drop-column">列削除</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-10-28" updated="2021-04-22" %}</div>
テーブルから列を削除するALTER文です。

<div class="code-box-syntax">
<div class="title">構文</div>
<pre>
ALTER TABLE <em>&lt;テーブル名&gt;</em> DROP COLUMN <em>&lt;カラム名&gt;</em>;
</pre>
</div>

### 例
以下SQLを実行すると、`M_USER`テーブルの`EMAIL_ADDRESS`というカラムが削除されます。
<div class="code-box">
<div class="title">列、EMAIL_ADDRESSを削除</div>
<pre>
ALTER TABLE <em>M_USER</em> DROP COLUMN <em>EMAIL_ADDRESS</em>;
</pre>
</div>

### 注意事項
- テーブルから列を削除すると、列および列に含まれているすべてのデータが削除されます。
- CHECK制約がある列を削除することはできません。最初に制約を削除する必要があります。

### 参考
- [(Microsoft \| Docs) テーブルからの列の削除](https://docs.microsoft.com/ja-jp/sql/relational-databases/tables/delete-columns-from-a-table?view=sql-server-ver15)

{% include goto_pagetop.html %}

## <a name="alter-schema">スキーマ</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-04-06" updated="2021-04-22" %}</div>
スキーマ関係のALTER文です。

<div class="code-box-syntax">
<div class="title">構文</div>
<pre>
ALTER SCHEMA <em>&lt;変更前のスキーマ名&gt;</em> TRANSFER <em>&lt;変更後のスキーマ名&gt;</em>.&lt;テーブル名&gt;;
</pre>
</div>

### 例
以下SQLを実行すると、`M_USER`のスキーマを`dbo`から`newschema`に変更します。
<div class="code-box">
<div class="title">スキーマ、dboをnewschemaに変更</div>
<pre>
ALTER SCHEMA <em>dbo</em> TRANSFER <em>newschema</em>.M_USER;
</pre>
</div>

### 参考
- [(iPentec) テーブルのスキーマを変更する - SQL Server Tips](https://www.ipentec.com/document/sql-server-change-table-scheme)

{% include goto_pagetop.html %}

## <a name="reference">参考</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-04-06" updated="2021-04-22" %}</div>
- [(iPentec) テーブルのスキーマを変更する - SQL Server Tips](https://www.ipentec.com/document/sql-server-change-table-scheme)
- [(Microsoft \| Docs) ALTER TABLE (Transact-SQL)](https://docs.microsoft.com/ja-jp/sql/t-sql/statements/alter-table-transact-sql?view=sql-server-ver15)
- [(Microsoft \| Docs) テーブルからの列の削除](https://docs.microsoft.com/ja-jp/sql/relational-databases/tables/delete-columns-from-a-table?view=sql-server-ver15)
- [(Microsoft \| Docs) テーブルへの列の追加 (データベース エンジン)](https://docs.microsoft.com/ja-jp/sql/relational-databases/tables/add-columns-to-a-table-database-engine?view=sql-server-ver15)
- [(PROJECT GROUP) テーブル定義を変更する（ALTER TABLE）](https://www.projectgroup.info/tips/SQLServer/SQL/SQL000005.html)

{% include goto_pagetop.html %}

