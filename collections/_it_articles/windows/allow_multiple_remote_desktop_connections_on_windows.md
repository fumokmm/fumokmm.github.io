---
title: Windowsでリモートデスクトップの接続許可数(セッション数)を複数にする
article_group_id: tips-group
display_order: 20
created: 2021-11-08
updated: 2021-12-02
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#設定方法">設定方法</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="設定方法">設定方法</a><a class="heading-anchor-permalink" href="#設定方法">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-08" updated="2021-11-08" %}</div>
1. 「Win + X」 -> 「ファイル名を指定して実行」。
1. 「gpedit.msc」-> 「OK」。
1. 「コンピューターの構成」   
    -> 「管理用テンプレート」  
    -> 「Windows コンポーネント」  
    -> 「リモート デスクトップ サービス」  
    -> 「リモート デスクトップ セッション ホスト」  
    -> 「接続]」を選択し、  
   「リモート デスクトップ サービス ユーザーに対してリモート デスクトップ サービス セッションを 1つに制限する」 をダブルクリック。
1. 「無効」を選択。

これで、2ユーザまで同時にアクセスできます。  
以上。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-08" updated="2021-12-02" %}</div>
### 参考サイト
- [(Shima System Academy) 【図解】Windows Server 2019：リモートデスクトップ 複数セッション許可設定](https://inab818.site/microsoft-windows-server-2019/multiple-people-remote-desktop/)
- [(Tech Blog) リモートデスクトップ 複数セッションを許可する](https://blogs.osdn.jp/2017/10/01/multi-rdp.html)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
