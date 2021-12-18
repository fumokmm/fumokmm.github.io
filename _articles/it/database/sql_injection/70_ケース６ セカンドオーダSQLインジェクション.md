---
chapter_no: 70
chapter_title: ケース６ セカンドオーダSQLインジェクション
created: 2008-04-12
updated: 2021-04-01
---
最後に入力データに適切にサニタイジング処理を施している場合でも攻撃が可能となる、セカンドオーダSQLインジェクションについてご紹介しましょう。

### 攻撃手法
例によって[ケース１](#ケース１ SQLインジェクション攻撃による不正ログイン 〜シングルクォート挿入〜)と同じテーブルを利用し、「(1)ユーザ登録機能」 と「(2)パスワード変更機能」があるWebシステムを考えます。  

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
