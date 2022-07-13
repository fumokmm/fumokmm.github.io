---
chapter_no: 50
chapter_title: 補足3 FOR XML PATH
created: 2020-11-07
updated: 2022-07-13
---
FOR XML PATHはSQLの後ろに付与して、XMLとして結果を取得するものです。  
例えば以下のように全データを取得してみると…

```:SQL
SELECT * FROM Table1 {em{FOR XML PATH('row')}em}
```

```:取得結果
<row>
  <NO>1</NO>
  <TEAM>紅組</TEAM>
  <MEMBER>佐藤</MEMBER>
</row>
<row>
  <NO>2</NO>
  <TEAM>紅組</TEAM>
  <MEMBER>鈴木</MEMBER>
</row>
<row>
  <NO>3</NO>
  <TEAM>紅組</TEAM>
  <MEMBER>高橋</MEMBER>
</row>
<row>
  <NO>4</NO>
  <TEAM>青組</TEAM>
  <MEMBER>田中</MEMBER>
</row>
<row>
  <NO>5</NO>
  <TEAM>黄組</TEAM>
  <MEMBER>伊藤</MEMBER>
</row>
<row>
  <NO>6</NO>
  <TEAM>黄組</TEAM>
  <MEMBER>渡辺</MEMBER>
</row>
```

このようなXML形式で結果が返却されます。  
注意としては、文字列型のように見えますが、あくまでXML型で取得されている点です。そのままでは通常の文字列のように加工できませんので、後ほど説明しますが、文字列型に変換してから利用します。

なお、`PATH`に`'row'`という文字列を渡していたので、各行を囲む要素が`row`になっていました。こちらは変更できますので、例えば`'hoge'`にすれば、このようになります。

```:SQL
SELECT * FROM Table1 FOR XML PATH({em{'hoge'}em})
```

```:取得結果
{em{<hoge>}em}
  <NO>1</NO>
  <TEAM>紅組</TEAM>
  <MEMBER>佐藤</MEMBER>
{em{</hoge>}em}
{em{<hoge>}em}
  <NO>2</NO>
  <TEAM>紅組</TEAM>
  <MEMBER>鈴木</MEMBER>
{em{</hoge>}em}
{em{<hoge>}em}
  <NO>3</NO>
  <TEAM>紅組</TEAM>
  <MEMBER>高橋</MEMBER>
{em{</hoge>}em}
{em{<hoge>}em}
  <NO>4</NO>
  <TEAM>青組</TEAM>
  <MEMBER>田中</MEMBER>
{em{</hoge>}em}
{em{<hoge>}em}
  <NO>5</NO>
  <TEAM>黄組</TEAM>
  <MEMBER>伊藤</MEMBER>
{em{</hoge>}em}
{em{<hoge>}em}
  <NO>6</NO>
  <TEAM>黄組</TEAM>
  <MEMBER>渡辺</MEMBER>
{em{</hoge>}em}
```

そして、空文字を渡すことで、要素そのものをなくすこともできます。（構造崩壊）

```:SQL
SELECT * FROM Table1 FOR XML PATH({em{''}em})
```

```:取得結果
<NO>1</NO>
<TEAM>紅組</TEAM>
<MEMBER>佐藤</MEMBER>
<NO>2</NO>
<TEAM>紅組</TEAM>
<MEMBER>鈴木</MEMBER>
<NO>3</NO>
<TEAM>紅組</TEAM>
<MEMBER>高橋</MEMBER>
<NO>4</NO>
<TEAM>青組</TEAM>
<MEMBER>田中</MEMBER>
<NO>5</NO>
<TEAM>黄組</TEAM>
<MEMBER>伊藤</MEMBER>
<NO>6</NO>
<TEAM>黄組</TEAM>
<MEMBER>渡辺</MEMBER>
```

さらに、取得する列名を失くすと、要素のタグを消失させることができます。（最早XMLですらない）

```:SQL
SELECT
    {em{NO + ''}em},
    {em{TEAM + ''}em},
    {em{MEMBER + ''}em}
FROM
    Table1
FOR XML PATH('')
```

```:取得結果
1紅組佐藤2紅組鈴木3紅組高橋4青組田中5黄組伊藤6黄組渡辺
```

ここまでくれば、取得する項目を絞ったり、接続する文字を`,`や`/`などにしたりして、自由に文字列として加工できます。


さきほど、注意として書きましたが、XML型ではなく文字列型に変換する正式なやり方は、  
`TYPEディレクティブ`で受け取って、`valueメソッド`で`NVARCHAR`に変換してあげるといいみたいです。  
詳細は、以下の[参考](#参考)を参考にして下さい。

```:SQL
SELECT
    (SELECT
         NO + '',
         TEAM + '',
         MEMBER + ''
     FROM
         Table1
     FOR XML PATH(''), {em{TYPE}em}){em{.value('.', 'NVARCHAR(MAX)')}em}
```

括弧の対応が分かりにくいですが、`TYPE`の後の括弧が、サブクエリの開始の括弧の閉じになります。  
サブクエリの戻り(=XML型)を`.value`で`XPATH`として取得して、`NVARCHAR`に変換しているようです。

取得結果は先ほどと同じになります。

```:取得結果
1紅組佐藤2紅組鈴木3紅組高橋4青組田中5黄組伊藤6黄組渡辺
```
