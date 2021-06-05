---
title: Juliaをインストール
display_order: 10
created: 2021-06-05
updated: 2021-06-05
---
{% capture link_to_it_powershell %}{% link _it_articles/powershell/index.md %}{% endcapture %}
{% assign link_to_it_powershell = link_to_it_powershell | remove: 'index' %}

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#ダウンロード">ダウンロード</a></li>
<li><a href="#インストール">インストール</a></li>
<li><a href="#動作確認">動作確認</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="ダウンロード">ダウンロード</a><a class="heading-anchor-permalink" href="#ダウンロード">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-05" updated="2021-06-05" %}</div>
- [こちら](https://julialang.org/downloads/)から自分の環境に合わせてモジュールをダウンロードします。

{% include goto_pagetop.html %}

* * *
## <a name="インストール">インストール</a><a class="heading-anchor-permalink" href="#インストール">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-05" updated="2021-06-05" %}</div>
- ダウンロードしてきたモジュールをインストールします。

### 例) Windows10
- 今私が使っているのはWindows10です。Windows10ではインストールが完了すると、デスクトップに以下のようなアイコンができました。
- 2021-06-05現在の最新バージョンは`1.6.1`のようですね。

<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20210604/20210604180354.png)
</p>

- ダブルクリックしてみると、以下のようなコンソールが立ち上がりました。

<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20210604/20210604180433.png)
</p>

- 〇の色がオシャレですね。

{% include goto_pagetop.html %}

* * *
## <a name="動作確認">動作確認</a><a class="heading-anchor-permalink" href="#動作確認">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-05" updated="2021-06-05" %}</div>
- 先ほどのコンソールでも良いですが、[PowerShell]({{link_to_it_powershell}})を立ち上げて試してみました。

<div class="code-box-output no-title">
<pre>
<em class="command">PS C:\Users\fumo&gt;</em> julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.6.1 (2021-04-23)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

<em class="command">julia&gt;</em> 1 + 2
3

<em class="command">julia&gt;</em> println("こんにちは、世界")
こんにちは、世界

<em class="command">julia&gt;</em> exit()
<em class="command">PS C:\Users\fumo&gt;</em>
</pre>
</div>
- 終了させるには`exit`ではなくて、`exit()`のようです。関数呼び出し的な何か？
> To exit the interactive session, type CTRL-D (press the Control/^ key together with the d key), or type exit(). 
> <cite>[Getting Started](https://docs.julialang.org/en/v1/manual/getting-started/)</cite>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-05" updated="2021-06-05" %}</div>
- [(Julia) 公式サイト](https://julialang.org/)
- [(Julia) Getting Started](https://docs.julialang.org/en/v1/manual/getting-started/)
- [(Julia メモ) 2 REPL (julia コマンド) の使い方](http://nalab.mind.meiji.ac.jp/~mk/labo/text/julia-memo/node6.html)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
