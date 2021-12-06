---
title: SQL Serverでセッションを強制終了(kill)する
article_group_id: tips-group
display_order: 110
created: 2021-12-06
updated: 2021-12-06
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#手順">手順</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-06" updated="2021-12-06" %}</div>
とてつもない結果を引き寄せてしまうSQLを実行してしまったりして、結果がなかなか返ってこないときに、  
セッションを強制終了するやり方をメモしておきます。

# 手順
1. 強制終了対象のセッションIDを調べます。
1. `kill`を実行します。

{% include goto_pagetop.html %}

* * *
## <a name="手順">手順</a><a class="heading-anchor-permalink" href="#手順">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-06" updated="2021-12-06" %}</div>
### 強制終了対象のセッションIDを調べる
<div class="code-box no-title">
<pre>
SELECT conn.session_id, host_name, program_name,
    nt_domain, login_name, connect_time, last_request_end_time 
FROM sys.dm_exec_sessions AS sess
JOIN sys.dm_exec_connections AS conn
   ON sess.session_id = conn.session_id;
WHERE host_name = <em>'&lt;自分のホスト名&gt;'</em>
</pre>
</div>
- `<自分のホスト名>`の部分はコマンドプロンプトを立ち上げて`hostname`コマンドなどで調べておいて下さい。
- 出力結果の`session_id`が`セッションID`になります。

### killを実行
<div class="code-box-syntax no-title">
<pre>
KILL <em>&lt;セッションID&gt;</em>
</pre>
</div>
<div class="code-box">
<div class="title">例:セッションID 64 を強制終了する場合</div>
<pre>
KILL <em>64</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-06" updated="2021-12-06" %}</div>
- [(Microsoft \|Docs) KILL (Transact-SQL)](https://docs.microsoft.com/ja-jp/sql/t-sql/language-elements/kill-transact-sql)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
