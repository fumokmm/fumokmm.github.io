---
title: SQL Serverでテーブル論理名とか列論理名を指定する方法
article_group_id: control-group
display_order: 50
created: 2021-01-29
updated: 2021-01-29
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#add">追加(sys.sp_addextendedproperty)</a></li>
<li><a href="#update">修正(sys.sp_updateextendedproperty)</a></li>
<li><a href="#drop">削除(sys.sp_dropextendedproperty)</a></li>
<li><a href="#confirmation">確認方法</a></li>
<li><a href="#supplement">補足</a></li>
<li><a href="#reference">参考</a></li>
</ul>

* * *
## <a name="add">追加(sys.sp_addextendedproperty)</a><a class="heading-anchor-permalink" href="#add">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-01-29" updated="2021-01-29" %}</div>
テーブルや列に論理名を追加するには、sys.sp_addextendedpropertyを使います。

### テーブルの論理名を追加
<div class="code-box">
<div class="title">形式(列論理名を追加)</div>
<pre>
EXEC sys.sp_<em>add</em>extendedproperty @name=N'MS_Description' <em class="comment">-- ←ここのMS_Descriptionは固定</em>
                              , @value=N'<em class="blue">&lt;テーブル論理名&gt;</em>'
                              , @level0type=N'SCHEMA'
                              , @level0name=N'<em class="blue">&lt;スキーマ名&gt;</em>'
                              , @level1type=N'TABLE'
                              , @level1name=N'<em class="blue">&lt;テーブル名&gt;</em>'
</pre>
</div>
- 論理名は拡張プロパティの`MS_Description`として指定します。
  - `@name`で`MS_Description`を指定します。(ここは固定)
  - `@value`で追加したいテーブル論理名を指定します。
- 論理名をどこに設定するかを`@levelXtype`と`@levelXname`で指定し、`type`と`name`は対になっています。
  - `type`の方の値には`SCHEMA`や`TABLE`や`COLUMN`などの固定値が入ります。
  - `name`の方の値には実際のスキーマ名やテーブル名、列名などが入ります。
  - テーブル指定する場合は、`level0`にスキーマ名を、`level1`にテーブル名を指定します。

### 列の論理名を追加
<div class="code-box">
<div class="title">形式(列論理名を追加)</div>
<pre>
EXEC sys.sp_<em>add</em>extendedproperty @name=N'MS_Description' <em class="comment">-- ←ここのMS_Descriptionは固定</em>
                              , @value=N'<em class="blue">&lt;列論理名&gt;</em>'
                              , @level0type=N'SCHEMA'
                              , @level0name=N'<em class="blue">&lt;スキーマ名&gt;</em>'
                              , @level1type=N'TABLE'
                              , @level1name=N'<em class="blue">&lt;テーブル名&gt;</em>'
                              , @level2type=N'COLUMN'
                              , @level2name=N'<em class="blue">&lt;列名&gt;</em>'
</pre>
</div>
- 論理名は拡張プロパティの`MS_Description`として指定します。
  - `@name`で`MS_Description`を指定します。(ここは固定)
  - `@value`で追加したい列論理名を指定します。
- 論理名をどこに設定するかを`@levelXtype`と`@levelXname`で指定し、`type`と`name`は対になっています。
  - `type`の方の値には`SCHEMA`や`TABLE`や`COLUMN`などの固定値が入ります。
  - `name`の方の値には実際のスキーマ名やテーブル名、列名などが入ります。
  - 列指定する場合は、`level0`にスキーマ名を、`level1`にテーブル名、`level2`に列名を指定します。

### 使用例
<div class="code-box">
<div class="title">例</div>
<pre>
EXEC sys.sp_<em>add</em>extendedproperty @name=N'MS_Description'
                              , @value=N'ユーザマスタ'
                              , @level0type=N'SCHEMA'
                              , @level0name=N'<em class="blue">dbo</em>'
                              , @level1type=N'TABLE'
                              , @level1name=N'<em class="blue">User</em>'

EXEC sys.sp_<em>add</em>extendedproperty @name=N'MS_Description'
                              , @value=N'課金額'
                              , @level0type=N'SCHEMA'
                              , @level0name=N'<em class="blue">dbo</em>'
                              , @level1type=N'TABLE'
                              , @level1name=N'<em class="blue">User</em>'
                              , @level2type=N'COLUMN'
                              , @level2name=N'<em class="blue">BillingAmount</em>'
</pre>
</div>

