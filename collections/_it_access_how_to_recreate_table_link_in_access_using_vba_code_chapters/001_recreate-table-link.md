---
chapter_no: 001
chapter_id: recreate-table-link
chapter_title: テーブルリンク再作成
created: 2020-10-14
updated: 2020-10-15
---
<div class="code-box">
<div class="title">テーブルリンク再作成</div>
<pre>
Sub テーブルリンク再作成()
    On Error Resume Next
    
    ' テーブル定義
    Dim p_td As TableDef
    ' 既にリンクが存在する場合は削除する (存在しない場合のエラーは On Error Resume Nextにてスキップ)
    CurrentDb.TableDefs.Delete <em>"dbo_Users"</em>
    ' 再設定用のテーブル定義を作成
    Set p_td = CurrentDb.CreateTableDef( _
        Name:=<em>"dbo_Users"</em>, _
        Attributes:=dbAttachSavePWD, _
        SourceTableName:=<em>"dbo.Users"</em>, _
        Connect:="ODBC;DRIVER=SQL Server;SERVER=<em>&lt;サーバ名&gt;</em>;DATABASE=<em>&lt;データベース名&gt;</em>;UID=<em>&lt;ユーザID&gt;</em>;PWD=<em>&lt;パスワード&gt;</em>" _
    )
    ' 再設定
    CurrentDb.TableDefs.Append p_td
End Sub
</pre>
</div>

- 動作概要は以下のようになります。
  - `CurrentDb.TableDefs.Delete`にて既存のテーブルリンクがある場合削除します。(テーブルリンク名はスキーマ名とテーブル名をアンダーバーで繋いだものとしています。たぶんAccess標準の動き)
  - `CurrentDb.CreateTableDef`にて、`TableDef`を作成します。
  - 作成した`TableDef`を`CurrentDb.TableDefs.Append`にて追加します。
- 作成するテーブル名は`dbo`スキーマの`Users`というテーブルを想定しています。
- `<サーバ名>`、`<データベース名>`、`<ユーザID>`、`<パスワード>`の部分はご自分の環境に置き換えて下さい。

なお、上記はユーザID/パスワード認証の例です。  
Windows認証の場合、`Connect`の部分を`Trusted_Connection=Yes`とすればOKです。

<div class="code-box no-title">
<pre>
Set p_td = CurrentDb.CreateTableDef( _
    Name:=<em>"dbo_Users"</em>, _
    Attributes:=dbAttachSavePWD, _
    SourceTableName:=<em>"dbo.Users"</em>, _
    Connect:="ODBC;DRIVER=SQL Server;SERVER=<em>&lt;サーバ名&gt;</em>;DATABASE=<em>&lt;データベース名&gt;</em>;<em class="blue">Trusted_Connection=Yes</em>" _
)
</pre>
</div>