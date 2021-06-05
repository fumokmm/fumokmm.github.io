---
title: VBAでデータベース操作
display_order: 40
created: 2021-02-08
updated: 2021-02-09
---
こちらはVBAでデータベース操作を行う方法のメモです。  

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#read">データの読み取り</a></li>
<li><a href="#related">関連メモ</a></li>
</ul>

* * *
## <a name="read">データの読み取り</a><a class="heading-anchor-permalink" href="#read">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-02-08" updated="2021-02-09" %}</div>
ADODBを利用してデータの読み取りを行うサンプルです。  
以下の参照設定が必要です。
- Microsoft ActiveX Data Objects 6.1 Library
- Microsoft ActiveX Data Objects Recordset 6.0 Library
<div class="code-box">
<div class="title">SQL Serverに接続しデータを読み取る</div>
<pre>
Dim p_conn As ADODB.Connection
Set p_conn = New ADODB.Connection

Dim p_connectionString As String
p_connectionString = "Driver={SQL Server};Server=<em>MUNCHKIN</em>;Uid=<em>sa</em>;Pwd=<em>sa</em>;Database=<em>Experiment</em>;"
p_conn.Open p_connectionString

Dim p_sql As String
p_sql = "SELECT * FROM [dbo].[User]"

Dim p_rs As ADODB.Recordset
Set p_rs = New ADODB.Recordset
p_rs.Open p_sql, p_conn, CursorTypeEnum.adOpenForwardOnly, LockTypeEnum.adLockReadOnly, CommandTypeEnum.adCmdText

Do Until p_rs.EOF
    Debug.Print p_rs.Fields!ID
    Debug.Print p_rs.Fields("Name")
    Debug.Print p_rs.Fields("Age")
    Debug.Print p_rs.Fields("BillingAmount")
    p_rs.MoveNext
Loop
p_rs.Close

p_conn.Close
</pre>
</div>

### ポイント
- 接続文字列部分はSQL Server用のユーザ指定版となります。
  - 強調部分は適宜変更して下さい。(接続文字列部分)
- ADODB.Recordsetで値を取得する構文として `.Fields!項目名` っていうのもあるみたいです。
- SQLを発行した後は、Do Until p_rs.EOF ～～ p_rs.MoveNext Loop はテンプレです。
- オープンしたレコードセットとコネクションのクローズは忘れずに

### 参考
- [(Ateitexe) VBAで参照設定をしないでADOを使ってAccessDBへ接続する](https://ateitexe.com/vba-ado-not-reference/)
- [(Excelの神髄) ADO(ActiveX Data Objects)の使い方の要点](https://excel-ubara.com/excelvba4/EXCEL273.html)
- [Microsoft SQL Server ODBC Driver connection strings](https://www.connectionstrings.com/microsoft-sql-server-odbc-driver/)
- [(MyRecord) Excel VBA ADOを使用して外部データベースのレコードを参照する](https://kosapi.com/post-3765/#Recordset.Open)
- [(ExcelWork.info) データベース（SQL Server）に接続する（ADO）](https://excelwork.info/excel/databasesqlserver/)
- [(Excelでお仕事！) ADOでデータを取得する。](http://www.asahi-net.or.jp/~ef2o-inue/vba_o/sub05_130_030.html)
- [(Motohiro's Home Page) VB ADO 操作](http://donijan.com/web-g/donijan.com/public_html/motohiro/manual/vb/ADO.htm)

{% include goto_pagetop.html %}

* * *
## <a name="related">関連メモ</a><a class="heading-anchor-permalink" href="#related">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-02-09" updated="2021-02-09" %}</div>
### 他言語でのデータベース操作
- [Javaでデータベース操作]({% link _it_articles/java/database_control.md %})

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
