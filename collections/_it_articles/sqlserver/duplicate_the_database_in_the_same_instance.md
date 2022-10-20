---
title: SQL Serverで同一インスタンス内にデータベースを複製する
article_group_id: control-group
display_order: 42
created: 2020-10-23
updated: 2021-02-12
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#backup-and-restore">バックアップと復元</a></li>
<li><a href="#reference">参考</a></li>
</ul>

* * *
## <a name="backup-and-restore">バックアップと復元</a><a class="heading-anchor-permalink" href="#backup-and-restore">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-10-23" updated="2021-02-12" %}</div>
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

{% include goto_pagetop.html %}

* * *
## <a name="reference">参考</a><a class="heading-anchor-permalink" href="#reference">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-10-23" updated="2021-02-12" %}</div>
- [(REONTOSANTA) SQLServerで同一インスタンス内にデータベースを複製する](https://knowledge.reontosanta.com/archives/786)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
