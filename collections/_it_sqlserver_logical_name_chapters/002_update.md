---
chapter_no: 002
chapter_id: update
chapter_title: 修正(sys.sp_updateextendedproperty)
created: 2021-01-29
updated: 2021-01-29
---
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
