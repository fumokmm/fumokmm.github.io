---
title: Windows環境にHUGOをインストール
article_group_id: getting-started-group
display_order: 10
created: 2023-02-17
updated: 2023-02-17
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#インストール（ビルド済みバイナリ）">インストール（ビルド済みバイナリ）</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2023-02-17" updated="2023-02-17" %}</div>
とりあえずWindowsの場合、Sassを変換してくれるextended editionのほうがいいらしいです。

{% include goto_pagetop.html %}

* * *
## <a name="インストール（ビルド済みバイナリ）">インストール（ビルド済みバイナリ）</a><a class="heading-anchor-permalink" href="#インストール（ビルド済みバイナリ）">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2023-02-17" updated="2023-02-17" %}</div>
### ダウンロード
1. [こちら](https://github.com/gohugoio/hugo/releases/latest)に移動。
1. 下の方から、「hugo_extended_<バージョン>_windows-amd64.zip」を選択

### インストール
1. ダウンロードしたZIPを展開します。
1. 展開すると `hugo.exe` と README などが入っています。シンプルですね。
1. お好きなフォルダに移動させます。（展開先例：`C:\tools\Hugo\bin`）
1. 上記で展開したフォルダにパスを通します。

### 起動確認
- `version`コマンドでインストールできたか確認します。
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
&gt; <em class="command">hugo version</em>
hugo v0.110.0-e32a493b7826d02763c3b79623952e625402b168+extended windows/amd64 BuildDate=2023-01-17T12:16:09Z VendorInfo=gohugoio
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2023-02-17" updated="2023-02-17" %}</div>
### 公式サイト
- [(公式サイト) HUGO](https://gohugo.io/)
- [(公式サイト) INSTALLATION](https://gohugo.io/installation/windows/)

### 参考動画
- [Introduction to Hugo \| Hugo - Static Site Generator \| Tutorial 1](https://www.youtube.com/watch?v=qtIqKaDlqXo)
- [Installing Hugo on Windows \| Hugo - Static Site Generator \| Tutorial 2](https://www.youtube.com/watch?v=G7umPCU-8xc)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
