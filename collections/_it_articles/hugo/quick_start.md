---
title: HUGOをクイックスタートする
article_group_id: getting-started-group
display_order: 20
created: 2023-02-24
updated: 2023-03-01
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#サイトを作る">サイトを作る</a></li>
<li><a href="#テーマを追加する">テーマを追加する</a></li>
<li><a href="#サイトの設定をいじる">サイトの設定をいじる</a></li>
<li><a href="#サイトを公開する">サイトを公開する</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2023-02-24" updated="2023-02-24" %}</div>
とりあえずサイトを作ってみましょう。  
`C:\temp\hugo`というフォルダで作業している想定です。

{% include goto_pagetop.html %}

* * *
## <a name="サイトを作る">サイトを作る</a><a class="heading-anchor-permalink" href="#サイトを作る">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2023-02-24" updated="2023-02-24" %}</div>
まずは`quickstart`というサイトを作成しましょう。  
以下のように、`hugo new site`コマンドに作成したいサイト名を渡して実行します。
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
<em class="command">PS C:\temp\hugo&gt;</em> hugo new site quickstart
Congratulations! Your new Hugo site is created in C:\temp\hugo\quickstart.

Just a few more steps and you're ready to go:

1. Download a theme into the same-named folder.
   Choose a theme from https://themes.gohugo.io/ or
   create your own with the "hugo new theme &lt;THEMENAME&gt;" command.
2. Perhaps you want to add some content. You can add single files
   with "hugo new &lt;SECTIONNAME&gt;\&lt;FILENAME&gt;.&lt;FORMAT&gt;".
3. Start the built-in live server via "hugo server".

Visit https://gohugo.io/ for quickstart guide and full documentation.
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="テーマを追加する">テーマを追加する</a><a class="heading-anchor-permalink" href="#テーマを追加する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2023-02-24" updated="2023-02-24" %}</div>
# gitリポジトリを作成
quickstartフォルダに移動してから、
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
<em class="command">PS C:\temp\hugo&gt;</em> cd .\quickstart\
</pre>
</div>

gitリポジトリを初期化します。
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
<em class="command">PS C:\temp\hugo\quickstart&gt;</em> git init
Initialized empty Git repository in C:/temp/hugo/quickstart/.git/
</pre>
</div>

# テーマを追加
次にテーマをgitのサブモジュールとしてaddします。
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
<em class="command">PS C:\temp\hugo\quickstart&gt;</em> git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke themes/ananke
Cloning into 'C:/temp/hugo/quickstart/themes/ananke'...
remote: Enumerating objects: 2654, done.
remote: Counting objects: 100% (83/83), done.
remote: Compressing objects: 100% (48/48), done.
remote: Total 2654 (delta 35), reused 66 (delta 28), pack-reused 2571
Receiving objects: 100% (2654/2654), 4.51 MiB | 2.50 MiB/s, done.
Resolving deltas: 100% (1468/1468), done.
</pre>
</div>
- ここでは、`ananke`というテーマを追加しています。

{% include goto_pagetop.html %}

* * *
## <a name="サイトの設定をいじる">サイトの設定をいじる</a><a class="heading-anchor-permalink" href="#サイトの設定をいじる">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2023-02-24" updated="2023-03-01" %}</div>
### config.toml を編集
サイトフォルダの直下にある`config.toml`ファイルを編集します。  
最終行に以下のようにテーマとして何を使うかの設定行を追加します。
<div class="code-box">
<div class="title">config.toml</div>
<div class="copy-button">Copy</div>
<pre>
baseURL = 'http://example.org/'
languageCode = 'en-us'
title = 'My New Hugo Site'
<em>theme = 'ananke'</em>
</pre>
</div>
- 赤字部分を追記

また、たぶんこのメモを見てくれている人は日本語を使う人が大半かと思うので、`languageCode`も`ja-jp`にしておくと良い気がします。
<div class="code-box">
<div class="title">config.toml</div>
<div class="copy-button">Copy</div>
<pre>
baseURL = 'http://example.org/'
languageCode = <em>'ja-jp'</em>
title = 'My New Hugo Site'
theme = 'ananke'
</pre>
</div>
- 赤字部分を編集

{% include goto_pagetop.html %}

* * *
## <a name="サイトを公開する">サイトを公開する</a><a class="heading-anchor-permalink" href="#サイトを公開する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2023-02-24" updated="2023-02-24" %}</div>
`hugo server`コマンドでサイトを公開します。
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
<em class="command">PS C:\temp\hugo\quickstart&gt;</em> hugo server
Start building sites …
hugo v0.110.0-e32a493b7826d02763c3b79623952e625402b168+extended windows/amd64 BuildDate=2023-01-17T12:16:09Z VendorInfo=gohugoio

                   | EN
-------------------+-----
  Pages            |  7
  Paginator pages  |  0
  Non-page files   |  0
  Static files     |  1
  Processed images |  0
  Aliases          |  0
  Sitemaps         |  1
  Cleaned          |  0

Built in 296 ms
Watching for changes in C:\temp\hugo\quickstart\{archetypes,assets,content,data,layouts,static,themes}
Watching for config changes in C:\temp\hugo\quickstart\config.toml, C:\temp\hugo\quickstart\themes\ananke\config.yaml
Environment: "development"
Serving pages from memory
Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
Web Server is available at http://localhost:1313/ (bind address 127.0.0.1)
Press Ctrl+C to stop
</pre>
</div>
- 公開が完了すると`http://localhost:1313/`にて確認できるようになります。
- 停止させるには`Ctrl + C`を押下します。

### 立ち上がったサイトのイメージ
<p class="center size-10" markdown="span">
![](https://drive.google.com/uc?id=1Do4Nn2r1aWBcpwc74UmbRz9pjk8lK6qk)
</p>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2023-02-24" updated="2023-03-01" %}</div>
### 参考サイト
- [(公式サイト) Quick Start](https://gohugo.io/getting-started/quick-start/)
- [(天才まくまくノート) Hugo で新規の Web サイトを作成する](https://maku77.github.io/p/bt5enw6/)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
