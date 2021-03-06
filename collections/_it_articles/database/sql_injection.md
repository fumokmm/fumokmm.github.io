---
title: SQLインジェクションのまとめ
display_order: 10
created: 2008-04-12
updated: 2021-04-01
---
当メモは2008-04-12に[投稿されたもの](https://npnl.hatenablog.jp/entry/20080412/1207965105)を加筆修正し、再掲したものです。

こちらはSQLインジェクションについてまとめたものになります。

## 目次

- [ケース１ SQLインジェクション攻撃による不正ログイン 〜シングルクォート挿入〜](#case1)
- [ケース２ SQLインジェクション攻撃による任意のSQL文実行 〜セミコロンで分割〜](#case2)
- [ケース３ SQLインジェクション攻撃による任意のSQL文実行 〜コメントアウトで無効化〜](#case3)
- [ケース４ SQLインジェクション攻撃によるパスワード変更 〜シングルクォート挿入〜](#case4)
- [ケース５ SQLインジェクション攻撃によるパスワード変更 〜コメントアウトで無効化〜](#case5)
- [ケース１〜５の回避方法・対策](#workaround-methods-and-countermeasures-for-case1to5)
- [ケース６ セカンドオーダSQLインジェクション](#case6)
- [ケース６の回避方法・対策](#workaround-methods-and-countermeasures-for-case6)
- [補足](#supplement)
- [参考](#reference)

## <a name="case1">ケース１ SQLインジェクション攻撃による不正ログイン 〜シングルクォート挿入〜</a>
まずは、SQLインジェクションの最も基本的な攻撃パターンであるシングルクォート「`'`」を使った手法をご紹介しましょう。

### 攻撃手法
以下のようなテーブルがあるとします。

<table class="normal">
    <caption>テーブル名：ユーザマスタ</caption>
    <tr><th>ユーザID</th><th>パスワード</th></tr>
    <tr><td>admin</td><td>admin</td></tr>
    <tr><td>fumo</td><td>hoge</td></tr>
    <tr><td>cynthia</td><td>piyo</td></tr>
    <tr><td>rose</td><td>fuga</td></tr>
</table>

<div class="code-box">
<div class="title">SQL</div>
<pre>
SELECT * FROM ユーザマスタ WHERE ユーザID = '$userId' AND パスワード = '$passwd'
</pre>
</div>

ユーザによって入力されたユーザID、パスワードをそれぞれ`$userId`、`$passwd`に代入し、上記SQLにてその存在が確認できればログインできるWEBページがあります。
悪意あるユーザがユーザID「`fumo`」としてパスワードを入力せずにログインを試みる際に入力するパラメータは、以下のようになります。

<dl>
  <dt>$userId</dt>
  <dd>fumo</dd>
  <dt>$passwd</dt>
  <dd>' OR 'A' = 'A</dd>
</dl>

結果、生成されるSQL文は以下のようなものになります。

<div class="code-box">
<div class="title">SQL</div>
<pre>
SELECT * FROM ユーザマスタ WHERE ユーザID = 'fumo' AND <em>パスワード = '' OR 'A' = 'A'</em>
</pre>
</div>

パラメータとして入力値「`'`」を含ませることで、パスワードに関するWHERE句の条件式を一旦終端させ、次にORを含ませると、「`'A' = 'A'`」という恒真式がORの対象になります。  
よって、WHERE句全体が常に真となり、パスワードを入力せずにユーザID「`fumo`」としてログインすることが可能となります。

ちなみに、「`'A' = 'A`」の部分は「`'1' = '1`」でも「`'' = '`」でも大丈夫です。OR以降が常に真となるような恒真式が記述されることが重要です。


## <a name="case2">ケース２ SQLインジェクション攻撃による任意のSQL文実行 〜セミコロンで分割〜</a>

さて次は、[ケース１](#case1)の応用例として任意のSQL文を実行させる手法をご紹介しましょう。  
ここではレコードの全件削除を例にとって説明します。

### 攻撃手法
SQL文におけるセミコロン「`;`」は、ステートメントを分割するデリミタです。この「`;`」を使って複数のSQL文を連結させることができます。  
利用するテーブルは[ケース１](#case1)と同じものとして、今回は以下のようにパラメータを入力してみます。

<dl>
  <dt>$userId</dt>
  <dd> (何も入力しない) </dd>
  <dt>$passwd</dt>
  <dd>'; DELETE FROM ユーザマスタ WHERE 'A' = 'A</dd>
</dl>

さて、どんなSQLが生成されるでしょうか。


<div class="code-box">
<div class="title">SQL</div>
<pre>
SELECT * FROM ユーザマスタ WHERE ユーザID = '' AND パスワード = ''<em>; DELETE FROM ユーザマスタ WHERE 'A' = 'A'</em>
</pre>
</div>

このようになります。  
これは以下のように二つのSQL文が続けて実行されることを意味します。

<div class="code-box">
<div class="title">SQL</div>
<pre>
SELECT * FROM ユーザマスタ WHERE ユーザID = '' AND パスワード = '';
DELETE FROM ユーザマスタ WHERE 'A' = 'A'
</pre>
</div>

一つ目のSELECT文は実行されますが無害です。  
このようにパラメータに「`;`」を含ませることで、WHERE句を一旦終端させ、全件削除のDELETE文をさせることができます。  
なお、「`'`」の数をあわせるために、ケース１と同様に「`'A' = 'A'`」という恒真式にして、DELETE文のWHERE句を無効化しています。

## <a name="case3">ケース３ SQLインジェクション攻撃による任意のSQL文実行 〜コメントアウトで無効化〜</a>
更に応用例として、コメントアウト「`--`」を使用してパスワード入力部分のSQLを無効化する手法をご紹介しましょう。

### 攻撃手法
利用するテーブルは[ケース１](#case1)と同じものとして、以下のようにパラメータを入力してみます。

<dl>
  <dt>$userId</dt>
  <dd>'; DELETE FROM ユーザマスタ WHERE 'A' = 'A' --</dd>
  <dt>$passwd</dt>
  <dd> (何も入力しない) </dd>
</dl>

これで、以下のようなSQL文が実行される。

<div class="code-box">
<div class="title">SQL</div>
<pre>
SELECT * FROM ユーザマスタ WHERE ユーザID = '';
DELETE FROM ユーザマスタ WHERE 'A' = 'A' <em>--' AND パスワード = ''</em>
</pre>
</div>

「`--`」以下の「`' AND パスワード = ''`」の部分はコメントアウトされるので無効となり、結果として[ケース２](#case2)と同様に全件削除のSQL文として機能します。

## <a name="case4">ケース４ SQLインジェクション攻撃によるパスワード変更 〜シングルクォート挿入〜</a>
さて、今度はデータを変更するパターンの攻撃についてご紹介しましょう。

### 攻撃手法
利用するテーブルは[ケース１](#case1)と同じものとして、ユーザIDと現在のパスワードおよび新しいパスワードを受け取り、データベースの更新が行われる例で考えてみましょう。

<div class="code-box">
<div class="title">SQL</div>
<pre>
UPDATE ユーザマスタ SET パスワード = '${newPasswd}' WHERE ユーザID = '${userId}' AND パスワード = '${oldPasswd}'
</pre>
</div>

ユーザによって入力されたユーザID、旧パスワード、新パスワードをそれぞれ`${userId}`、`${oldPasswd}`、`${newPasswd}`に代入し、上記SQLにてその存在が確認し、合致すればパスワードの変更が完了します。  
悪意あるユーザ「`rose`」が、自身のパスワード「`fuga`」とユーザ「`admin`」のパスワードを「`malice`」に書き換えを試みる際に入力するパラメータは、以下のようになります。

<dl>
  <dt>$userId</dt>
  <dd>rose</dd>
  <dt>$oldPasswd</dt>
  <dd>fuga' OR ユーザID = 'admin</dd>
  <dt>$newPasswd</dt>
  <dd>malice</dd>
</dl>

結果、生成されるSQL文は以下のようなものになります。

<div class="code-box">
<div class="title">SQL</div>
<pre>
UPDATE ユーザマスタ SET パスワード = 'malice' WHERE ユーザID = 'rose' AND パスワード = 'fuga' <em>OR ユーザID = 'admin'</em>
</pre>
</div>

ユーザIDが「`rose`」でパスワードが「`fuga`」であるレコード、またはユーザIDが「`admin`」であるレコードを更新対象としてしまいます。  
つまり、「`admin`」のパスワードが分からなくても「`admin`」のパスワードを変更することが可能となるわけです。  
更新後のテーブルの様子は以下のようになります。

<table class="normal">
    <caption>テーブル名：ユーザマスタ(更新後)</caption>
    <tr><th>ユーザID</th><th>パスワード</th></tr>
    <tr><td>admin</td><td><strong>malice</strong></td></tr>
    <tr><td>fumo</td><td>hoge</td></tr>
    <tr><td>cynthia</td><td>piyo</td></tr>
    <tr><td>rose</td><td><strong>malice</strong></td></tr>
</table>

## <a name="case5">ケース５ SQLインジェクション攻撃によるパスワード変更 〜コメントアウトで無効化〜</a>
さて、今度は[ケース４](#case4)の応用で全データを変更するパターンの攻撃についてご紹介しましょう。

### 攻撃手法
利用するテーブル、条件は[ケース４](#case4)と同様とし、悪意あるユーザが全ユーザのパスワードを「`malice`」への書き換えを試みる際に入力するパラメータは以下のようになります。

<dl>
  <dt>$userId</dt>
  <dd>' OR 'A' = 'A' --</dd>
  <dt>$oldPasswd</dt>
  <dd> (何も入力しない) </dd>
  <dt>$newPasswd</dt>
  <dd>malice</dd>
</dl>

結果、生成されるSQL文は以下のようなものになります。

<div class="code-box">
<div class="title">SQL</div>
<pre>
UPDATE ユーザマスタ SET パスワード = 'malice' WHERE ユーザID = '' <em>OR 'A' = 'A' --' AND パスワード = ''</em>
</pre>
</div>

[ケース３](#case3)と同様に「`'A' = 'A'`」の恒真式にしつつ、それ以降をコメントアウトしてWHERE句を無効化しています。結果、全員のパスワードが「`malice`」に変更されてしまいます。  
更新後のテーブルの様子は以下のようになります。

<table class="normal">
    <caption>テーブル名：ユーザマスタ(更新後)</caption>
    <tr><th>ユーザID</th><th>パスワード</th></tr>
    <tr><td>admin</td><td><strong>malice</strong></td></tr>
    <tr><td>fumo</td><td><strong>malice</strong></td></tr>
    <tr><td>cynthia</td><td><strong>malice</strong></td></tr>
    <tr><td>rose</td><td><strong>malice</strong></td></tr>
</table>

## <a name="workaround-methods-and-countermeasures-for-case1to5">ケース１〜５の回避方法・対策</a>
今まで見てきたSQLインジェクションの攻撃に対する回避方法・対策についてご紹介しましょう。

### 特殊文字のエスケープ(サニタイジング)
SQL文に含まれたパラメータに対して、危険な文字列を検出し特殊文字として認識させないように適切に置換・除去を行うエスケープ処理(サニタイジング)で対応します。  
エスケープ対象は処理系によって異なりますが、一般的には次の通りです。

<table class="normal">
    <tr><th>特殊文字</th><th>エスケープ処理</th></tr>
    <tr><td>'</td><td>''</td></tr>
    <tr><td>;</td><td>受理しない</td></tr>
    <tr><td>その他の特殊文字</td><td>エスケープ文字(\)を前に付加する</td></tr>
</table>

「`'`」→「`''`」とシングルクォートを二つ重ねてエスケープすることで、文字列を囲むシングルクォートでなはく、シングルクォート文字列定数として扱うようにします。

このようにSQLインジェクションは特殊文字を悪用することによって行われるため、入力チェックとサニタイジングが有効です。  
ただしデータベースエンジンはそれごとにSQLが独自拡張されていることがありますので、サニタイジングが必要な特殊文字が変わってくることがあります。  
データベースエンジンごとに機能を持つ特殊文字をリストアップし、正しくエスケープ処理を実装する必要があります。

### SQL文の組み立てにバインド機構を使用する(準備済みSQLの利用)
あらかじめコンパイルしたSQL文をデータベース側に持たせておき、値だけをデータベースに渡して実行させるためのDBMSの機能があります。  
具体的にはプレースホルダと呼ばれる一般的な特殊文字(「`?`」など)を使用してSQL文の雛形を用意しておき、後で実際の値(変数)を割り当ててSQL文を完成させます。  
バインドメカニズム(バインド機構)、準備済みSQL文、プリペアードステートメント、パラメータクエリ[^parameter-query]、ストアドプロシージャとも呼ばれます。  

[^parameter-query]: クエリの一部が変数のようになっており、その部分は実行時にバインドするクエリ。

これにより、入力データは数値定数や文字列定数として組み込まれるため、シングルクォートなどの特殊文字はエスケープ処理せずとも強制的にただのパラメータ文字として認識され、SQL文の意味も改変される危険性がなくなります。  
また、入力前にコンパイルされているので、SQLインジェクションによってSQL文を変更することが不可能になります。  
特殊文字のエスケープよりも有効な手法であり、*SQLインジェクション対策の最も有効的な方法*です。

## <a name="case6">ケース６ セカンドオーダSQLインジェクション</a>
最後に入力データに適切にサニタイジング処理を施している場合でも攻撃が可能となる、セカンドオーダSQLインジェクションについてご紹介しましょう。

### 攻撃手法
例によって[ケース１](#case1)と同じテーブルを利用し、「(1)ユーザ登録機能」 と「(2)パスワード変更機能」があるWebシステムを考えます。  

- 「(1)ユーザ登録機能」では「ユーザID」と「パスワード」を入力して新たにユーザを登録します。
- 「(2)パスワード変更機能」ではログイン後に、ログインしているユーザのパスワードを変更するもので、「旧パスワード」および「新パスワード」を入力してパスワードの変更を行います。

この、「パスワード変更機能」は以下のように二つのSQL文によって実行されるものとします。

<div class="code-box">
<div class="title">SQL1</div>
<pre>
SELECT * FROM ユーザマスタ WHERE ユーザID = '${userId}' AND パスワード = '${oldPasswd}'
</pre>
</div>

<div class="code-box">
<div class="title">SQL2</div>
<pre>
UPDATE ユーザマスタ SET パスワード = '${newPasswd}' WHERE ユーザID = <em>'取得したユーザID'</em>
</pre>
</div>

二つ目のUPDATE文で指定するユーザIDは、一つ目のSQL文で取得したユーザIDを用います。  
なお、適切にサニタイジング処理が行われているものとします。

セカンドオーダSQLインジェクションは、このように一度挿入されたデータが再利用されるような機能を利用して、間接的に攻撃を行う手法です。具体的には以下のようにパラメータを入力します。

### (1)ユーザ登録

以下のようにして新規登録します。

<table class="normal">
    <tr><td>ユーザID</td><td>admin' --</td></tr>
    <tr><td>パスワード</td><td>passwd</td></tr>
</table>

すると、*シングルクォートを正しくエスケープした*以下のようなINSERT文によりユーザが登録されます。

<div class="code-box">
<div class="title">SQL1</div>
<pre>
INSERT INTO ユーザマスタ VALUES ( 'admin<em>''</em> --', 'passwd' )
</pre>
</div>

結果、ユーザID「`admin' --`」としてユーザ登録されます。

<table class="normal">
    <caption>テーブル名：ユーザマスタ(登録後)</caption>
    <tr><th>ユーザID</th><th>パスワード</th></tr>
    <tr><td>admin</td><td>admin</td></tr>
    <tr><td>fumo</td><td>hoge</td></tr>
    <tr><td>cynthia</td><td>piyo</td></tr>
    <tr><td>rose</td><td>fuga</td></tr>
    <tr><td><strong>admin' --</strong></td><td><strong>passwd</strong></td></tr>
</table>

### (2)パスワード更新
次に「`admin' --`」のパスワードを変更するために、例えば旧パスワード「`passwd`」と、新パスワード「`passwd2`」を入力します。  
この入力により、以下SELECT文となり、ユーザIDを引き当てます。

<div class="code-box">
<div class="title">SQL1</div>
<pre>
SELECT * FROM ユーザマスタ WHERE ユーザID = 'admin'' --' AND パスワード = 'passwd'
</pre>
</div>

外部から受け取る値は*新パスワードだけなので、新パスワードのみエスケープ処理されます*。  
ユーザIDはエスケープされずにデータベースに格納された値「`admin' --`」がそのまま用いられます。

<div class="code-box">
<div class="title">SQL2</div>
<pre>
UPDATE ユーザマスタ SET パスワード = 'passwd2' WHERE ユーザID = 'admin' --''
</pre>
</div>

このSQL文の末尾の「`--''`」の部分は無視されるため、以下の「`admin`」のパスワードを「`passwd2`」に変更するSQL文が実行されることとなります。

<div class="code-box">
<div class="title">SQL2 (実行される部分)</div>
<pre>
UPDATE ユーザマスタ SET パスワード = 'passwd2' WHERE ユーザID = 'admin'
</pre>
</div>

悪意ある攻撃者はこの手法により、管理者「`admin`」のパスワードを自由に書き換えてしまうことが可能となります。

## <a name="workaround-methods-and-countermeasures-for-case6">ケース６の回避方法・対策</a>

一般のSQLインジェクション対策としては、バインド機構＋サニタイジングの組み合わせが採用されているが、*セカンドオーダSQLインジェクションはこれらの対策を潜り抜けて*実行されてしまいます。これは、SQLインジェクションを防ぐのに、*外部から受け取るパラメータのみエスケープしているとき*に発生します。

この攻撃も踏まえた正しいSQLインジェクション対策としては、*文字列連結でSQL文を構築しようとするすべての箇所でエスケープ処理を適切に行う*必要があります。  
*データベースに格納済みの値ももれなく行う必要がある*のです。

## <a name="supplement">補足</a>

### 2020-11-15追記
こちらの[元記事](https://npnl.hatenablog.jp/entry/20080412/1207965105)の方へはてなブックマークコメントをいただいていたものの中に、間違いを指摘して下さっているものありました。以下のような内容です。

> 力作だが対策には間違いが。特に、「; 受理しない」必要はまったくない。  
> これはIPAのセキュアプログラミング講座の悪影響と思われる（現在はセキュアプログラミング講座の方は修正済み）。2010/02/23

とのことです。私の方で確認が取れていない事項ですので、記事の方にはまだそのまま残してあります。内容につきましてはご自身でご判断の程よろしくお願いします。

## <a name="reference">参考</a>
{% include update_info.html created="2009-01-24" updated="2020-11-15" %}

### 参考記事
- [元記事](https://npnl.hatenablog.jp/entry/20080412/1207965105)
- [(Wikipedia) SQLインジェクション](http://ja.wikipedia.org/wiki/SQL%E3%82%A4%E3%83%B3%E3%82%B8%E3%82%A7%E3%82%AF%E3%82%B7%E3%83%A7%E3%83%B3)
- [(@IT) 今夜分かるSQLインジェクション対策](https://www.atmarkit.co.jp/ait/articles/0611/02/news127.html)

### 参考書籍
- {% include book/book_593.html %} {% comment %} テクニカルエンジニア 情報セキュリティ［午後］オリジナル問題集 2008年度版 {% endcomment %}
