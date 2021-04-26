---
chapter_no: 10
chapter_id: login
chapter_title: LOGIN
created: 2021-04-26
updated: 2021-04-26
---
ログイン関連のメモです。

<div class="code-box-syntax">
<div class="title">ログイン情報の作成</div>
<pre>
CREATE LOGIN <em>ログインID</em>
WITH
  PASSWORD = <em>'パスワード'</em>,
  DEFAULT_DATABASE = <em>データベース名</em>,
  CHECK_EXPIRATION = OFF, -- 有効期限チェックしない
  CHECK_POLICY = OFF -- パスワードの複雑性要件をチェックしない
GO
</pre>
</div>

### 参考
- [(Qiita) \[Microsoft\] SQLから始めるSQL Serverデータベース](https://qiita.com/sengoku/items/d628d0ac50ef54da4268)