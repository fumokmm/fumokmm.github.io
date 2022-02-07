---
title: Windowsでリモートデスクトップ接続時にパスワードを記憶してくれない場合の対処法
article_group_id: tips-group
display_order: 40
created: 2022-02-07
updated: 2022-02-07
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#対処法">対処法</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="対処法">対処法</a><a class="heading-anchor-permalink" href="#対処法">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-07" updated="2022-02-07" %}</div>
- リモートデスクトップでパスワード保存のチェックを入れているのにパスワードを一向に覚えてくれる気配がない時があります。
- そんな時は、「`NTLMのみのサーバー認証で保存された資格情報の委任を許可する`」のポリシーをすることで対処できます。

### 手順
1. 「Windows」+「R」で「gpedit.msc」と入力しEnterを押下します。
  - 「ローカル グループポリシー エディター」が開きます。

1. 「ローカル グループポリシー エディター」画面にて
  - 「ローカル コンピューター ポリシー」を選択します。
  - 「コンピューターの構成」を選択します。
  - 「管理用テンプレート」を選択します。
  - 「システム」を選択します。
  - 「資格情報の委任」を開きます。

1. 「資格情報の委任」画面にて
  - 「NTLM のみのサーバー認証で保存された資格情報の委任を許可する」をクリックし設定画面を開きます。

1. 「NTLM のみのサーバー認証で保存された資格情報の委任を許可する」画面にて
  - 「有効」に切り替えます。
  - 「サーバーを一覧に追加」の「表示」をクリックします。
  - 「表示するコンテンツ」画面が開きます。

1. 「表示するコンテンツ」画面にて
  - サーバーを一覧に追加で、値に「*」と入力し、「OK」をクリックします。
  - 画面が閉じて「NTLM のみのサーバー認証で保存された資格情報の委任を許可する」画面に戻ります。

1. 「NTLM のみのサーバー認証で保存された資格情報の委任を許可する」画面にて
  - 「OK」をクリックし設定を確定させます。

1. 「Windows」+「R」で「cmd」と入力しEnterを押下します。
  - 「コマンドプロンプト」が開きます。

1. 「コマンドプロンプト」画面にて
  - 「gpupdate」と入力しEnterを押下します。
  - ポリシーの更新が正常終了した旨のメッセージが表示されれば設定完了です。

以上

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-07" updated="2022-02-07" %}</div>
### 参考サイト
- [(MSeeeeN) Windows のリモートデスクトップで保存したパスワードで接続できないときの対策](https://mseeeen.msen.jp/allow-delegating-saved-credentials-with-ntlm-only-server-authentication/)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
