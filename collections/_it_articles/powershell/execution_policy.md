---
title: PowerShellの実行ポリシーのについて
article_group_id: basis-group
display_order: 10
created: 2020-09-14
updated: 2020-09-14
---
PowerShellの実行ポリシーのについてメモです。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#execution-policy-list">実行ポリシー一覧</a></li>
<li><a href="#reference">参考</a></li>
</ul>

* * *
## <a name="execution-policy-list">実行ポリシー一覧</a><a class="heading-anchor-permalink" href="#execution-policy-list">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-09-14" updated="2020-09-14" %}</div>

|ポリシー     |デフォルト|説明             |
|:----------:|:--------:|:----------------|
|Restricted  |〇        |構成ファイルの読み込みやスクリプトの実行を行わないデフォルトはこれ。|
|AllSigned   |          |すべてのスクリプトと構成ファイルが信頼された発行元によって署名されていることを要求する。ユーザーがローカルに書き込むスクリプトを含む。|
|RemoteSigned|          |インターネットからダウンロードされたすべてのスクリプトおよび構成ファイルが、信頼された発行元によって署名されていることを要求します。ユーザーがローカルに書き込むスクリプトは除く。|
|Unrestricted|          |すべての構成ファイルを読み込み、すべてのスクリプトを実行する。インターネットからダウンロードされた署名されていないスクリプトを実行する場合、スクリプトを実行する前に確認を求められる。|
|Bypass      |          |何もブロックされず、警告もメッセージも表示されない。|
|Undefined   |          |現在のスコープから現在割り当てられている実行ポリシーを削除する。このパラメーターは、グループポリシースコープ内で設定された実行ポリシーは削除しない。|

ローカルで自分用に書いて使うスクリプトで良く使うのは `RemoteSigned` 。  
こちらはローカルで作成したファイルについては、署名されていなくても利用できる。

{% include goto_pagetop.html %}

* * *
## <a name="reference">参考</a><a class="heading-anchor-permalink" href="#reference">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-09-14" updated="2020-09-14" %}</div>
- [PowerShellのExecutionPolicyのスコープとかについて詳しく](https://qiita.com/kikuchi/items/59f219eae2a172880ba6)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
