---
title: SQL ServerのTips
created: 2020-10-15
updated: 2020-10-23
---
ここではSQL ServerのちょっとしたTipsをまとめておきます。

## <a name="index">目次</a>

- [テーブルをバックアップするSQL](#sql-for-backing-up-table)
- [同一インスタンス内にデータベースを複製する](#duplicate-the-database-in-the-same-instance)

## <a name="sql-for-backing-up-table">テーブルをバックアップするSQL</a>
{% include update_info.html created="2020-07-15" updated="2020-10-15" %}

テーブルをサクっとバックアップしたい場合に使えるSQLです。

<div class="code-box">
<div class="title">テーブルをバックアップするSQL</div>
<pre>
SELECT * INTO <em>&lt;新しいテーブル名&gt;</em> FROM <em>&lt;テーブル名&gt;</em>;
</pre>
</div>

### 例
以下SQLを実行すると、`M_USER`と同じレイアウトの`M_USER_20201015`という名前のテーブルが作成されます。
<div class="code-box no-title">
<pre>
SELECT * INTO <em>M_USER_20201015</em> FROM <em>M_USER</em>;
</pre>
</div>

## <a name="duplicate-the-database-in-the-same-instance">同一インスタンス内にデータベースを複製する</a>
{% include update_info.html created="2020-10-23" updated="2020-10-23" %}

`SQL Server Management Studio`の`バックアップ`と`復元`を利用してデータベースを複製する手順です。  
ここでは、復元元データベース名を`DB1`、復元先データベース名を`DB2`として説明しています。

1. 複製元のデータベース(`DB1`)を右クリックして、「タスク」→「バックアップ」を実行する
    1. バックアップの種類は「完全」を選択する
    1. バックアップ先を追加する
    1. 「OK」をクリック
    1. 作成されるバックアップファイル → `DB1.bak`
1. 対象インスタンスの「データベース」を右クリックして、「ファイルおよびファイルグループの復元」を実行する
    1. 「全般」で以下を設定する
        1. 「復元先データベース」に`DB2`と直接入力する。（※事前に作っておく必要はありません）
        1. 「復元元デバイス」で、先ほどバックアップしたファイル`DB1.bak`を選択する
        1. 「復元するバックアップセットの選択」で、対象のバックアップの「復元」にチェックを入れる
    1. 「オプション」で以下を設定する
        1. 「既存のデータベースを上書きする」をチェックする
        1. 必要に応じて、「次のデータベースファイルに復元」の内容を変更する
        1. 行データ:任意のファイルパスのmdfファイル
        1. ログ:任意のldfファイル
    1. 「OK」をクリック

### <a name="duplicate-the-database-in-the-same-instance-reference">参考</a>

- [(REONTOSANTA) SQLServerで同一インスタンス内にデータベースを複製する](https://knowledge.reontosanta.com/archives/786)