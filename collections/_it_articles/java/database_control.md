---
title: Javaでデータベース操作
display_order: 100
created: 2021-02-09
updated: 2021-02-09
---
こちらはJavaでデータベース操作を行う方法のメモです。  

## <a name="index">目次</a><a href="#目次">§</a>

<ul id="index_ul">
<li><a href="#read">データの読み取り</a></li>
<li><a href="#related">関連メモ</a></li>
</ul>

* * *
## <a name="read">データの読み取り</a><a href="#read">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-02-09" updated="2021-02-09" %}</div>
JDBCを利用してデータの読み取りを行うサンプルです。  
Javaの基本的な説明は端折っております。

<div class="code-box">
<div class="title">SQL Serverに接続しデータを読み取る</div>
<pre>
package thinktwice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

class DBReadSample {
    public static void main(String... args) throws ClassNotFoundException, SQLException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

        final String sql = "SELECT * FROM [dbo].[User]";
        try (
            final Connection conn = DriverManager.getConnection("jdbc:sqlserver://<em>MUNCHKIN</em>;databaseName=<em>Experiment</em>;user=<em>sa</em>;password=<em>sa</em>;");
            final PreparedStatement ps = conn.prepareStatement(sql);
            final ResultSet rs = ps.executeQuery();
        ) {
            while(rs.next()) {
                System.out.println(rs.getString("ID"));
                System.out.println(rs.getString("Name"));
                System.out.println(rs.getInt("Age"));
                System.out.println(rs.getBigDecimal("BillingAmount"));
            }
        }
    }
}
</pre>
</div>

### ポイント
- 動作させるにはJDBCのjarへのクラスパスを通しておく必要があります。
- 接続文字列部分はSQL Server用のユーザ指定版となります。
  - 強調部分は適宜変更して下さい。(接続文字列部分)
- try-with-resources構文を利用していますので、少なくともバージョンはJava7以上で動作させて下さい。

### 参考
- [(SQL Docs) Building the Connection URL](https://docs.microsoft.com/en-us/sql/connect/jdbc/building-the-connection-url?view=sql-server-ver15)
- [(GitHub) The Microsoft JDBC Driver for SQL Server](https://github.com/microsoft/mssql-jdbc)
- [(The Java™ Tutorials) The try-with-resources Statement](https://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html)

{% include goto_pagetop.html %}

* * *
## <a name="related">関連メモ</a><a href="#related">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-02-09" updated="2021-02-09" %}</div>
### 他言語でのデータベース操作
- [VBAでデータベース操作]({% link _it_articles/vba/database_control.md %})

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
