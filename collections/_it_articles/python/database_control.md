---
title: Pythonでpyodbcによるデータベース操作
article_group_id: basis-group
display_order: 20
created: 2021-10-24
updated: 2021-10-24
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#pyodbc概要">pyodbc概要</a></li>
<li><a href="#pyodbcのインストール">pyodbcのインストール</a></li>
<li><a href="#コネクション取得">コネクション取得</a></li>
<li><a href="#SELECT">SELECT</a></li>
<li><a href="#INSERT">INSERT</a></li>
<li><a href="#UPDATE">UPDATE</a></li>
<li><a href="#DELETE">DELETE</a></li>
<li><a href="#オートコミット">オートコミット</a></li>
<li><a href="#トランザクション">トランザクション</a></li>
<li><a href="#Tips">Tips</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="pyodbc概要">pyodbc概要</a><a class="heading-anchor-permalink" href="#pyodbc概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-24" updated="2021-10-24" %}</div>
- [pyodbc](https://mkleehammer.github.io/pyodbc/)はPython製のODBC bridgeです。
- pyodbcは[Python Database API](https://www.python.org/dev/peps/pep-0249/)の実装のひとつらしいです。

{% include goto_pagetop.html %}

* * *
## <a name="pyodbcのインストール">pyodbcのインストール</a><a class="heading-anchor-permalink" href="#pyodbcのインストール">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-24" updated="2021-10-24" %}</div>
インストールは[pip]({% link _it_articles/python/pip.md %})にて行うのが簡単です。
<div class="code-box no-title">
<pre>
pip install pyodbc
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="コネクション取得">コネクション取得</a><a class="heading-anchor-permalink" href="#コネクション取得">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-24" updated="2021-10-24" %}</div>
コネクションは`pyodbc.connect()`で取得します。  
ここでは参考に`SQL Server`を使った例を紹介します。
<div class="code-box no-title">
<pre>
import pyodbc

<em class="comment"># ODBCドライバ, サーバ名, データベース名, ユーザID, パスワードなどを指定します</em>
cnxn = pyodbc.<em>connect(</em>'DRIVER=<em class="blue">{SQL Server}</em>;SERVER=<em class="blue">localhost</em>;DATABASE=<em class="blue">testdb</em>;UID=<em class="blue">me</em>;PWD=<em class="blue">pass</em>'<em>)</em>
<em class="comment"># DNSを使う場合はこんな感じ</em>
cnxn = pyodbc.<em>connect(</em>'DSN=<em class="blue">test</em>;PWD=<em class="blue">password</em>'<em>)</em>

<em class="comment">コネクションからカーソルを作成します</em>
cursor = cnxn.cursor()
</pre>
</div>
- まず、`pyodbc`の`connect()`を使ってODBCドライバ, サーバ名, データベース名, ユーザID, パスワードなどを指定しコネクションを取得します。
- 次に、コネクションから`cursor()`を使ってカーソルを取得します。
- カーソルはSQLクエリを実行するときに利用するものです。

### SQLクエリの実行
SQLクエリを実行するには、カーソルの`execute()`を使います。  
<div class="code-box no-title">
<pre>
cursor.execute(<em>"&lt;SQLクエリ&gt;"</em>)
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="SELECT">SELECT</a><a class="heading-anchor-permalink" href="#SELECT">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-24" updated="2021-10-24" %}</div>
### SELECTの実行
カーソルの`execute()`にてSELECT文を実行します。  
<div class="code-box no-title">
<pre>
cursor.execute("select * from M_USER")
</pre>
</div>

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
<div class="code-box">
<div class="title">1件ずつ処理</div>
<pre>
while True:
    row = cursor<em>.fetchone()</em>
    if not row:
        break
    print('id:', row.user_id)
</pre>
</div>

### 全件取得
`fetchall()`で取得結果を全件処理します。
<div class="code-box">
<div class="title">全件処理</div>
<pre>
cursor.execute("select user_id, user_name from users")
rows = cursor<em>.fetchall()</em>
for row in rows:
    print(row.user_id, row.user_name)

cursor.close()
</pre>
</div>
rowのデータを取得するには、インデックスを使う方法とカラム名を使う方法があります。
<div class="code-box">
<div class="title">データの取り出し</div>
<pre>
print('name:', row<em>[1]</em>)         <em class="comment"># インデックスで結果を取得(0始まり)</em>
print('name:', row<em>.user_name</em>)  <em class="comment"># 名前で結果を取得</em>
</pre>
</div>

もし、取得結果を使いまわす予定がないなら、カーソルがイテレータになっているため、そのまま以下のようにすることもできます。
<div class="code-box">
<div class="title">イテレータで回す</div>
<pre>
cursor.execute("select user_id, user_name from users"):
for row in <em>cursor</em>:
    print(row.user_id, row.user_name)
</pre>
</div>
`execute`はカーソルを返すので、さらに短く書けます。
<div class="code-box">
<div class="title">イテレータで回す(もっと短く)</div>
<pre>
for row in cursor.execute("select user_id, user_name from users"):
    print(row.user_id, row.user_name)
</pre>
</div>

### 指定件数ずつ取得
`fetchall()`だと件数が多いとメモリを大量に消費してしまうので、`fetchmany()`で件数を絞って取得することでメモリを節約できます。
<div class="code-box">
<div class="title">1000件ずつ取得し処理</div>
<pre>
cursor.execute("select user_id, user_name from users")

row_cnt = 1000
rows = cursor<em>.fetchmany(row_cnt)</em>
while len(rows) &gt; 0:
    for row in rows:
        print(row.user_id, row.user_name)
    # 次を取得
    rows = cursor<em>.fetchmany(row_cnt)</em>

cursor.close()
</pre>
</div>

### パラメータ
`?`を使います。
<div class="code-box no-title">
<pre>
cursor.execute("""
    select user_id, user_name
      from users
     where last_logon &lt; <em>?</em>
       and bill_overdue = <em>?</em>
"""<em class="blue">, datetime.date(2001, 1, 1), 'y'</em>)
</pre>
</div>
パラメータを渡す部分はこういう書き方もできます。
<div class="code-box no-title">
<pre>
cursor.execute("""
    select user_id, user_name
      from users
     where last_logon &lt; <em>?</em>
       and bill_overdue = <em>?</em>
"""<em class="blue">, [datetime.date(2001, 1, 1), 'y']</em>)
</pre>
</div>
- [SQLインジェクション]({% link _it_articles/database/sql_injection.md %})を防ぐためにも是非パラメータを使いましょう。

{% include goto_pagetop.html %}

* * *
## <a name="INSERT">INSERT</a><a class="heading-anchor-permalink" href="#INSERT">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-24" updated="2021-10-24" %}</div>
カーソルの`execute()`にてINSERT文を実行します。  
処理結果の件数は、カーソルの`.rowcount`で取得できます。  
実行後は、コネクションの`commit()`もしくは`rollback()`を実行して、処理結果をDBへ確定させます。
<div class="code-box no-title">
<pre>
cursor.execute("insert into products(id, name) values ('pyodbc', 'awesome library')")
cnxn.commit()
</pre>
</div>

INSERT時は通常処理件数は1件ですが、複数件INSERTした場合などはその件数が`.rowcount`で取得できます。
<div class="code-box no-title">
<pre>
cursor = cnxn.cursor()
cursor.execute("""
    insert into [dbo].[User]
    values ('A011', 'あああ', 10, null, 11, 'C'),
           ('A012', 'いいい', 10, null, 11, 'C'),
           ('A013', 'ううう', 10, null, 11, 'C')
""")
print(cursor<em>.rowcount</em>) <em class="comment"># =&gt; 3</em>
cnxn.commit()
</pre>
</div>

パラメータも使えます
<div class="code-box no-title">
<pre>
cursor.execute("insert into products(id, name) values (<em>?</em>, <em>?</em>)"<em class="blue">, 'pyodbc', 'awesome library'</em>)
cnxn.commit()
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="UPDATE">UPDATE</a><a class="heading-anchor-permalink" href="#UPDATE">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-24" updated="2021-10-24" %}</div>
カーソルの`execute()`にてUPDATE文を実行します。  
処理結果の件数は、カーソルの`.rowcount`で取得できます。  
実行後は、コネクションの`commit()`もしくは`rollback()`を実行して、処理結果をDBへ確定させます。
<div class="code-box no-title">
<pre>
cursor = cnxn.cursor()
cursor.execute("""
    update [dbo].[User]
    set BillingAmount = BillingAmount * 1.01
    where BillingAmount is not null
""")
print(cursor<em>.rowcount</em>)
cnxn.commit()
</pre>
</div>

`execute()`はcursor自身を返すので、以下のように`.rowcount`で終わるような書き方もできます。
<div class="code-box no-title">
<pre>
cursor = cnxn.cursor()
<em class="blue">upd_count</em> = cursor.execute("""
    update [dbo].[User]
    set BillingAmount = BillingAmount * 1.01
    where BillingAmount is not null
""")<em>.rowcount</em>
print(<em class="blue">upd_count</em>)
cnxn.commit()
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="DELETE">DELETE</a><a class="heading-anchor-permalink" href="#DELETE">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-24" updated="2021-10-24" %}</div>
カーソルの`execute()`にてDELETE文を実行します。  
処理結果の件数は、カーソルの`.rowcount`で取得できます。  
実行後は、コネクションの`commit()`もしくは`rollback()`を実行して、処理結果をDBへ確定させます。
<div class="code-box no-title">
<pre>
cursor = cnxn.cursor()
cursor.execute("delete from products where id &lt;&gt; ?", 'pyodbc')
print(cursor.rowcount, 'products deleted')
cnxn.commit()
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="オートコミット">オートコミット</a><a class="heading-anchor-permalink" href="#オートコミット">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-24" updated="2021-10-24" %}</div>
pyodbcではデフォルトでオートコミットは`False`となっています。  
> Note, this whole article is relevant only when autocommit is set to False on the pyodbc connection (False is the default).
> 
> [Database Transaction Management](https://github.com/mkleehammer/pyodbc/wiki/Database-Transaction-Management)

もし明示的に`True`にする場合、以下のようにします。
<div class="code-box">
<div class="title">取得時にTrueにする</div>
<pre>
cnxn = pyodbc.connect(conn_str, autocommit=True)
</pre>
</div>
<div class="code-box">
<div class="title">取得後にTrueにする</div>
<pre>
cnxn.autocommit = False  # enable transactions
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="トランザクション">トランザクション</a><a class="heading-anchor-permalink" href="#トランザクション">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-24" updated="2021-10-24" %}</div>
トランザクションは[オートコミット](#オートコミット)が`False`の時に利用できます。  
トランザクション関連のメソッドは以下。
<table class="normal">
	<tr>
		<th markdown="span">メソッド名</th>
		<th markdown="span">説明</th>
	</tr>
	<tr>
		<td markdown="span">commit</td>
		<td markdown="span">トランザクションをコミットします。</td>
	</tr>
	<tr>
		<td markdown="span">rollback</td>
		<td markdown="span">トランザクションをコミットします。</td>
	</tr>
	<tr>
		<td markdown="span">close</td>
		<td markdown="span">コネクションをクローズします。</td>
	</tr>
</table>

- コミットするときは明示的に`commit()`を呼び出すようにします。
- `close()`した時に常に`rollback()`が呼び出されます。

### トランザクションの分離レベル
ODBCでは、以下4つの分離レベルがサポートされています。
<table class="normal">
	<tr>
		<th markdown="span">トランザクションの分離レベル</th>
	</tr>
	<tr>
		<td markdown="span">SQL_TXN_READ_UNCOMMITTED</td>
	</tr>
	<tr>
		<td markdown="span">SQL_TXN_READ_COMMITTED</td>
	</tr>
	<tr>
		<td markdown="span">SQL_TXN_REPEATABLE_READ</td>
	</tr>
	<tr>
		<td markdown="span">SQL_TXN_SERIALIZABLE</td>
	</tr>
</table>

トランザクションの分離を設定するには、コネクションの`.set_attr`を使って`pyodbc.SQL_ATTR_TXN_ISOLATION`に設定します。
<div class="code-box no-title">
<pre>
cnxn = pyodbc.connect(conn_str, autocommit=True)
cnxn<em>.set_attr(</em><em class="blue">pyodbc.SQL_ATTR_TXN_ISOLATION, pyodbc.SQL_TXN_SERIALIZABLE</em><em>)</em>
cnxn.autocommit = False  <em class="comment"># enable transactions</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="Tips">Tips</a><a class="heading-anchor-permalink" href="#Tips">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-24" updated="2021-10-24" %}</div>
### SQLクエリを書く時
SQLではシングルクォート(`'`)が文字列の括りに使われるので、SQL文を括るにはダブルクォート(`"`)を使うとよいです。  
<div class="code-box">
<div class="title">ダブルクォートで括る</div>
<pre>
deleted = cursor.execute(<em>"</em>delete from products where id &lt;&gt; 'pyodbc'<em>"</em>).rowcount
</pre>
</div>

### 名前付きカラム
`as`で名前を付けると、`row`からプロパティのようにアクセス可能です。
<div class="code-box">
<div class="title">asで名前を付けて取得</div>
<pre>
row = cursor.execute("select count(*) <em>as user_count</em> from users").fetchone()
print('%s users' % row<em>.user_count</em>)
</pre>
</div>

### dedent
`textwrap`の`dedent`を使うと、SQLの前後の余分なスペースを除去してくれます。お好みで。
<div class="code-box no-title">
<pre>
import textwrap
sql = <em>textwrap.dedent(</em>"""
    select p.date_of_birth,
           p.email,
           a.city
    from person as p
    left outer join address as a on a.address_id = p.address_id
    where p.status = 'active'
      and p.name = ?
"""<em>)</em>
rows = cursor.execute(sql, 'John Smith').fetchall()
</pre>
</div>
- [(textwrap — Text wrapping and filling) dedent](https://docs.python.org/3/library/textwrap.html#textwrap.dedent)

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-24" updated="2021-10-24" %}</div>
### 参照
- [(GitHub) pyodbc](https://mkleehammer.github.io/pyodbc/)
- [(pyodbc) Documentation](https://github.com/mkleehammer/pyodbc/wiki)
- [PEP 249 -- Python Database API Specification v2.0](https://www.python.org/dev/peps/pep-0249/)
- [(textwrap — Text wrapping and filling) dedent](https://docs.python.org/3/library/textwrap.html#textwrap.dedent)

### 参考サイト
- [(GIS奮闘記) pyodbcを使ってPythonでDBを操作しよう　～SQL Server編～](https://www.gis-py.com/entry/py-db)
- [(DevelopersIO) Pythonモジュールpyodbcでのfetch処理](https://dev.classmethod.jp/articles/pyodbc-fetch/)
- [(Qiita) トランザクション分離レベルについてのまとめ](https://qiita.com/song_ss/items/38e514b05e9dabae3bdb)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
