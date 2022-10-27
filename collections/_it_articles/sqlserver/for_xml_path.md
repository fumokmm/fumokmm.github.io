---
title: SQL Serverで取得結果行を1列に連結するSQL(FOR XML PATH)
article_group_id: sql-group
display_order: 30
created: 2020-11-07
updated: 2022-10-27
---
{% capture link_to_it_oracle %}{% link _it_articles/oracle/index.md %}{% endcapture %}{% assign link_to_it_oracle = link_to_it_oracle | remove: 'index' %}
{% capture link_to_it_postgresql %}{% link _it_articles/postgresql/index.md %}{% endcapture %}{% assign link_to_it_postgresql = link_to_it_postgresql | remove: 'index' %}

複数取得される結果を結合して1列で取得したい場合があります。SQL Serverでそれを行うSQLについてメモしておきます。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#下準備">下準備</a></li>
<li><a href="#さっそくやってみよう">さっそくやってみよう</a></li>
<li><a href="#補足1 STUFF関数">補足1 STUFF関数</a></li>
<li><a href="#補足2 SUBSTRING関数でもよい">補足2 SUBSTRING関数でもよい</a></li>
<li><a href="#補足3 FOR XML PATH">補足3 FOR XML PATH</a></li>
<li><a href="#補足4 他のデータベースでは">補足4 他のデータベースでは</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="下準備">下準備</a><a class="heading-anchor-permalink" href="#下準備">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-11-07" updated="2022-01-09" %}</div>
こんなテーブルとデータがあったとします。

<div class="code-box">
<div class="title">SQL</div>
<div class="copy-button">Copy</div>
<pre>
SELECT * FROM Table1 ORDER BY NO
</pre>
</div>

### 取得結果

|NO|TEAM|MEMBER|
|--|----|------|
|1|紅組|佐藤|
|2|紅組|鈴木|
|3|紅組|高橋|
|4|青組|田中|
|5|黄組|伊藤|
|6|黄組|渡辺|

そしてこのテーブルから、こんな感じに*チームごとのメンバーリスト*を*CSV形式*で出力したいとします。

### 取得結果（こんな感じを希望・・・）

|TEAM|MEMBER|
|----|------|
|紅組|佐藤,鈴木,高橋|
|青組|田中|
|黄組|伊藤,渡辺|

{% include goto_pagetop.html %}

* * *
## <a name="さっそくやってみよう">さっそくやってみよう</a><a class="heading-anchor-permalink" href="#さっそくやってみよう">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-11-07" updated="2022-05-15" %}</div>
さっそくやって行きましょう。SQL Serverでは、`FOR XML PATH`を使うことで実現することができます。

<div class="code-box">
<div class="title">SQL</div>
<div class="copy-button">Copy</div>
<pre>
SELECT
    a.TEAM AS TEAM,
    (SELECT ',' + MEMBER FROM Table1 b WHERE b.TEAM = a.TEAM ORDER BY b.NO <em>FOR XML PATH('')</em>) AS MEMBER
FROM
    Table1 a
</pre>
</div>

### 取得結果

|TEAM|MEMBER|
|----|------|
|紅組|,佐藤,鈴木,高橋|
|紅組|,佐藤,鈴木,高橋|
|紅組|,佐藤,鈴木,高橋|
|青組|,田中|
|黄組|,伊藤,渡辺|
|黄組|,伊藤,渡辺|

