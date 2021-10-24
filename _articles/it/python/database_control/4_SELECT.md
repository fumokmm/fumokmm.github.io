---
chapter_no: 4
chapter_title: SELECT
created: 2021-10-24
updated: 2021-10-24
---
### SELECTの実行
カーソルの`execute()`にてSELECT文を実行します。  
```
cursor.execute("select * from M_USER")
```

### フェッチ処理
executeした後に、fetch系メソッドを使ってレコードを取り出します。  
fetch系メソッドには以下の種類があります。
<table class="normal">
	<tr>
		<th markdown="span">メソッド名</th>
		<th markdown="span">説明</th>
		<th markdown="span">使用例</th>
	</tr>
	<tr>
		<td markdown="span">fetchall</td>
		<td markdown="span">SQLクエリの結果を全レコード取得。1件も取得できないときは空リストが返却される。</td>
		<td markdown="span">rows = cursor.fetchall()</td>
	</tr>
	<tr>
		<td markdown="span">fetchmany</td>
		<td markdown="span">SQLクエリの結果を指定したレコード数づつ順次取得。1件も取得できないときは空リストが返却される。</td>
		<td markdown="span">rows = cursor.fetchmany()</td>
	</tr>
	<tr>
		<td markdown="span">fetchone</td>
		<td markdown="span">SQLクエリの結果を1レコードづつ順次取得。取得できないときはNoneが返却される。</td>
		<td markdown="span">row = cursor.fetchone()</td>
	</tr>
	<tr>
		<td markdown="span">fetchval</td>
		<td markdown="span">最初の行の最初の値を取得 count(*) as cnt みたいなときに便利。fetchone()[0]と同じ。</td>
		<td markdown="span">value = cursor.fetchval()</td>
	</tr>
</table>

### 1件ずつ取得
`fetchone()`は全件取得すると`None`を返すので、以下のように書くと1件ずつ全件処理できます。
```:1件ずつ処理
while True:
    row = cursor{em{.fetchone()}em}
    if not row:
        break
    print('id:', row.user_id)
```

### 全件取得
`fetchall()`で取得結果を全件処理します。
```:全件処理
cursor.execute("select user_id, user_name from users")
rows = cursor{em{.fetchall()}em}
for row in rows:
    print(row.user_id, row.user_name)

cursor.close()
```
rowのデータを取得するには、インデックスを使う方法とカラム名を使う方法があります。
```:データの取り出し
print('name:', row{em{[1]}em})         {em:comment{# インデックスで結果を取得(0始まり)}em}
print('name:', row{em{.user_name}em})  {em:comment{# 名前で結果を取得}em}
```

もし、取得結果を使いまわす予定がないなら、カーソルがイテレータになっているため、そのまま以下のようにすることもできます。
```:イテレータで回す
cursor.execute("select user_id, user_name from users"):
for row in {em{cursor}em}:
    print(row.user_id, row.user_name)
```
`execute`はカーソルを返すので、さらに短く書けます。
```:イテレータで回す(もっと短く)
for row in cursor.execute("select user_id, user_name from users"):
    print(row.user_id, row.user_name)
```

### 指定件数ずつ取得
`fetchall()`だと件数が多いとメモリを大量に消費してしまうので、`fetchmany()`で件数を絞って取得することでメモリを節約できます。
```:1000件ずつ取得し処理
cursor.execute("select user_id, user_name from users")

row_cnt = 1000
rows = cursor{em{.fetchmany(row_cnt)}em}
while len(rows) > 0:
    for row in rows:
        print(row.user_id, row.user_name)
    # 次を取得
    rows = cursor{em{.fetchmany(row_cnt)}em}

cursor.close()
```

### パラメータ
`?`を使います。
```
cursor.execute("""
    select user_id, user_name
      from users
     where last_logon < {em{?}em}
       and bill_overdue = {em{?}em}
"""{em:blue{, datetime.date(2001, 1, 1), 'y'}em})
```
パラメータを渡す部分はこういう書き方もできます。
```
cursor.execute("""
    select user_id, user_name
      from users
     where last_logon < {em{?}em}
       and bill_overdue = {em{?}em}
"""{em:blue{, [datetime.date(2001, 1, 1), 'y']}em})
```
- [SQLインジェクション]({% link _it_articles/database/sql_injection.md %})を防ぐためにも是非パラメータを使いましょう。
