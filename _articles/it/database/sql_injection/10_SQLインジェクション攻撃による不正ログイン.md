---
chapter_no: 10
chapter_title: ケース１ SQLインジェクション攻撃による不正ログイン 〜シングルクォート挿入〜
created: 2008-04-12
updated: 2021-04-01
---
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

```:SQL
SELECT * FROM ユーザマスタ WHERE ユーザID = '$userId' AND パスワード = '$passwd'
```

ユーザによって入力されたユーザID、パスワードをそれぞれ`$userId`、`$passwd`に代入し、上記SQLにてその存在が確認できればログインできるWEBページがあります。
悪意あるユーザがユーザID「`fumo`」としてパスワードを入力せずにログインを試みる際に入力するパラメータは、以下のようになります。

<dl>
  <dt>$userId</dt>
  <dd>fumo</dd>
  <dt>$passwd</dt>
  <dd>' OR 'A' = 'A</dd>
</dl>

結果、生成されるSQL文は以下のようなものになります。

```:SQL
SELECT * FROM ユーザマスタ WHERE ユーザID = 'fumo' AND {em{パスワード = '' OR 'A' = 'A'}em}
```

パラメータとして入力値「`'`」を含ませることで、パスワードに関するWHERE句の条件式を一旦終端させ、次にORを含ませると、「`'A' = 'A'`」という恒真式がORの対象になります。  
よって、WHERE句全体が常に真となり、パスワードを入力せずにユーザID「`fumo`」としてログインすることが可能となります。

ちなみに、「`'A' = 'A`」の部分は「`'1' = '1`」でも「`'' = '`」でも大丈夫です。OR以降が常に真となるような恒真式が記述されることが重要です。
