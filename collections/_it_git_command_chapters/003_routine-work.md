---
chapter_no: 003
chapter_id: routine-work
chapter_title: 日常の作業(add, commit, checkout, reset)
created: 2010-11-07
updated: 2010-11-07
---
<div class="code-box">
<div class="title">新しいファイルの追加や既存のファイルのステージをしてコミットする</div>
<pre>
$ git <em class="blue">add</em> <em>&lt;ファイル*&gt;</em>
$ git <em class="blue">commit</em> <em class="command">-m</em> <em>"&lt;メッセージ&gt;"</em>
</pre>
</div>
- `*`は複数指定可能です。

<div class="code-box">
<div class="title">ファイルの一部をステージする</div>
<pre>
$ git <em class="blue">add</em> <em class="command">-p</em> <em>&lt;ファイル*&gt;</em>
(コミットするハンクを選択)
</pre>
</div>

<div class="code-box">
<div class="title">対話的にファイルを追加する</div>
<pre>
$ git <em class="blue">add</em> <em class="command">-i</em>
</pre>
</div>

<div class="code-box">
<div class="title">追跡しているファイルへの修正をすべてステージする</div>
<pre>
$ git <em class="blue">add</em> <em class="command">-u</em> <em>&lt;パス*&gt;</em>
</pre>
</div>
- 「追跡しているファイル」とは、過去に`git add`コマンドなどによりGitが追跡対象と認識しているファイルを指します。
- ファイルの修正だけでなく削除も適切に処理されます。


<div class="code-box">
<div class="title">追跡しているファイルへの修正をすべてコミットする</div>
<pre>
$ git <em class="blue">commit</em> <em class="command">-m</em> <em>"&lt;メッセージ&gt;"</em> <em class="command">-a</em>
</pre>
</div>

<div class="code-box">
<div class="title">作業ツリーにおける変更を元に戻す</div>
<pre>
$ git <em class="blue">checkout</em> <em>HEAD</em> <em>&lt;ファイル*&gt;</em>
</pre>
</div>
- `git checkout`において`HEAD`の指定は省略できます。
- `master`のようにブランチなどと同じ名前のファイルを作ってしまった場合は、`git checkout -- master` のようにすればよいです。
- `git checkout .` とすると作業ツリーのすべての変更が元に戻ります。

<div class="code-box">
<div class="title">コミットしていないステージをリセットする</div>
<pre>
$ git <em class="blue">reset</em> <em>HEAD</em> <em>&lt;ファイル*&gt;</em>
</pre>
</div>
- `git reset`も`git commit`と同様にHEADの指定は省略できます。
- 単に`git reset`するとすべてのステージがリセットされます。

<div class="code-box">
<div class="title">直近のコミットを修正する</div>
<pre>
$ git <em class="blue">commit</em> <em class="command">-m</em> <em>"&lt;メッセージ&gt;"</em> <em class="command">--amend</em>
</pre>
</div>
- 必要な変更を施したら、それをステージします。


<div class="code-box">
<div class="title">前回のコミットを修正する（コミットメッセージは再利用する）</div>
<pre>
$ git <em class="blue">commit</em> <em class="command">-C</em> <em>HEAD</em> <em class="command">--amend</em>
</pre>
</div>
