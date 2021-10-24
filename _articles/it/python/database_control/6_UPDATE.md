---
chapter_no: 6
chapter_title: UPDATE
created: 2021-10-24
updated: 2021-10-24
---
カーソルの`execute()`にてUPDATE文を実行します。  
処理結果の件数は、カーソルの`.rowcount`で取得できます。  
実行後は、コネクションの`commit()`もしくは`rollback()`を実行して、処理結果をDBへ確定させます。
```
cursor = cnxn.cursor()
cursor.execute("""
    update [dbo].[User]
    set BillingAmount = BillingAmount * 1.01
    where BillingAmount is not null
""")
print(cursor{em{.rowcount}em})
cnxn.commit()
```

`execute()`はcursor自身を返すので、以下のように`.rowcount`で終わるような書き方もできます。
```
cursor = cnxn.cursor()
{em:blue{upd_count}em} = cursor.execute("""
    update [dbo].[User]
    set BillingAmount = BillingAmount * 1.01
    where BillingAmount is not null
"""){em{.rowcount}em}
print({em:blue{upd_count}em})
cnxn.commit()
```
