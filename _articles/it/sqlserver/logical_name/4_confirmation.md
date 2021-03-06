---
chapter_no: 4
chapter_id: confirmation
chapter_title: 確認方法
created: 2021-01-29
updated: 2021-01-29
---
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
