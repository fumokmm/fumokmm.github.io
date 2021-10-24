---
chapter_no: 10
chapter_title: Tips
created: 2021-10-24
updated: 2021-10-24
---
### SQLクエリを書く時
SQLではシングルクォート(`'`)が文字列の括りに使われるので、SQL文を括るにはダブルクォート(`"`)を使うとよいです。  
```:ダブルクォートで括る
deleted = cursor.execute({em{"}em}delete from products where id <> 'pyodbc'{em{"}em}).rowcount
```

### 名前付きカラム
`as`で名前を付けると、`row`からプロパティのようにアクセス可能です。
```:asで名前を付けて取得
row = cursor.execute("select count(*) {em{as user_count}em} from users").fetchone()
print('%s users' % row{em{.user_count}em})
```

### dedent
`textwrap`の`dedent`を使うと、SQLの前後の余分なスペースを除去してくれます。お好みで。
```
import textwrap
sql = {em{textwrap.dedent(}em}"""
    select p.date_of_birth,
           p.email,
           a.city
    from person as p
    left outer join address as a on a.address_id = p.address_id
    where p.status = 'active'
      and p.name = ?
"""{em{)}em}
rows = cursor.execute(sql, 'John Smith').fetchall()
```
- [(textwrap — Text wrapping and filling) dedent](https://docs.python.org/3/library/textwrap.html#textwrap.dedent)
