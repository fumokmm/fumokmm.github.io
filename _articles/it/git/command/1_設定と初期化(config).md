---
chapter_no: 1
chapter_title: 設定と初期化(config)
created: 2010-11-07
updated: 2021-12-06
---
```:現在の設定のリストを出力する
$ git {em:blue{config}em} {em:command{--global}em} {em{-l}em}
```

<div class="code-box">
<div class="title">グローバルなユーザ名とメールアドレスを設定する</div>
<pre>
$ git <em class="blue">config</em> <em class="command">--global</em> <em>user.name "hoge"</em>
$ git <em class="blue">config</em> <em class="command">--global</em> <em>user.email "hoge@hoge.com"</em>
</pre>
</div>
```:グローバルなコミットやタグのメッセージ編集用のエディタを設定する
$ git {em:blue{config}em} {em:command{--global}em} {em{core.editor emacs}em}
```

<div class="code-box">
<div class="title">特定のリポジトリ用のユーザ名とメールアドレスを設定する</div>
<pre>
$ cd /path/to/repo
$ git <em class="blue">config</em> <em>user.name "hoge"</em>
$ git <em class="blue">config</em> <em>user.email "hoge@hoge.com"</em>
</pre>
</div>
```:特定のリポジトリ用のコミットやタグのメッセージ編集用のエディタを設定する
$ git {em:blue{config}em} {em{core.editor emacs}em}
```

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

- 日本語のファイル名が以下のように文字化けするときは`core.quotepath false`を設定すると文字化けしなくなります。

<div class="code-box-output no-title">
<pre>
create mode 100644 "_draft/IT\351\226\242\351\200\243/access.md"
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