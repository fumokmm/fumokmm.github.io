---
title: AccessでVBAコードを使ってテーブルリンクを再作成する方法
display_order: 20
created: 2020-10-14
updated: 2020-10-15
---
Accessでテーブルリンクを作成する場合、ローカルPCに設定したDSNを使って設定したりできますが、  
個人的に使うような用途以外で、複数人のPCで利用するようなAccessファイルを作成した場合に、  
あちらのPCにDNS設定が入っていないから動かないといったような事が起こり問題となることがあります。  
個別にDSN設定をしてもらえる場合はまだいいですが、そうでない場合、  
以下に示すようなVBAコードでDSNなしのテーブルリンク設定をすることができます。  
(SQL Serverへのテーブルリンクを想定しています)

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#recreate-table-link">テーブルリンク再作成</a></li>
<li><a href="#reference">参考</a></li>
</ul>

* * *
## <a name="recreate-table-link">テーブルリンク再作成</a><a class="heading-anchor-permalink" href="#recreate-table-link">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-10-14" updated="2020-10-15" %}</div>
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

{% include goto_pagetop.html %}

* * *
## <a name="reference">参考</a><a class="heading-anchor-permalink" href="#reference">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-10-14" updated="2020-10-15" %}</div>
- [(Microsoft Docs) Access でリンクテーブルに対して SQL Server への DSN レス接続を作成する方法](https://docs.microsoft.com/ja-jp/office/troubleshoot/access/create-dsn-less-connection-linkted-table)
- [(「分かりそう」で「分からない」でも「分かった」気になれるIT用語辞典) DSN【DB】](https://wa3.i-3-i.info/word12383.html)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
