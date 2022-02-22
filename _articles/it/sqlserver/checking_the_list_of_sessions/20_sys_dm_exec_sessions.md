---
chapter_no: 20
chapter_title: sys.dm_exec_sessions
created: 2022-02-22
updated: 2022-02-22
---
```:SQL
select * from {em{sys.dm_exec_sessions}em} where host_name is not NULL
```

### ちょっと加工して取得
```:SQL
SELECT conn.session_id, host_name, program_name,
    nt_domain, login_name, connect_time, last_request_end_time 
FROM {em{sys.dm_exec_sessions}em} AS sess
JOIN sys.dm_exec_connections AS conn
   ON sess.session_id = conn.session_id;
WHERE host_name = {em:blue{'<自分のホスト名>'}em}
```
- `<自分のホスト名>`の部分はコマンドプロンプトを立ち上げて`hostname`コマンドなどで調べておいて下さい。
