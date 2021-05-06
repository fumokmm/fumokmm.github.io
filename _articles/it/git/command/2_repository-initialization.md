---
chapter_no: 2
chapter_id: repository-initialization
chapter_title: リポジトリの初期化(init, clone)
created: 2010-11-07
updated: 2010-11-07
---
<div class="code-box">
<div class="title">新しいリポジトリの初期化する</div>
<pre>
$ mkdir /path/to/repo
$ cd /path/to/repo
$ git <em class="blue">init</em>
(リポジトリを作ったよというメッセージ)
$ git <em class="blue">add</em> <em>.</em>
$ git <em class="blue">commit</em> <em class="command">-m</em> <em>"&lt;メッセージ&gt;"</em>
(コミットができたよというメッセージ)
</pre>
</div>

<div class="code-box">
<div class="title">リポジトリのクローンを作る</div>
<pre>
$ git <em class="blue">clone</em> <em>&lt;リポジトリのURL&gt;</em>
(クローンできたよというメッセージ)
</pre>
</div>

<div class="code-box">
<div class="title">既存のディレクトリをGitリポジトリ化する</div>
<pre>
$ cd /path/to/existing/directory
$ git <em class="blue">init</em>
(リポジトリを作ったよというメッセージ)
$ git <em class="blue">add .</em>
$ git <em class="blue">commit</em> <em class="command">-m</em> <em>"&lt;メッセージ&gt;"</em>
(コミットができたよというメッセージ)
</pre>
</div>

<div class="code-box">
<div class="title">新しいリモートリポジトリの追加する</div>
<pre>
$ git <em class="blue">remote add</em> <em>&lt;リモートリポジトリ名&gt; &lt;リポジトリのURL&gt;</em>
</pre>
</div>
- リポジトリのディレクトリ内で実行して下さい。
