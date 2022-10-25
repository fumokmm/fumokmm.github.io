---
chapter_no: 20
chapter_title: コンテナデータベース(CDB)にログインしてから接続
created: 2022-10-25
updated: 2022-10-25
---
### コンテナデータベース(CDB)にログイン
まずコンテナデータベース(CDB)にログインします。
```output
$ sqlplus /nolog
{em:command{SQL>}em} connect / as sysdba
```

### ALTER SESSIONでコンテナを接続先を切り替え
次にALTER SESSIONでコンテナの接続先をプラガブルデータベース(PDB)に切り替えます。
```output
{em:command{SQL>}em} select name,open_mode from v$pdbs;
{em:command{SQL>}em} alter session set container={em{<接続するプラガブルデータベース名>}em};
```

### プラガブルデータベースが起動していなかった場合
- [こちら]({% link _it_articles/oracle/how_to_keep_a_pluggable_database_pdb_automatically_started.md %}#停止している場合)の「停止している場合」を参考に起動させておいてください。

### 切り替わったか確認
```output
{em:command{SQL>}em} show con_name

CON_NAME
------------------------------
{em{<接続しているプラガブルデータベース名>}em}
```