---
title: AccessでDAOを使ってデータの読み取り
display_order: 30
created: 2021-08-31
updated: 2021-08-31
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#DAOとは">DAOとは</a></li>
<li><a href="#データの読み取り">データの読み取り</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="DAOとは">DAOとは</a><a class="heading-anchor-permalink" href="#DAOとは">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-31" updated="2021-08-31" %}</div>
### DAOとは
- `DAO`は`Data Access Object`の略でAccessのデータベースエンジンである`jetデータベースエンジン`に直接接続してデータを操作することのできるオブジェクトライブラリです。

### ADOとDAOの違い
- `DAO`は`jetデータベースエンジン`に直接接続するため、単体のAccessシステムを操作するケースに適しています。
- `ADO`はAccessに限らず、`Microsoft SQL Server`などのデータベースに接続できる汎用オブジェクトを提供しています。
  - データベースの種類が異なっても同じ手法でレコードを操作できる利点があります。
- `DAO`にはテーブルやクエリを作成する機能があります。
- `ADO`にはテーブルやクエリを作成する機能はありません。
  - `ADOX`というADOの拡張機能を使用する必要があります。

### DAOの特徴
- DAOはレコードセットの操作やトランザクションの管理等、ADOで行うことのできる処理の多くを実行することが可能。
- DAOを使用するには参照設定は不要です。

{% include goto_pagetop.html %}

* * *
## <a name="データの読み取り">データの読み取り</a><a class="heading-anchor-permalink" href="#データの読み取り">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-31" updated="2021-08-31" %}</div>
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
<em class="comment">' DBを取得</em>
Dim p_db As DAO.Database
Set p_db = CurrentDb()

<em class="comment">' SQLを実行</em>
Dim p_rs As DAO.Recordset
Set p_rs = p_db.OpenRecordset(<em>&lt;SQL文 or テーブル名 or クエリ名&gt;</em>, RecordsetTypeEnum.dbOpenSnapshot)
With p_rs
    If .EOF Or .BOF Then
        <em class="comment">' データがなかった時の処理</em>
        <em class="comment">'   :</em>
        <em class="comment">'   :</em>
        GoTo Finally
    Else
        <em class="comment">' データがあった時の処理</em>
        .MoveFirst
        Do Until p_rs.EOF
            Debug.Print p_rs.Fields!ID
            Debug.Print p_rs.Fields("Name")
            Debug.Print p_rs.Fields("Age")
            Debug.Print p_rs.Fields("BillingAmount")
            p_rs.MoveNext
        Loop
    End If
End With

Finally:
<em class="comment">' クローズ処理</em>
p_db.Close
Set p_db = Nothing
</pre>
</div>

### ポイント
- `DAO.Databaset`というのがデータベースオブジェクトです。
  - `ADO`で言うところのコネクションのようなものです。
- `DAO.Recordset`がクエリを実行した結果オブジェクトです。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-31" updated="2021-08-31" %}</div>
### 参考
- [(ray88’s diary) AccessVBA　DAO](https://ray88.hatenablog.com/entry/2020/07/12/171304)
- [(基礎から始めるAccess VBA講座) Recordsetの作成（DAO編）](http://www7b.biglobe.ne.jp/~cbcnet/DAO/database.html)
- [(アズビーパートナーズ) 【AccessVBA】ADOとDAOを使ってレコードセットを読み書きする方法](https://asbepartners.com/ado_or_dao/)
- [(Qiita) 【VBA】OpenRecordsetをまとめる(個人用)](https://qiita.com/Masataka_Sugi/items/b3279ae0fd10a29014df)

### 関連メモ
- [AccessでADOを使ってデータの読み取り]({% link _it_articles/access/using_ado_to_read_data.md %})

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
