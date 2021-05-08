---
chapter_no: 2
chapter_id: setting
chapter_title: 設定
created: 2021-02-26
updated: 2021-02-26
---
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
