---
title: 楽観的ロックと悲観的ロックについて
article_group_id: summary-group
display_order: 20
created: 2022-11-08
updated: 2022-11-08
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#楽観的ロック">楽観的ロック</a></li>
<li><a href="#悲観的ロック">悲観的ロック</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-11-08" updated="2022-11-08" %}</div>
データベースの排他制御の手法で代表的な`楽観的ロック`と`悲観的ロック`についてのメモです。  
こんなデータベースの用語に楽観的とか悲観的っていうのが出てくるのが面白いですね。

{% include goto_pagetop.html %}

* * *
## <a name="楽観的ロック">楽観的ロック</a><a class="heading-anchor-permalink" href="#楽観的ロック">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-11-08" updated="2022-11-08" %}</div>
- そもそもそんなにデータが更新されないだろうという楽観的な考え方のロック方式。
- データに`version`などを設けて、更新前と更新後で変更されてなければ更新できる、更新されていたら失敗するというもの。
- 後負け、先勝ち。

{% include goto_pagetop.html %}

* * *
## <a name="悲観的ロック">悲観的ロック</a><a class="heading-anchor-permalink" href="#悲観的ロック">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-11-08" updated="2022-11-08" %}</div>
- データは頻繁に更新されるだろうという悲観的な考え方のロック方式。
- DBMSのロック機能を使ってロックする。
- ロックし忘れを完全に制御し切れないので、ロック解除が漏れた時のことは考えておく必要がある。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-11-08" updated="2022-11-08" %}</div>
### 参考記事
- [(Qiita) 排他制御（楽観ロック・悲観ロック）の基礎](https://qiita.com/NagaokaKenichi/items/73040df85b7bd4e9ecfc)
- [(ITを分かりやすく解説) 楽観ロック(楽観的排他制御)とは](https://medium-company.com/%E6%A5%BD%E8%A6%B3%E3%83%AD%E3%83%83%E3%82%AF%E3%81%A8%E3%81%AF/)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