- 上記例は、`dbo`というスキーマの、`User`というテーブルに「ユーザマスタ」という論理名を、さらにそのユーザマスタの`BillingAmount`という項目に、論理名として「課金額」を指定しているものです。

{% include goto_pagetop.html %}

* * *
## <a name="update">修正(sys.sp_updateextendedproperty)</a><a class="heading-anchor-permalink" href="#update">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-01-29" updated="2021-01-29" %}</div>
テーブルや列に論理名を修正するには、sys.sp_updateextendedpropertyを使います。

### テーブルの論理名を修正
<div class="code-box">
<div class="title">形式(列論理名を修正)</div>
<pre>
EXEC sys.sp_<em>update</em>extendedproperty @name=N'MS_Description' <em class="comment">-- ←ここのMS_Descriptionは固定</em>
                              , @value=N'<em class="blue">&lt;テーブル論理名&gt;</em>'
                              , @level0type=N'SCHEMA'
                              , @level0name=N'<em class="blue">&lt;スキーマ名&gt;</em>'
                              , @level1type=N'TABLE'
                              , @level1name=N'<em class="blue">&lt;テーブル名&gt;</em>'
</pre>
</div>
- 論理名は拡張プロパティの`MS_Description`として指定します。
  - `@name`で`MS_Description`を指定します。(ここは固定)
  - `@value`で修正したいテーブル論理名を指定します。
- 論理名をどこに設定するかを`@levelXtype`と`@levelXname`で指定し、`type`と`name`は対になっています。
  - `type`の方の値には`SCHEMA`や`TABLE`や`COLUMN`などの固定値が入ります。
  - `name`の方の値には実際のスキーマ名やテーブル名、列名などが入ります。
  - テーブル指定する場合は、`level0`にスキーマ名を、`level1`にテーブル名を指定します。

### 列の論理名を修正
<div class="code-box">
<div class="title">形式(列論理名を修正)</div>
<pre>
EXEC sys.sp_<em>update</em>extendedproperty @name=N'MS_Description' <em class="comment">-- ←ここのMS_Descriptionは固定</em>
                              , @value=N'<em class="blue">&lt;列論理名&gt;</em>'
                              , @level0type=N'SCHEMA'
                              , @level0name=N'<em class="blue">&lt;スキーマ名&gt;</em>'
                              , @level1type=N'TABLE'
                              , @level1name=N'<em class="blue">&lt;テーブル名&gt;</em>'
                              , @level2type=N'COLUMN'
                              , @level2name=N'<em class="blue">&lt;列名&gt;</em>'
</pre>
</div>
- 論理名は拡張プロパティの`MS_Description`として指定します。
  - `@name`で`MS_Description`を指定します。(ここは固定)
  - `@value`で修正したい列論理名を指定します。
- 論理名をどこに設定するかを`@levelXtype`と`@levelXname`で指定し、`type`と`name`は対になっています。
  - `type`の方の値には`SCHEMA`や`TABLE`や`COLUMN`などの固定値が入ります。
  - `name`の方の値には実際のスキーマ名やテーブル名、列名などが入ります。
  - 列指定する場合は、`level0`にスキーマ名を、`level1`にテーブル名、`level2`に列名を指定します。

{% include goto_pagetop.html %}

* * *
## <a name="drop">削除(sys.sp_dropextendedproperty)</a><a class="heading-anchor-permalink" href="#drop">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-01-29" updated="2021-01-29" %}</div>
テーブルや列に論理名を削除するには、sys.sp_dropextendedpropertyを使います。  
追加、修正と違うのは、`@value`が指定できないことくらいです。

### テーブルの論理名を削除
<div class="code-box">
<div class="title">形式(列論理名を削除)</div>
<pre>
EXEC sys.sp_<em>drop</em>extendedproperty @name=N'MS_Description' <em class="comment">-- ←ここのMS_Descriptionは固定</em>
                              , @level0type=N'SCHEMA'
                              , @level0name=N'<em class="blue">&lt;スキーマ名&gt;</em>'
                              , @level1type=N'TABLE'
                              , @level1name=N'<em class="blue">&lt;テーブル名&gt;</em>'
</pre>
</div>
- 論理名は拡張プロパティの`MS_Description`として指定します。
  - `@name`で`MS_Description`を指定します。(ここは固定)
