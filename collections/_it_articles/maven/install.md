---
title: Mavenをインストール
article_group_id: basis-group
display_order: 10
created: 2023-01-25
updated: 2023-01-25
---
{% capture link_to_it_powershell %}{% link _it_articles/powershell/index.md %}{% endcapture %}{% assign link_to_it_powershell = link_to_it_powershell | remove: 'index' %}

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#Windowsにインストールする">Windowsにインストールする</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2023-01-25" updated="2023-01-25" %}</div>
Apache Mavenのインストールメモです。

{% include goto_pagetop.html %}

* * *
## <a name="Windowsにインストールする">Windowsにインストールする</a><a class="heading-anchor-permalink" href="#Windowsにインストールする">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2023-01-25" updated="2023-01-25" %}</div>
### 1. ダウンロード
- [Apache Maven Project](https://maven.apache.org/)を開きます。
- メニューの`Download`から`Binary zip archive`を選択して、ZIPをダウンロードして下さい。
<p class="center size-8" markdown="span">
![](https://drive.google.com/uc?id=1DcIuAJR04uujuk-uiIk117bMCBlPPsYs)
</p>

### 2. ZIPを展開
- 1でダウンロードしたZIPを適当な場所に展開します。

### 3. 環境変数を設定
- `Win + R` → `sysdm.cpl` → `システムのプロパティ`が開きます。
- `詳細設定`タブを選択します。
- 下部にある`環境変数`ボタンをクリックします。
- `Path`に`<2でZIPを展開したフォルダ>\bin`を追加します。

### 4. 起動確認
- [PowerShell]({{link_to_it_powershell}})などを開きます。
- `mvn -version`を実行し、以下のようにバージョンが表示されればインストール完了です。
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
PS C:\Users\fumo&gt; <em class="command">mvn -version</em>
Apache Maven 3.8.7 (b89d5959fcde851dcb1c8946a785a163f14e1e29)
Maven home: C:\tools\apache-maven-3.8.7
Java version: 14, vendor: Oracle Corporation, runtime: C:\Program Files\Java\jdk-14
Default locale: ja_JP, platform encoding: MS932
OS name: "windows 10", version: "10.0", arch: "amd64", family: "windows"
</pre>
</div>

以上

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2023-01-25" updated="2023-01-25" %}</div>
### 参考サイト
- [(わかる・たのしい・実は深い! IT入門書籍 スッキリシリーズ) Apache Mavenのインストール手順（Windows向け）](https://sukkiri.jp/technologies/devtools/maven/apache-maven-installwindows.html)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
