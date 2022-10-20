---
title: SQL Serverでセッションの一覧を確認する
article_group_id: control-group
display_order: 70
created: 2022-02-22
updated: 2022-02-22
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#sys.dm_exec_sessions">sys.dm_exec_sessions</a></li>
<li><a href="#関連メモ">関連メモ</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-22" updated="2022-02-22" %}</div>
`sys.dm_exec_sessions`からセッション情報が取得できます。

{% include goto_pagetop.html %}

* * *
## <a name="sys.dm_exec_sessions">sys.dm_exec_sessions</a><a class="heading-anchor-permalink" href="#sys.dm_exec_sessions">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-22" updated="2022-02-22" %}</div>
<div class="code-box">
<div class="title">SQL</div>
<div class="copy-button">Copy</div>
<pre>
select * from <em>sys.dm_exec_sessions</em> where host_name is not NULL
</pre>
</div>

### ちょっと加工して取得
<div class="code-box">
<div class="title">SQL</div>
<div class="copy-button">Copy</div>
<pre>
SELECT conn.session_id, host_name, program_name,
    nt_domain, login_name, connect_time, last_request_end_time 
FROM <em>sys.dm_exec_sessions</em> AS sess
JOIN sys.dm_exec_connections AS conn
   ON sess.session_id = conn.session_id;
WHERE host_name = <em class="blue">'&lt;自分のホスト名&gt;'</em>
</pre>
</div>
- `<自分のホスト名>`の部分はコマンドプロンプトを立ち上げて`hostname`コマンドなどで調べておいて下さい。

{% include goto_pagetop.html %}

* * *
## <a name="関連メモ">関連メモ</a><a class="heading-anchor-permalink" href="#関連メモ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-22" updated="2022-02-22" %}</div>
- [SQL Serverでセッションを強制終了(KILL)する]({% link _it_articles/sqlserver/kill_a_session.md %})

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-22" updated="2022-02-22" %}</div>
- [(くらげのChangeLog) SQL Server で現在接続中のセッションを確認するSQL](https://culage.hatenablog.com/entry/20130619/1371567600)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
