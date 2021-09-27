---
chapter_no: 7
chapter_title: 履歴(log, diff)
created: 2010-11-07
updated: 2021-05-20
---
<div class="code-box">
<div class="title">履歴をすべて表示する</div>
<pre>
$ git <em class="blue">log</em>
</pre>
</div>

<div class="code-box">
<div class="title">変更を示すパッチと一緒にログを表示する</div>
<pre>
$ git <em class="blue">log</em> <em class="command">-p</em>
</pre>
</div>

<div class="code-box">
<div class="title">表示するログをひとつに限定する</div>
<pre>
$ git <em class="blue">log</em> <em class="command">-1</em>
</pre>
</div>
- 1はアルファベットの「エル」ではなく数字の「いち」です。

<div class="code-box">
<div class="title">表示するログを20個に限定し、パッチも表示する</div>
<pre>
$ git <em class="blue">log</em> <em class="command">-20</em> <em class="command">-p</em>
</pre>
</div>

<div class="code-box">
<div class="title">過去6時間のコミットを表示する</div>
<pre>
$ git <em class="blue">log</em> <em class="command">--since=</em><em>"6 hours"</em>
</pre>
</div>

<div class="code-box">
<div class="title">2日以上前のコミットを表示する</div>
<pre>
$ git <em class="blue">log</em> <em class="command">--before=</em><em>"2 days"</em>
</pre>
</div>

<div class="code-box">
<div class="title">HEADから3つ前のコミットのログだけを表示する</div>
<pre>
$ git <em class="blue">log</em> <em class="command">-1</em> <em>HEAD~3</em>
または
$ git <em class="blue">log</em> <em class="command">-1</em> <em>HEAD^^^</em>
または
$ git <em class="blue">log</em> <em class="command">-1</em> <em>HEAD~1^^</em>
</pre>
</div>

<div class="code-box">
<div class="title">２つの時点間のコミットを表示する</div>
<pre>
$ git <em class="blue">log</em> <em>&lt;起点&gt;...&lt;終点&gt;</em>
</pre>
</div>
- `<起点>`および`<終点>`は`コミット名`、`ブランチ名`、`タグ名`のいずれかの名前を入れます。
- 異なるものを組み合わせてもよいです。

<div class="code-box">
<div class="title">ログの履歴を１行ずつで表示する</div>
<pre>
$ git <em class="blue">log</em> <em class="command">--pretty=</em><em>oneline</em>
</pre>
</div>

<div class="code-box">
<div class="title">ログをグラフで表示する</div>
<pre>
$ git <em class="blue">log</em> <em class="command">--graph</em>
</pre>
</div>

<div class="code-box">
<div class="title">ログのグラフで表示する(履歴は１行で表示)</div>
<pre>
$ git <em class="blue">log</em> <em class="command">--graph</em> <em class="command">--pretty=</em><em>oneline</em>
</pre>
</div>
なお、`--graph`については[こちら](https://blog.toshimaru.net/git-log-graph/)紹介されている以下のエイリアスを設定するとキレイなグラフが簡単に見れるようになります。
<div class="code-box">
<div class="title">.gitconfig</div>
<pre>
[alias]
  lg = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
  lga = log --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
</pre>
</div>

<div class="code-box">
<div class="title">ログのエントリごとに影響を受けた行の統計情報を表示する</div>
<pre>
$ git <em class="blue">log</em> <em class="command">--stat</em>
</pre>
</div>

<div class="code-box">
<div class="title">コミットにより影響を受けたファイルの状態を表示する</div>
<pre>
$ git <em class="blue">log</em> <em class="command">--name-status</em>
</pre>
</div>

<div class="code-box">
<div class="title">現在の作業ツリーのステージングエリアとの差分を表示する</div>
<pre>
$ git <em class="blue">diff</em>
</pre>
</div>

<div class="code-box">
<div class="title">ステージングエリアとリポジトリとの差分を表示する</div>
<pre>
$ git <em class="blue">diff</em> <em class="command">--cached</em>
</pre>
</div>

<div class="code-box">
<div class="title">作業ツリーとリポジトリとの差分を表示する</div>
<pre>
$ git <em class="blue">diff</em> <em>HEAD</em>
</pre>
</div>

<div class="code-box">
<div class="title">作業ツリーと以前のリポジトリとの差分を表示する</div>
<pre>
$ git <em class="blue">diff</em> <em>&lt;起点&gt;</em>
</pre>
</div>
- `<起点>`は`コミット名`、`ブランチ名`、`タグ名`のいずれかの名前を入れます。

<div class="code-box">
<div class="title">リポジトリの２つの時点間での差分を表示する</div>
<pre>
$ git <em class="blue">diff</em> <em>&lt;起点&gt;</em> <em>&lt;終点&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">差分の統計情報を表示する</div>
<pre>
$ git <em class="blue">diff</em> <em class="command">--stat</em> <em>&lt;起点&gt;</em> <em>[&lt;終点&gt;]</em>
</pre>
</div>
- `<終点>`は省略可能です。

<div class="code-box">
<div class="title">指定したファイルについて、コミットの情報を注釈付きで表示する</div>
<pre>
$ git <em class="blue">blame</em> <em>&lt;ファイル&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">ファイル内でのコピペおよび行の移動を含めて、コミットの情報を注釈付きで表示する</div>
<pre>
$ git <em class="blue">blame</em> <em class="command">-M</em> <em>&lt;ファイル&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">行の移動とオリジナルのファイルを表示して、コミットの情報を注釈付きで表示する</div>
<pre>
$ git <em class="blue">blame</em> <em class="command">-C</em> <em class="command">-C</em> <em>&lt;ファイル&gt;</em>
</pre>
</div>
- `-C`を２回付けます。

<div class="code-box">
<div class="title">ログの中でコピペについて表示する</div>
<pre>
$ git <em class="blue">log</em> <em class="command">-C</em> <em class="command">-C</em> <em class="command">-p</em> <em class="command">-1</em> <em>&lt;起点&gt;</em>
</pre>
</div>
- `-C`を２回付けます。
