---
title: コマンド履歴を戻りすぎた時に先に進む方法
display_order: 20
created: 2021-02-26
updated: 2021-02-26
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#introduction">はじめに</a></li>
<li><a href="#setting">設定</a></li>
<li><a href="#side-street">横道</a></li>
<li><a href="#reference">参考</a></li>
</ul>

* * *
## <a name="introduction">はじめに</a><a class="heading-anchor-permalink" href="#introduction">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-02-26" updated="2021-02-26" %}</div>
今まで、`Ctrl + R`でコマンド履歴を戻りすぎた時、先に進む方法が分からず、  
仕方なく`Ctrl + C`で一旦終了させてから再度`Ctrl + R`でやり直すという方法を取っていましたが、
当然ながら、先に進む方法も用意されています。  
しかし、有効にするのにちょっとした設定が必要となるようでした。

結論から先に言うと、先に進むコマンドは`Ctrl + S`なのですが、  
デフォルトだとこちらには「スクリーンロック」という機能がバインドされているようです。  
ちなみにスクリーンロックは、画面をロックしてくれる機能(詳しくは[横道](#side-street)からどうぞ)のことで、  
私は多分この先もきっと使わないので、この機能は無効にして履歴を進められるようにすることにしました。  

ということで設定方法を見て行きましょう。

{% include goto_pagetop.html %}

* * *
## <a name="setting">設定</a><a class="heading-anchor-permalink" href="#setting">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-02-26" updated="2021-02-26" %}</div>
### 設定を確認（設定前）
<div class="code-box-output no-title">
<pre>
<em class="command">$ stty -a</em>
speed 38400 baud; rows 30; columns 120; line = 0;
intr = ^C; quit = ^\; erase = ^?; kill = ^U; eof = ^D; eol = &lt;undef&gt;; eol2 = &lt;undef&gt;; swtch = &lt;undef&gt;; <em>start = ^Q;
stop = ^S;</em> susp = ^Z; rprnt = ^R; werase = ^W; lnext = ^V; discard = ^O; min = 1; time = 0;
-parenb -parodd -cmspar cs8 -hupcl -cstopb cread -clocal -crtscts
-ignbrk -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr icrnl ixon -ixoff -iuclc -ixany -imaxbel -iutf8
opost -olcuc -ocrnl onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0 bs0 vt0 ff0
isig icanon iexten echo echoe echok -echonl -noflsh -xcase -tostop -echoprt echoctl echoke -flusho -extproc
</pre>
</div>
※赤文字部分

### 起動スクリプトに追記

自分用なら `~/.bashrc`、全ユーザに適用でよければ `/etc/bashrc` に以下を追記します。

<div class="code-box">
<div class="title">標準だとスクリーンロックが割り当てられているため、それを解除する</div>
<pre>
stty stop undef
stty start undef
</pre>
</div>
編集後、再読み込み。

### 設定を確認（設定後）
<div class="code-box-output no-title">
<pre>
<em class="command">$ stty -a</em>
speed 38400 baud; rows 30; columns 120; line = 0;
intr = ^C; quit = ^\; erase = ^?; kill = ^U; eof = ^D; eol = &lt;undef&gt;; eol2 = &lt;undef&gt;; swtch = &lt;undef&gt;; <em>start = &lt;undef&gt;;
stop = &lt;undef&gt;;</em> susp = ^Z; rprnt = ^R; werase = ^W; lnext = ^V; discard = ^O; min = 1; time = 0;
-parenb -parodd -cmspar cs8 -hupcl -cstopb cread -clocal -crtscts
-ignbrk -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr icrnl ixon -ixoff -iuclc -ixany -imaxbel -iutf8
opost -olcuc -ocrnl onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0 bs0 vt0 ff0
isig icanon iexten echo echoe echok -echonl -noflsh -xcase -tostop -echoprt echoctl echoke -flusho -extproc</pre>
</div>
※赤文字部分

### 操作イメージ

`Ctrl + R`で履歴検索(reverse-i-search)になる。

![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20210226/20210226114138.png)

その後、`Ctrl + S`で履歴を進む(i-search)になる。

![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20210226/20210226114141.png)

`Ctrl + G`で元に戻る。

![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20210226/20210226114145.png)

{% include goto_pagetop.html %}

* * *
## <a name="side-street">横道</a><a class="heading-anchor-permalink" href="#side-street">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-02-26" updated="2021-02-26" %}</div>
- [(ITmedia) 「Ctrl」＋「S」でキー入力が受け付けられなくなる](https://www.itmedia.co.jp/help/tips/linux/l0612.html)
  - 「Ctrl」＋「S」でスクリーンロック
  - 「Ctrl」＋「Q」でスクリーンロックの解除

{% include goto_pagetop.html %}

* * *
## <a name="reference">参考</a><a class="heading-anchor-permalink" href="#reference">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-02-26" updated="2021-02-26" %}</div>
- [(SOFTELメモ Developer's blog) ctrl+rで進みすぎたとき反対向きに進むにはctrl+s](https://www.softel.co.jp/blogs/tech/archives/5616)
- [(Qiita) Bashでコマンド履歴から検索して実行する](https://qiita.com/quwa/items/3a23c9dbe510e3e0f58e)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
