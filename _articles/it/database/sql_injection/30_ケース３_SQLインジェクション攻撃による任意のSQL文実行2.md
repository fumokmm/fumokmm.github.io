---
chapter_no: 30
chapter_title: ケース３ SQLインジェクション攻撃による任意のSQL文実行 〜コメントアウトで無効化〜
created: 2008-04-12
updated: 2021-04-01
---
更に応用例として、コメントアウト「`--`」を使用してパスワード入力部分のSQLを無効化する手法をご紹介しましょう。

### 攻撃手法
利用するテーブルは[ケース１](#ケース１ SQLインジェクション攻撃による不正ログイン 〜シングルクォート挿入〜)と同じものとして、以下のようにパラメータを入力してみます。

<table class="normal">
	<tr>
		<th markdown="span">パラメータ</th>
		<th markdown="span">入力する値</th>
	</tr>
	<tr>
		<td><span class="code-font">$userId</span></td>
		<td><span class="code-font">'; DELETE FROM ユーザマスタ WHERE 'A' = 'A' --</span></td>
	</tr>
	<tr>
		<td><span class="code-font">$passwd</span></td>
		<td><span class="code-font">(何も入力しない)</span></td>
	</tr>
</table>

これで、以下のようなSQL文が実行される。

```:SQL
SELECT * FROM ユーザマスタ WHERE ユーザID = '';
DELETE FROM ユーザマスタ WHERE 'A' = 'A' {em{--' AND パスワード = ''}em}
```

「`--`」以下の「`' AND パスワード = ''`」の部分はコメントアウトされるので無効となり、結果として[ケース２](#ケース２ SQLインジェクション攻撃による任意のSQL文実行 〜セミコロンで分割〜)と同様に全件削除のSQL文として機能します。