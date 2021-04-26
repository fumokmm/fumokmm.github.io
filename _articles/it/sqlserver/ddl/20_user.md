---
chapter_no: 20
chapter_id: user
chapter_title: USER
created: 2021-04-26
updated: 2021-04-26
---
ユーザー関連のメモです。

### データベースユーザー作成

データベースにログイン情報と一致するユーザーを作成します。
<div class="code-box-syntax">
<div class="title">ユーザー情報の作成(ログイン情報と一致するユーザー)</div>
<pre>
USE 「データベース]
GO
CREATE USER <em>ログインID</em>
GO
</pre>
</div>

データベースにログイン情報と一致しないユーザーを作る場合は以下のように`FOR LOGIN`を追加します。
<div class="code-box-syntax">
<div class="title">ユーザー情報の作成(ログインIDを指定)</div>
<pre>
USE 「データベース]
GO
CREATE USER ログインID <em>FOR LOGIN [ログインID]</em>
GO
</pre>
</div>

### ロール割り当て

ロールを割り当てます。
<div class="code-box-syntax">
<div class="title">ロールを割り当て</div>
<pre>
USE [データベース]
GO
EXEC <em class="blue">sp_addrolemember</em> <em>'db_owner', 'ログインID'</em>
GO
</pre>
</div>

### パスワード変更

パスワードを変更します。
<div class="code-box-syntax">
<div class="title">パスワードを変更</div>
<pre>
ALTER LOGIN ログインID
WITH
  PASSWORD = <em>'新パスワード'</em>
GO
</pre>
</div>

### 参考
- [(Qiita) \[Microsoft\] SQLから始めるSQL Serverデータベース](https://qiita.com/sengoku/items/d628d0ac50ef54da4268)