いい感じになってきましたが、先頭の `,` が邪魔なので[STUFF関数](#補足1 STUFF関数)を使って除去してみましょう。  
[STUFF関数](#補足1 STUFF関数)を組み込んでみるとこうなります。取得する先頭に`,`が付くので、それを除去しています。

<div class="code-box">
<div class="title">SQL</div>
<div class="copy-button">Copy</div>
<pre>
SELECT
    a.TEAM AS TEAM,
    <em>STUFF(</em>
        (SELECT ',' + MEMBER FROM Table1 b WHERE b.TEAM = a.TEAM ORDER BY b.NO FOR XML PATH(''))
        <em>, 1, 1, ''</em>
    <em>)</em> AS MEMBER
FROM
    Table1 a
</pre>
</div>

### 取得結果

|TEAM|MEMBER|
|----|------|
|紅組|佐藤,鈴木,高橋|
|紅組|佐藤,鈴木,高橋|
|紅組|佐藤,鈴木,高橋|
|青組|田中|
|黄組|伊藤,渡辺|
|黄組|伊藤,渡辺|

あともう一歩ですね。重複して出てきてしまっているデータをまとめてみましょう。

<div class="code-box">
<div class="title">SQL</div>
<div class="copy-button">Copy</div>
<pre>
SELECT
    a.TEAM AS TEAM,
    STUFF(
        (SELECT ',' + MEMBER FROM Table1 b WHERE b.TEAM = a.TEAM ORDER BY b.NO FOR XML PATH(''))
        , 1, 1, ''
    ) AS MEMBER
FROM
    <em>(SELECT DISTINCT TEAM FROM Table1)</em> a
ORDER BY
    a.TEAM
</pre>
</div>

### 取得結果

|TEAM|MEMBER|
|----|------|
|黄組|伊藤,渡辺|
|紅組|佐藤,鈴木,高橋|
|青組|田中|

これで完成です。SQLはちょっとごちゃごちゃしますが、わりと簡単にできるみたいですね。

{% include goto_pagetop.html %}

* * *
## <a name="補足1 STUFF関数">補足1 STUFF関数</a><a class="heading-anchor-permalink" href="#補足1 STUFF関数">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-11-07" updated="2020-11-07" %}</div>
`STUFF関数`は、引数を4つ取る関数で、指定した文字列(第1引数)の、指定した位置(第2引数)から、指定した文字数(第3引数)分を、置換文字列(第4引数)に置き換える関数です。以下のような感じになります。

<div class="code-box">
<div class="title">STUFF関数</div>
<div class="copy-button">Copy</div>
<pre>
SELECT
    <em>STUFF(</em>'abcdefg', 2, 3, '**new**'<em>)</em> AS "結果";
</pre>
</div>

<div class="code-box">
<div class="title">結果</div>
<div class="copy-button">Copy</div>
<pre>
a**new**efg
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="補足2 SUBSTRING関数でもよい">補足2 SUBSTRING関数でもよい</a><a class="heading-anchor-permalink" href="#補足2 SUBSTRING関数でもよい">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-11-07" updated="2020-11-07" %}</div>
先頭の`,`さえ除去できればいいので、以下のようにサブクエリにしてから、SUBSTRING関数を使っても可能ですね。

<div class="code-box">
<div class="title">SUBSTRING関数, FROM句でサブクエリにする</div>
<div class="copy-button">Copy</div>
<pre>
SELECT
    TEAM,
    SUBSTRING(MEMBER, 2, LEN(MEMBER) - 1) AS MEMBER
FROM
    (
        SELECT
            a.TEAM AS TEAM,
            (SELECT ',' + MEMBER FROM Table1 b WHERE b.TEAM = a.TEAM ORDER BY b.NO FOR XML PATH('')) AS MEMBER
        FROM
            Table1 a
    ) as x
</pre>
</div>

<div class="code-box">
<div class="title">SUBSTRING関数, WITHでサブクエリにする</div>
<div class="copy-button">Copy</div>
<pre>
WITH X AS (
    SELECT
        a.TEAM AS TEAM,
        (SELECT ',' + MEMBER FROM Table1 b WHERE b.TEAM = a.TEAM ORDER BY b.NO FOR XML PATH('')) AS MEMBER
    FROM
        Table1 a
)
SELECT
    TEAM,
    SUBSTRING(MEMBER, 2, LEN(MEMBER) - 1) AS MEMBER
FROM
    X
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="補足3 FOR XML PATH">補足3 FOR XML PATH</a><a class="heading-anchor-permalink" href="#補足3 FOR XML PATH">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-11-07" updated="2022-07-13" %}</div>
FOR XML PATHはSQLの後ろに付与して、XMLとして結果を取得するものです。  
例えば以下のように全データを取得してみると…

<div class="code-box">
<div class="title">SQL</div>
<div class="copy-button">Copy</div>
<pre>
SELECT * FROM Table1 <em>FOR XML PATH('row')</em>
</pre>
</div>

<div class="code-box">
<div class="title">取得結果</div>
<div class="copy-button">Copy</div>
<pre>
&lt;row&gt;
  &lt;NO&gt;1&lt;/NO&gt;
  &lt;TEAM&gt;紅組&lt;/TEAM&gt;
  &lt;MEMBER&gt;佐藤&lt;/MEMBER&gt;
&lt;/row&gt;
&lt;row&gt;
  &lt;NO&gt;2&lt;/NO&gt;
  &lt;TEAM&gt;紅組&lt;/TEAM&gt;
  &lt;MEMBER&gt;鈴木&lt;/MEMBER&gt;
&lt;/row&gt;
&lt;row&gt;
  &lt;NO&gt;3&lt;/NO&gt;
  &lt;TEAM&gt;紅組&lt;/TEAM&gt;
  &lt;MEMBER&gt;高橋&lt;/MEMBER&gt;
&lt;/row&gt;
&lt;row&gt;
  &lt;NO&gt;4&lt;/NO&gt;
  &lt;TEAM&gt;青組&lt;/TEAM&gt;
  &lt;MEMBER&gt;田中&lt;/MEMBER&gt;
&lt;/row&gt;
&lt;row&gt;
  &lt;NO&gt;5&lt;/NO&gt;
  &lt;TEAM&gt;黄組&lt;/TEAM&gt;
  &lt;MEMBER&gt;伊藤&lt;/MEMBER&gt;
&lt;/row&gt;
&lt;row&gt;
  &lt;NO&gt;6&lt;/NO&gt;
  &lt;TEAM&gt;黄組&lt;/TEAM&gt;
  &lt;MEMBER&gt;渡辺&lt;/MEMBER&gt;
&lt;/row&gt;
</pre>
</div>

このようなXML形式で結果が返却されます。  
注意としては、文字列型のように見えますが、あくまでXML型で取得されている点です。そのままでは通常の文字列のように加工できませんので、後ほど説明しますが、文字列型に変換してから利用します。

なお、`PATH`に`'row'`という文字列を渡していたので、各行を囲む要素が`row`になっていました。こちらは変更できますので、例えば`'hoge'`にすれば、このようになります。

<div class="code-box">
<div class="title">SQL</div>
<div class="copy-button">Copy</div>
<pre>
SELECT * FROM Table1 FOR XML PATH(<em>'hoge'</em>)
</pre>
</div>

<div class="code-box">
<div class="title">取得結果</div>
<div class="copy-button">Copy</div>
<pre>
<em>&lt;hoge&gt;</em>
  &lt;NO&gt;1&lt;/NO&gt;
  &lt;TEAM&gt;紅組&lt;/TEAM&gt;
  &lt;MEMBER&gt;佐藤&lt;/MEMBER&gt;
<em>&lt;/hoge&gt;</em>
<em>&lt;hoge&gt;</em>
  &lt;NO&gt;2&lt;/NO&gt;
  &lt;TEAM&gt;紅組&lt;/TEAM&gt;
  &lt;MEMBER&gt;鈴木&lt;/MEMBER&gt;
<em>&lt;/hoge&gt;</em>
<em>&lt;hoge&gt;</em>
  &lt;NO&gt;3&lt;/NO&gt;
  &lt;TEAM&gt;紅組&lt;/TEAM&gt;
  &lt;MEMBER&gt;高橋&lt;/MEMBER&gt;
<em>&lt;/hoge&gt;</em>
<em>&lt;hoge&gt;</em>
  &lt;NO&gt;4&lt;/NO&gt;
  &lt;TEAM&gt;青組&lt;/TEAM&gt;
  &lt;MEMBER&gt;田中&lt;/MEMBER&gt;
<em>&lt;/hoge&gt;</em>
<em>&lt;hoge&gt;</em>
  &lt;NO&gt;5&lt;/NO&gt;
  &lt;TEAM&gt;黄組&lt;/TEAM&gt;
  &lt;MEMBER&gt;伊藤&lt;/MEMBER&gt;
<em>&lt;/hoge&gt;</em>
<em>&lt;hoge&gt;</em>
  &lt;NO&gt;6&lt;/NO&gt;
  &lt;TEAM&gt;黄組&lt;/TEAM&gt;
  &lt;MEMBER&gt;渡辺&lt;/MEMBER&gt;
<em>&lt;/hoge&gt;</em>
</pre>
</div>

そして、空文字を渡すことで、要素そのものをなくすこともできます。（構造崩壊）

<div class="code-box">
<div class="title">SQL</div>
<div class="copy-button">Copy</div>
<pre>
SELECT * FROM Table1 FOR XML PATH(<em>''</em>)
</pre>
</div>

<div class="code-box">
<div class="title">取得結果</div>
<div class="copy-button">Copy</div>
<pre>
&lt;NO&gt;1&lt;/NO&gt;
&lt;TEAM&gt;紅組&lt;/TEAM&gt;
&lt;MEMBER&gt;佐藤&lt;/MEMBER&gt;
&lt;NO&gt;2&lt;/NO&gt;
&lt;TEAM&gt;紅組&lt;/TEAM&gt;
&lt;MEMBER&gt;鈴木&lt;/MEMBER&gt;
&lt;NO&gt;3&lt;/NO&gt;
&lt;TEAM&gt;紅組&lt;/TEAM&gt;
&lt;MEMBER&gt;高橋&lt;/MEMBER&gt;
&lt;NO&gt;4&lt;/NO&gt;
&lt;TEAM&gt;青組&lt;/TEAM&gt;
&lt;MEMBER&gt;田中&lt;/MEMBER&gt;
&lt;NO&gt;5&lt;/NO&gt;
&lt;TEAM&gt;黄組&lt;/TEAM&gt;
&lt;MEMBER&gt;伊藤&lt;/MEMBER&gt;
&lt;NO&gt;6&lt;/NO&gt;
&lt;TEAM&gt;黄組&lt;/TEAM&gt;
&lt;MEMBER&gt;渡辺&lt;/MEMBER&gt;
</pre>
</div>

さらに、取得する列名を失くすと、要素のタグを消失させることができます。（もはやXMLですらない）

<div class="code-box">
<div class="title">SQL</div>
<div class="copy-button">Copy</div>
<pre>
SELECT
    <em>NO + ''</em>,
    <em>TEAM + ''</em>,
    <em>MEMBER + ''</em>
FROM
    Table1
FOR XML PATH('')
</pre>
</div>

<div class="code-box">
<div class="title">取得結果</div>
<div class="copy-button">Copy</div>
<pre>
1紅組佐藤2紅組鈴木3紅組高橋4青組田中5黄組伊藤6黄組渡辺
</pre>
</div>

ここまでくれば、取得する項目を絞ったり、接続する文字を`,`や`/`などにしたりして、自由に文字列として加工できます。


さきほど、注意として書きましたが、XML型ではなく文字列型に変換する正式なやり方は、  
`TYPEディレクティブ`で受け取って、`valueメソッド`で`NVARCHAR`に変換してあげるといいみたいです。  
詳細は、以下の[参考](#参考)を参考にして下さい。

<div class="code-box">
<div class="title">SQL</div>
<div class="copy-button">Copy</div>
<pre>
SELECT
    (SELECT
         NO + '',
         TEAM + '',
         MEMBER + ''
     FROM
         Table1
     FOR XML PATH(''), <em>TYPE</em>)<em>.value('.', 'NVARCHAR(MAX)')</em>
</pre>
</div>

括弧の対応が分かりにくいですが、`TYPE`の後の括弧が、サブクエリの開始の括弧の閉じになります。  
サブクエリの戻り(=XML型)を`.value`で`XPATH`として取得して、`NVARCHAR`に変換しているようです。

取得結果は先ほどと同じになります。

<div class="code-box">
<div class="title">取得結果</div>
<div class="copy-button">Copy</div>
<pre>
1紅組佐藤2紅組鈴木3紅組高橋4青組田中5黄組伊藤6黄組渡辺
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="補足4 他のデータベースでは">補足4 他のデータベースでは</a><a class="heading-anchor-permalink" href="#補足4 他のデータベースでは">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-11-07" updated="2022-10-27" %}</div>
なお、MySQL(MariaDB) では`GROUP_CONCAT関数`、[Oracle]({{link_to_it_oracle}})では`LISTAGG関数`、[PostgreSQL]({{link_to_it_postgresql}})では[string_agg関数]({% link _it_articles/postgresql/string_agg.md %})で同様の処理が可能とのことです。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-11-07" updated="2022-10-15" %}</div>
### 関連メモ
- [PostgreSQLで取得結果行を1列に連結するSQL(string_agg)]({% link _it_articles/postgresql/string_agg.md %})

### 参考サイト
- [[SQL Server] 縦に並んだデータを横にカンマ区切りの列データで取得する方法](https://webbibouroku.com/Blog/Article/forxmlpath)
- [(Microsoft Docs) FOR XML での PATH モードの使用](https://docs.microsoft.com/ja-jp/sql/relational-databases/xml/use-path-mode-with-for-xml?view=sql-server-ver15)
- [(Microsoft Docs) value() メソッド (xml データ型)](https://docs.microsoft.com/ja-jp/sql/t-sql/xml/value-method-xml-data-type?view=sql-server-ver15)
- [(Microsoft Docs) STUFF (Transact-SQL)](https://docs.microsoft.com/ja-jp/sql/t-sql/functions/stuff-transact-sql?view=sql-server-ver15)
- [(it-swarm-ja.tech) SQLSERVERのListAGG](https://www.it-swarm-ja.tech/ja/sql/sqlserver%E3%81%AElistagg/1072750335/)
- [(SHIFT the Oracle) LISTAGG（集計関数）](https://www.shift-the-oracle.com/sql/aggregate-functions/listagg.html)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
