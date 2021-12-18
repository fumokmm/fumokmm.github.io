---
chapter_no: 20
chapter_title: ケース２ SQLインジェクション攻撃による任意のSQL文実行 〜セミコロンで分割〜
created: 2008-04-12
updated: 2021-04-01
---
さて次は、[ケース１](#ケース１ SQLインジェクション攻撃による不正ログイン 〜シングルクォート挿入〜)の応用例として任意のSQL文を実行させる手法をご紹介しましょう。  
ここではレコードの全件削除を例にとって説明します。

### 攻撃手法
SQL文におけるセミコロン「`;`」は、ステートメントを分割するデリミタです。この「`;`」を使って複数のSQL文を連結させることができます。  
利用するテーブルは[ケース１](#ケース１ SQLインジェクション攻撃による不正ログイン 〜シングルクォート挿入〜)と同じものとして、今回は以下のようにパラメータを入力してみます。

<table class="normal">
	<tr>
		<th markdown="span">パラメータ</th>
		<th markdown="span">入力する値</th>
	</tr>
	<tr>
		<td><span class="code-font">$userId</span></td>
		<td><span class="code-font">(何も入力しない)</span></td>
	</tr>
	<tr>
		<td><span class="code-font">$passwd</span></td>
		<td><span class="code-font">'; DELETE FROM ユーザマスタ WHERE 'A' = 'A</span></td>
	</tr>
</table>

さて、どんなSQLが生成されるでしょうか。

```:SQL
SELECT * FROM ユーザマスタ WHERE ユーザID = '' AND パスワード = ''{em{; DELETE FROM ユーザマスタ WHERE 'A' = 'A'}em}
```

このようになります。  
これは以下のように二つのSQL文が続けて実行されることを意味します。

```:SQL
SELECT * FROM ユーザマスタ WHERE ユーザID = '' AND パスワード = '';
DELETE FROM ユーザマスタ WHERE 'A' = 'A'
```

一つ目のSELECT文は実行されますが無害です。  
このようにパラメータに「`;`」を含ませることで、WHERE句を一旦終端させ、全件削除のDELETE文をさせることができます。  
なお、「`'`」の数をあわせるために、ケース１と同様に「`'A' = 'A'`」という恒真式にして、DELETE文のWHERE句を無効化しています。
