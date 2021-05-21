---
chapter_no: 13
chapter_title: 補足3 FOR XML PATH
created: 2020-11-07
updated: 2020-11-07
---
FOR XML PATHはSQLの後ろに付与して、XMLとして結果を取得するものです。  
例えば以下のように全データを取得してみると…

<div class="code-box">
<div class="title">SQL</div>
<pre>
SELECT * FROM Table1 <em>FOR XML PATH('row')</em>
</pre>
</div>

<div class="code-box">
<div class="title">取得結果</div>
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
<pre>
SELECT * FROM Table1 FOR XML PATH(<em>'hoge'</em>)
</pre>
</div>

<div class="code-box">
<div class="title">取得結果</div>
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

そして、空文字を渡すことで、要素そのものをなくすこともできます。

<div class="code-box">
<div class="title">SQL</div>
<pre>
SELECT * FROM Table1 FOR XML PATH(<em>''</em>)
</pre>
</div>

<div class="code-box">
<div class="title">取得結果</div>
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

さらに、取得する列名を失くすと、要素のタグを消失させることができます。

<div class="code-box">
<div class="title">SQL</div>
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
<pre>
1紅組佐藤2紅組鈴木3紅組高橋4青組田中5黄組伊藤6黄組渡辺
</pre>
</div>

ここまでくれば、取得する項目を絞ったり、接続する文字を`,`や`/`などにしたりして、自由に文字列として加工できます。


さきほど、注意として書きましたが、XML型ではなく文字列型に変換する正式なやり方は、  
`TYPEディレクティブ`で受け取って、`valueメソッド`で`NVARCHAR`に変換してあげるといいみたいです。  
詳細は、以下の[参考](#reference)を参考にして下さい。

<div class="code-box">
<div class="title">SQL</div>
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
<pre>
1紅組佐藤2紅組鈴木3紅組高橋4青組田中5黄組伊藤6黄組渡辺
</pre>
</div>
