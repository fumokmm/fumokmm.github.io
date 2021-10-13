---
title: 重大なバグを素早く見つけるために注意を払うべきこと
article_group_id: iron-rule-group
display_order: 10
created: 2021-09-26
updated: 2021-09-26
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#注意を払うべきこと">注意を払うべきこと</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="注意を払うべきこと">注意を払うべきこと</a><a class="heading-anchor-permalink" href="#注意を払うべきこと">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-26" updated="2021-09-26" %}</div>
- 変更していない部分より先に、*修正した箇所をテストする*こと。
  - バグ修正や機能変更によってバグが入り込む危険性は高い。
- 周辺機能より先に、*基本機能をテストする*こと。
  - ユーザーがよく使う機能が優先。
- 信頼性が高いかどうかを評価する前に、*機能がきちんと動くかどうか*をテストすること。
- 条件を組み合わせて複雑なテストをする前に、*まずは各機能がきちんと動作すること*を確認すること。
- 特殊な条件を与える前に、*普通の条件でテストする*こと。
  - 普通のデータを使って、普通のシナリオでチェックすること。
- 特殊な障害やエラーより先に、*一般的な障害やエラーでテストする*こと。
- 影響の小さなバグを狙う前に、*影響の大きいバグを狙ってテストする*こと。
  - バグが発生したら大きな影響を受ける機能やモジュールに焦点を当てテストすること。
- 開発側の関心が薄い部分よりも先に、*開発側がテストして欲しいと望んでいる部分をテストする*こと。
  - プログラマが心配していることは、全てテストすること。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-26" updated="2021-09-26" %}</div>
### 参考書籍
- {% include book/book_719.html %} {% comment %} ソフトウェアテスト293の鉄則 {% endcomment %}

{% include goto_pagetop.html %}

{% include footnotes_link.html %}