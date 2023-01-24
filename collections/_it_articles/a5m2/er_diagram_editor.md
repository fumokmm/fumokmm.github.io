---
title: A5:SQL Mk-2のERエディタについて
article_group_id: tips-group
display_order: 20
created: 2023-01-16
updated: 2023-01-18
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#オブジェクトのアイコンと操作">オブジェクトのアイコンと操作</a></li>
<li><a href="#DDLの生成">DDLの生成</a></li>
<li><a href="#画像としてページをコピー">画像としてページをコピー</a></li>
<li><a href="#型ドメイン">型ドメイン</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2023-01-17" updated="2023-01-17" %}</div>
A5:SQLに付属のERエディタの使い方をメモしておきます。

{% include goto_pagetop.html %}

* * *
## <a name="オブジェクトのアイコンと操作">オブジェクトのアイコンと操作</a><a class="heading-anchor-permalink" href="#オブジェクトのアイコンと操作">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2023-01-16" updated="2023-01-18" %}</div>
### エンティティオブジェクト
<p class="center size-1" markdown="span">
![](https://drive.google.com/uc?id=19J7gOGGlFQrLl8WOA6rwfsu59HArrAOS)
</p>

### リレーションシップオブジェクト
<p class="center size-1" markdown="span">
![](https://drive.google.com/uc?id=19V6gnbhUeTcWphS__-XfZQCDZV59jmfY)
</p>
1. 親エンティティをクリック
1. 子エンティティをクリック

### コメントオブジェクト
<p class="center size-1" markdown="span">
![](https://drive.google.com/uc?id=19DwK3PvLqKfMdqPJLetL2Y047JSQqTCY)
</p>

### ビューオブジェクト
<p class="center size-1" markdown="span">
![](https://drive.google.com/uc?id=19MjSnENywJugDJoHGHgErHjAz7nfJ5zr)
</p>

### サブタイプオブジェクト
<p class="center size-1" markdown="span">
![](https://drive.google.com/uc?id=19WpH5YaGySEfdQCNx9oyQquPz_V8ddkJ)
</p>
- エンティティとサブタイプはリレーションシップでつなぐ
- サブタイプの子には親エンティティの主キーが追加される

### 線分オブジェクト
<p class="center size-1" markdown="span">
![](https://drive.google.com/uc?id=19MEcHQgDCO3DrZPYUAn0JZBMkUkz1441)
</p>

### シェイプオブジェクト、画像（シェイプオブジェクト）
<p class="center size-1" markdown="span">
![](https://drive.google.com/uc?id=19Op4D0_xNPIqUbf4KXVbr7G49Edgha1R)
</p>
- シェイプや画像を追加

{% include goto_pagetop.html %}

* * *
## <a name="DDLの生成">DDLの生成</a><a class="heading-anchor-permalink" href="#DDLの生成">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2023-01-17" updated="2023-01-17" %}</div>
`Ctrl + D` → `SQLエディタ`

{% include goto_pagetop.html %}

* * *
## <a name="画像としてページをコピー">画像としてページをコピー</a><a class="heading-anchor-permalink" href="#画像としてページをコピー">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2023-01-17" updated="2023-01-17" %}</div>
- `メニュー` > `編集` > `画像として...` >
- `拡張メタファイル形式` (Excelなどに貼り付け可能)  
    or  
  `ビットマップでクリップボードへコピー`

{% include goto_pagetop.html %}

* * *
## <a name="型ドメイン">型ドメイン</a><a class="heading-anchor-permalink" href="#型ドメイン">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2023-01-17" updated="2023-01-17" %}</div>
### デフォルトドメイン
- データベースのデータ型を抽象化
- 例）`@VARCHAR(10)` → Oracleだと`VARCHAR2(10)`になる。

### ユーザー定義ドメイン
- ユーザーの業務レベルのデータ型を抽象化
- `*注文番号` → `@VARCHAR(10)`のようにデフォルトドメインと組み合わせた定義も可能

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2023-01-16" updated="2023-01-16" %}</div>
### 参考サイト
- [(公式サイト) オンラインヘルプのERエディタ](https://a5m2.mmatsubara.com/help/)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}