- 論理名をどこに設定するかを`@levelXtype`と`@levelXname`で指定し、`type`と`name`は対になっています。
  - `type`の方の値には`SCHEMA`や`TABLE`や`COLUMN`などの固定値が入ります。
  - `name`の方の値には実際のスキーマ名やテーブル名、列名などが入ります。
  - テーブル指定する場合は、`level0`にスキーマ名を、`level1`にテーブル名を指定します。

### 列の論理名を削除
<div class="code-box">
<div class="title">形式(列論理名を削除)</div>
<pre>
EXEC sys.sp_<em>drop</em>extendedproperty @name=N'MS_Description' <em class="comment">-- ←ここのMS_Descriptionは固定</em>
                              , @level0type=N'SCHEMA'
                              , @level0name=N'<em class="blue">&lt;スキーマ名&gt;</em>'
                              , @level1type=N'TABLE'
                              , @level1name=N'<em class="blue">&lt;テーブル名&gt;</em>'
                              , @level2type=N'COLUMN'
                              , @level2name=N'<em class="blue">&lt;列名&gt;</em>'
</pre>
</div>
- 論理名は拡張プロパティの`MS_Description`として指定します。
  - `@name`で`MS_Description`を指定します。(ここは固定)
- 論理名をどこに設定するかを`@levelXtype`と`@levelXname`で指定し、`type`と`name`は対になっています。
  - `type`の方の値には`SCHEMA`や`TABLE`や`COLUMN`などの固定値が入ります。
  - `name`の方の値には実際のスキーマ名やテーブル名、列名などが入ります。
  - 列指定する場合は、`level0`にスキーマ名を、`level1`にテーブル名、`level2`に列名を指定します。

{% include goto_pagetop.html %}

* * *
## <a name="confirmation">確認方法</a><a class="heading-anchor-permalink" href="#confirmation">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-01-29" updated="2021-01-29" %}</div>
### SQLで確認する場合

<div class="code-box">
<div class="title">table_info.sql</div>
<pre>
select
    S.name as スキーマ名,
	T.name as テーブル物理名,
	EP_t.value as テーブル論理名,
	C.column_id as 列番号,
	C.name as 列物理名,
	EP_c.value as 列論理名
from
    sys.schemas S
	inner join
    sys.tables T on T.schema_id = S.schema_id
	inner join
    sys.columns C on C.object_id = T.object_id
    left join
	sys.extended_properties EP_t on EP_t.major_id = T.object_id
	                            and EP_t.minor_id = 0 -- マイナーID=0がテーブルの情報 
	                            and EP_t.name = 'MS_Description'
    left join
    sys.extended_properties EP_c on EP_c.major_id = C.object_id
	                            and EP_c.minor_id = C.column_id
	                            and EP_c.name = 'MS_Description'
where
	S.name = '&lt;スキーマ名&gt;' and
	T.name = '&lt;テーブル名&gt;'
order by
	C.column_id
</pre>
</div>

### SQL Server Management Studioで確認する場合

テーブルのプロパティを開き、拡張プロパティでプロパティ「MS_Description」として設定されているので、そこで確認できます。
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20210129/20210129183541.png)

テーブルを「デザイン」で開き、列のプロパティを表示すると下の方に「説明」という項目がありますので、そこで確認できます。
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20210129/20210129183546.png)

{% include goto_pagetop.html %}

* * *
## <a name="supplement">補足</a><a class="heading-anchor-permalink" href="#supplement">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-01-29" updated="2021-01-29" %}</div>
今回ご紹介したSQL内に出てくる文字列部分の `N'xxx'` となっているのはUnicode文字列ですよという意味です。  
古い内容ですが、[ここ](https://oshiete.goo.ne.jp/qa/280266.html)などの話が参考になります。

{% include goto_pagetop.html %}

* * *
## <a name="reference">参考</a><a class="heading-anchor-permalink" href="#reference">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-01-29" updated="2021-01-29" %}</div>
- [(PROJECT GROUP) テーブルの列にコメントを追加・修正・削除・取得する](https://www.projectgroup.info/tips/SQLServer/SQL/SQL000035.html)
- [(SQL Docs) sp_addextendedproperty (Transact-SQL)](https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sp-addextendedproperty-transact-sql?view=sql-server-ver15)
- [(SQL Docs) sp_updateextendedproperty (Transact-SQL)](https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sp-updateextendedproperty-transact-sql?view=sql-server-ver15)
- [(SQL Docs) sp_dropextendedproperty (Transact-SQL)](https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sp-dropextendedproperty-transact-sql?view=sql-server-ver15)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
