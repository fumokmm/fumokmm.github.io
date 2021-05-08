---
chapter_no: 8
chapter_id: sub-module
chapter_title: サブモジュール(submodule)
created: 2010-11-07
updated: 2010-11-07
---
※以下コマンドはワーキングツリーのトップレベル(`.git`のあるディレクトリ)で実行する必要があります。

<div class="code-box">
<div class="title">サブモジュールを作成する</div>
<pre>
$ git <em class="blue">submodule add</em> <em>&lt;リポジトリのURL&gt;</em> <em>&lt;クローン先のパス&gt;</em>
$ git <em class="blue">commit</em> <em class="command">-m</em> <em>'add submodule'</em>
</pre>
</div>
- サブモジュールを作成すると`.gitmodules`という平文の設定ファイルが作成され、指定したリポジトリがクローンされてきます。
- しかし、トップレベルの方ではステージされた状態で止まっているため、作成後にコミットが必要です。

<div class="code-box">
<div class="title">サブモジュールを確認する</div>
<pre>
$ git <em class="blue">submodule</em>
</pre>
</div>
- `-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx path/to/submodule`のように先頭が`-`で始まる場合、まだ初期化されていません。
- 初期化すると`-`が消えます。

<div class="code-box">
<div class="title">サブモジュールを初期化する</div>
<pre>
$ git <em class="blue">submodule init</em> <em>&lt;サブモジュールのパス&gt;</em>
</pre>
</div>
- サブモジュール定義を含むリポジトリをクローンしてきた場合などは必要です。
- 順序としては`git submodule init → git submodule update`

<div class="code-box">
<div class="title">サブモジュールを更新する</div>
<pre>
$ git <em class="blue">submodule update</em> <em>&lt;サブモジュールのパス&gt;</em>
</pre>
</div>
- サブモジュール定義を含むリポジトリをクローンしてきた場合などは必要です。
- 順序としては`git submodule init → git submodule update`
