---
chapter_no: 007
chapter_id: remote-repository
chapter_title: リモートリポジトリ(remote)
created: 2010-11-07
updated: 2010-11-07
---
<div class="code-box">
<div class="title">リポジトリのクローンを作る</div>
<pre>
$ git <em class="blue">clone</em> <em>&lt;リポジトリのURL&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">リポジトリのクローンを作るが、直近の200コミットだけをダウンロードする</div>
<pre>
$ git <em class="blue">clone</em> <em class="command">--depth</em> <em>200</em> <em>&lt;リポジトリのURL&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">新しいリモートリポジトリを追加する</div>
<pre>
$ git <em class="blue">remote add</em> <em>&lt;新しいリモートリポジトリ名&gt;</em> <em>&lt;リポジトリのURL&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">リモートブランチをすべて表示する</div>
<pre>
$ git <em class="blue">branch</em> <em class="command">-r</em>
</pre>
</div>

<div class="code-box">
<div class="title">リモートブランチからローカルブランチを作る</div>
<pre>
$ git <em class="blue">branch</em> <em>&lt;新しいブランチ名&gt;</em> <em>&lt;リモートブランチ名&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">リモートタグからローカルブランチを作る</div>
<pre>
$ git <em class="blue">branch</em> <em>&lt;新しいブランチ名&gt;</em> <em>&lt;リモートタグ名&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">originリポジトリから変更を取得するが、ローカルブランチにはマージしない（寸止め）</div>
<pre>
$ git <em class="blue">fetch</em>
</pre>
</div>

<div class="code-box">
<div class="title">origin以外のリモートリポジトリから変更を取得するが、ローカルブランチにはマージしない（寸止め）</div>
<pre>
$ git <em class="blue">fetch</em> <em>&lt;リモートリポジトリ名&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">リモートリポジトリから変更を取得し、現在のブランチにマージする</div>
<pre>
$ git <em class="blue">pull</em> <em>&lt;リモートリポジトリ名&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">originリポジトリから変更を取得し、現在のブランチにマージする</div>
<pre>
$ git <em class="blue">pull</em>
</pre>
</div>

<div class="code-box">
<div class="title">ローカルブランチを同じ名前のリモートブランチにプッシュする</div>
<pre>
$ git <em class="blue">push</em>
</pre>
</div>
- 引数を省略すると`origin`という名前のリモートリポジトリに現在のブランチをプッシュします。
- `origin`に同じ名前のブランチがない場合は、引数を省略せずに明示的にリポジトリとブランチを作成する必要があります。

<div class="code-box">
<div class="title">ローカルブランチをリモートブランチにプッシュする</div>
<pre>
$ git <em class="blue">push</em> <em>&lt;リモートリポジトリ名&gt;</em> <em>&lt;ローカルブランチ名&gt;:&lt;リモートブランチ名&gt;</em>
</pre>
</div>
- リモートブランチが存在しない場合、リモートリポジトリに新しくその`<リモートブランチ名>`でブランチを作成しにいきます。
- `git push`により作成・削除されるリモートブランチは、リモートリポジトリのローカルブランチと同じものです。
- リポジトリ上で`git branch`などにより直接操作できる。

<div class="code-box">
<div class="title">リモートブランチを削除する</div>
<pre>
$ git <em class="blue">push</em> <em>&lt;リモートリポジトリ名&gt;</em> <em>:&lt;リモートブランチ名&gt;</em>
</pre>
</div>
- `<リモートブランチ名>`の前の`:(コロン)`の前にはスペースが必要です。

<div class="code-box">
<div class="title">古くなったリモートブランチを取り除く</div>
<pre>
$ git <em class="blue">remote prune</em> <em>&lt;リモートリポジトリ名&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">リモートリポジトリと、それに関係するブランチをすべて取り除く</div>
<pre>
$ git <em class="blue">remote rm</em> <em>&lt;リモートリポジトリ名&gt;</em>
</pre>
</div>
