---
chapter_no: 1
chapter_id: config-and-initialization
chapter_title: 設定と初期化(config)
created: 2010-11-07
updated: 2010-11-07
---
<div class="code-box">
<div class="title">グローバルなユーザ名とメールアドレスを設定する</div>
<pre>
$ git <em class="blue">config</em> <em class="command">--global</em> <em>user.name "hoge"</em>
$ git <em class="blue">config</em> <em class="command">--global</em> <em>user.email "hoge@hoge.com"</em>
</pre>
</div>

<div class="code-box">
<div class="title">特定のリポジトリ用のユーザ名とメールアドレスを設定する</div>
<pre>
$ cd /path/to/repo
$ git <em class="blue">config</em> <em>user.name "hoge"</em>
$ git <em class="blue">config</em> <em>user.email "hoge@hoge.com"</em>
</pre>
</div>
- グローバルとの違いは`--global`オプションの有無です。

<div class="code-box">
<div class="title">Gitの出力の色分けを有効にする</div>
<pre>
$ git <em class="blue">config</em> <em class="command">--global</em> <em>color.ui "auto"</em>
</pre>
</div>

<div class="code-box">
<div class="title">日本語ファイル名がクォートされないように設定する</div>
<pre>
$ git <em class="blue">config</em> <em class="command">--global</em> <em>core.quotepath false</em>
</pre>
</div>

<div class="code-box">
<div class="title">Gitコマンドのエイリアスを作る</div>
<pre>
$ git <em class="blue">config</em> <em class="command">--global</em> <em>alias.co 'checkout'</em>
$ git <em class="blue">config</em> <em class="command">--global</em> <em>alias.st 'status'</em>
$ git <em class="blue">config</em> <em class="command">--global</em> <em>alias.ci 'commit -a'</em>
$ git <em class="blue">config</em> <em class="command">--global</em> <em>alias.di 'diff'</em>
$ git <em class="blue">config</em> <em class="command">--global</em> <em>alias.br 'branch'</em>
</pre>
</div>
- `git co`でチェックアウト、`git br`でブランチなどが出来るようになります。