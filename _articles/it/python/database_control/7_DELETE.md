---
chapter_no: 7
chapter_title: DELETE
created: 2021-10-24
updated: 2021-10-24
---
カーソルの`execute()`にてDELETE文を実行します。  
処理結果の件数は、カーソルの`.rowcount`で取得できます。  
実行後は、コネクションの`commit()`もしくは`rollback()`を実行して、処理結果をDBへ確定させます。
```
cursor = cnxn.cursor()
cursor.execute("delete from products where id <> ?", 'pyodbc')
print(cursor.rowcount, 'products deleted')
cnxn.commit()
```
