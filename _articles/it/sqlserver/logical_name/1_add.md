---
chapter_no: 1
chapter_id: add
chapter_title: 追加(sys.sp_addextendedproperty)
created: 2021-01-29
updated: 2021-01-29
---
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
