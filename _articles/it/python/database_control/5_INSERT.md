---
chapter_no: 5
chapter_title: INSERT
created: 2021-10-24
updated: 2021-10-24
---
カーソルの`execute()`にてINSERT文を実行します。  
処理結果の件数は、カーソルの`.rowcount`で取得できます。  
実行後は、コネクションの`commit()`もしくは`rollback()`を実行して、処理結果をDBへ確定させます。
```
cursor.execute("insert into products(id, name) values ('pyodbc', 'awesome library')")
cnxn.commit()
```

INSERT時は通常処理件数は1件ですが、複数件INSERTした場合などはその件数が`.rowcount`で取得できます。
```
cursor = cnxn.cursor()
cursor.execute("""
    insert into [dbo].[User]
    values ('A011', 'あああ', 10, null, 11, 'C'),
           ('A012', 'いいい', 10, null, 11, 'C'),
           ('A013', 'ううう', 10, null, 11, 'C')
""")
print(cursor{em{.rowcount}em}) {em:comment{# => 3}em}
cnxn.commit()
```

パラメータも使えます。
```
cursor.execute("insert into products(id, name) values ({em{?}em}, {em{?}em})"{em:blue{, 'pyodbc', 'awesome library'}em})
cnxn.commit()
```
