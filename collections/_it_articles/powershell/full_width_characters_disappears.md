---
title: PowerShellで矢印などの全角文字が消えてしまう
article_group_id: trouble-shooting-group
display_order: 10
created: 2021-05-20
updated: 2021-05-20
---

## <a name="index">目次</a><a href="#目次">§</a>

<ul id="index_ul">
<li><a href="#動作確認バージョン">動作確認バージョン</a></li>
<li><a href="#事象">事象</a></li>
<li><a href="#原因と対策">原因と対策</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="動作確認バージョン">動作確認バージョン</a><a href="#動作確認バージョン">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-20" updated="2021-05-20" %}</div>
### Windows
Microsoft Windows  
バージョン 20H2 (OS ビルド 19042.985)

### PowerShell
<div class="code-box-output no-title">
<pre>
<em class="command">PS C:\Users\fumo> $PSVersionTable</em>

Name                           Value
----                           -----
PSVersion                      5.1.19041.906
PSEdition                      Desktop
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}
BuildVersion                   10.0.19041.906
CLRVersion                     4.0.30319.42000
WSManStackVersion              3.0
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="事象">事象</a><a href="#事象">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-20" updated="2021-05-20" %}</div>
PowerShellで矢印などの全角文字を含むパスをドラッグ＆ドロップすると、矢印部分が失われてしまうという事象が発生しています。  
以下イメージを参照して下さい。

<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20210520/20210520165657.gif)
</p>

{% include goto_pagetop.html %}

* * *
## <a name="原因と対策">原因と対策</a><a href="#原因と対策">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-20" updated="2021-05-20" %}</div>
### 原因
> 本事象は、Windows の Powershell の問題として認識しており、次期バージョンにて問題が修正されるよう障害情報には登録をしております。  
> なお恐れ入りますが現行製品では現時点で修正は予定されておりません。その場合は、モジュール PSReadLine をアンインストールすることで表示が不正となる問題は発生しなくなります。  
>   
> // PSReadLine のアンインストール コマンド  
> Remove-Module PSReadline  
>   
> ※ ご注意  
> 上記コマンドにて PSReadLine をアンインストールすると、文字の表示を色付けする機能が無効になるため、入力中の色分けが行われなくなります。  
> ご利用いただいている環境や運用状況に応じて、パスやファイル名、アイテム名を 1 バイト文字に統一するか、PSReadLine をアンインストールして色分け機能を無効にした状態で使用するか、いずれかをご検討いただきますようお願いいたします。  
>   
> <cite>[PowerShell で全角文字を入力すると表示がおかしくなる問題について](https://docs.microsoft.com/ja-jp/archive/blogs/askcorejp/powershell-%E3%81%A7%E5%85%A8%E8%A7%92%E6%96%87%E5%AD%97%E3%82%92%E5%85%A5%E5%8A%9B%E3%81%99%E3%82%8B%E3%81%A8%E8%A1%A8%E7%A4%BA%E3%81%8C%E3%81%8A%E3%81%8B%E3%81%97%E3%81%8F%E3%81%AA%E3%82%8B%E5%95%8F)</cite>

`PSReadLine` というモジュールでPowerShellコンソール中での自動色付け機能を実現しているようですが、その機能の既知のバグのようです。

### 対策
上記、原因にて書かれている `Remove-Module PSReadline` コマンドにて、自動色付け機能を一時的に無効にすることで、文字が消えなくなるようです。  
実際に試してみたものが以下イメージとなります。

<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20210520/20210520130431.gif)
</p>

なお、再度自動色付け機能を使いたい場合は、PowerShellコンソールを立ち上げ直してください。  
基本的に色付けは補助機能なので無くても困らないかな。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-20" updated="2021-05-20" %}</div>
### 関連ツイート
- [PowerShellのコンソールに矢印入りのパスをドロップすると消えちゃう問題、なんとかならんかな…。](https://twitter.com/fumokmm/status/1394988356900118531)
- [現場で使ってる共有フォルダに矢印が入ってて地味に困るんだよなこれ。だれか解決方法知ってる人いないでしょうか。](https://twitter.com/fumokmm/status/1394989173552132098)

### 関連リンク
- [(stack overflow) PowerShell(x64)のウィンドウに、ファイル名に記号を含むファイルをドラッグ＆ドロップすると文字が欠落してしまう](https://ja.stackoverflow.com/questions/55494/powershellx64%E3%81%AE%E3%82%A6%E3%82%A3%E3%83%B3%E3%83%89%E3%82%A6%E3%81%AB-%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E5%90%8D%E3%81%AB%E8%A8%98%E5%8F%B7%E3%82%92%E5%90%AB%E3%82%80%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92%E3%83%89%E3%83%A9%E3%83%83%E3%82%B0-%E3%83%89%E3%83%AD%E3%83%83%E3%83%97%E3%81%99%E3%82%8B%E3%81%A8%E6%96%87%E5%AD%97%E3%81%8C%E6%AC%A0%E8%90%BD%E3%81%97%E3%81%A6%E3%81%97%E3%81%BE%E3%81%86)
- [(Microsoft Build) PowerShell で全角文字を入力すると表示がおかしくなる問題について](https://docs.microsoft.com/ja-jp/archive/blogs/askcorejp/powershell-%E3%81%A7%E5%85%A8%E8%A7%92%E6%96%87%E5%AD%97%E3%82%92%E5%85%A5%E5%8A%9B%E3%81%99%E3%82%8B%E3%81%A8%E8%A1%A8%E7%A4%BA%E3%81%8C%E3%81%8A%E3%81%8B%E3%81%97%E3%81%8F%E3%81%AA%E3%82%8B%E5%95%8F)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
