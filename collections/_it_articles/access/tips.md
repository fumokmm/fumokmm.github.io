---
title: AccessのTips
created: 2020-10-01
updated: 2020-10-14
---
ここではAccessのちょっとしたTipsをまとめておきます。

## <a name="index">目次</a>

- [Accessを開発者モードで起動する方法](#how-to-launch-access-in-developer-mode)
- [VBAコードでテーブルリンクを再作成する方法](#how-to-recreate-table-link-using-vba-code)

### <a name="how-to-launch-access-in-developer-mode">Accessを開発者モードで起動する方法</a>
{% include update_info.html created="2020-10-01" updated="2020-10-01" %}

Accessをそのまま起動するとAutoExecマクロや起動オプションが実行されてしまいます。  
そこで、`Shiftキー` を押したまま、アイコンをダブルクリックで起動することで、  
開発者モードで起動し、AutoExecマクロや起動オプションの実行を抑制できます。  
なお、`開発者モード` という言い方は俗称のようです。

#### <a name="how-to-launch-access-in-developer-mode-reference">参考</a>

- [Accessで開発者モードで起動時のみテーブルを表示状態にしたい](https://teratail.com/questions/214096)
- [【ACCESS】ACCESSを開発者モードで開く](http://blog.subnetwork.jp/?p=461)
- [Access のランタイムモードとデザインモード](https://www.itlab51.com/?p=84)
- [アクセスを開発者モードで開く方法](https://note.mokuzine.net/ms-access-open-dev-mode/)

#### <a name="how-to-recreate-table-link-using-vba-code">VBAコードでテーブルリンクを再作成する方法</a>
{% include update_info.html created="2020-10-14" updated="2020-10-14" %}

Accessでテーブルリンクを作成する場合、ローカルPCに設定したDSNを使って設定したりできますが、  
個人的に使うような用途以外で、複数人のPCで利用するようなAccessファイルを作成した場合に、  
あちらのPCにDNS設定が入っていないから動かないといったような事が起こり問題となることがあります。  
個別にDSN設定をしてもらえる場合はまだいいですが、そうでない場合、  
以下に示すようなVBAコードでDSNなしのテーブルリンク設定をすることができます。  
(SQL Serverへのテーブルリンクを想定しています)

<pre class="code">
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


- 動作概要は以下のようになります。
  - `CurrentDb.TableDefs.Delete`にて既存のテーブルリンクがある場合削除します。(テーブルリンク名はスキーマ名とテーブル名をアンダーバーで繋いだものとしています。たぶんAccess標準の動き)
  - `CurrentDb.CreateTableDef`にて、`TableDef`を作成します。
  - 作成した`TableDef`を`CurrentDb.TableDefs.Append`にて追加します。
- 作成するテーブル名は`dbo`スキーマの`Users`というテーブルを想定しています。
- `<サーバ名>`、`<データベース名>`、`<ユーザID>`、`<パスワード>`の部分はご自分の環境に置き換えて下さい。

なお、上記はユーザID/パスワード認証の例です。  
Windows認証の場合、`Connect`の部分を`Trusted_Connection=Yes`とすればOKです。

<pre class="code">
    Set p_td = CurrentDb.CreateTableDef( _
        Name:=<em>"dbo_Users"</em>, _
        Attributes:=dbAttachSavePWD, _
        SourceTableName:=<em>"dbo.Users"</em>, _
        Connect:="ODBC;DRIVER=SQL Server;SERVER=<em>&lt;サーバ名&gt;</em>;DATABASE=<em>&lt;データベース名&gt;</em>;<em class="blue">Trusted_Connection=Yes</em>" _
    )
</pre>

#### <a name="how-to-recreate-table-link-using-vba-code-reference">参考</a>

- [(MSDN) Access でリンクテーブルに対して SQL Server への DSN レス接続を作成する方法](https://docs.microsoft.com/ja-jp/office/troubleshoot/access/create-dsn-less-connection-linkted-table)
- [(「分かりそう」で「分からない」でも「分かった」気になれるIT用語辞典) DSN【DB】](https://wa3.i-3-i.info/word12383.html)