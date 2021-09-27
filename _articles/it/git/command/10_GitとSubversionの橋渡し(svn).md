---
chapter_no: 10
chapter_title: GitとSubversionの橋渡し(svn)
created: 2010-11-07
updated: 2010-11-07
---
<div class="code-box">
<div class="title">Subversionリポジトリ全体のクローンを作る</div>
<pre>
$ git <em class="blue">svn clone</em> <em>&lt;Subversionのリポジトリ&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">標準のレイアウトを持つSubversionのリポジトリ全体のクローンを作る</div>
<pre>
$ git <em class="blue">svn clone</em> <em class="command">-s</em> <em>&lt;Subversionのリポジトリ&gt;</em>
</pre>
</div>
- `trunk`、`branches`、`tags`による標準の構造を持つSubversionリポジトリのクローン作成に使います。


<div class="code-box">
<div class="title">標準のレイアウトではないSubversionのリポジトリ全体のクローンを作る</div>
<pre>
$ git <em class="blue">svn clone</em> <em class="command">-T</em> <em>&lt;trunkのパス&gt;</em> \
                <em class="command">-b</em> <em>&lt;branchesのパス&gt;</em> \
                <em class="command">-t</em> <em>&lt;tagsのパス&gt;</em> \
                <em>&lt;Subversionのリポジトリ&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">標準のレイアウトを持つSubversionのリポジトリのリビジョン1234のクローンを作る</div>
<pre>
$ git <em class="blue">svn clone</em> <em class="command">-s</em> <em class="command">-r</em> <em>1234</em>
</pre>
</div>

<div class="code-box">
<div class="title">標準のレイアウトを持つSubversionのリポジトリからクローンを作り、リモートブランチにすべてプレフィックスを付ける</div>
<pre>
$ git <em class="blue">svn clone</em> <em class="command">-s</em> <em class="command">--prefix</em> <em>svn/</em> <em>&lt;Subversionのリポジトリ&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">上流のSubversionのリポジトリから更新を取得してリベースする</div>
<pre>
$ git <em class="blue">svn rebase</em>
</pre>
</div>

<div class="code-box">
<div class="title">上流のSubversionのリポジトリに変更をプッシュして戻す</div>
<pre>
$ git <em class="blue">svn dcommit</em>
</pre>
</div>

<div class="code-box">
<div class="title">上流にプッシュされるコミットの一覧を表示する</div>
<pre>
$ git <em class="blue">svn dcommit</em> <em class="command">-n</em>
</pre>
</div>

<div class="code-box">
<div class="title">リポジトリのSubversionログを表示する</div>
<pre>
$ git <em class="blue">svn log</em>
</pre>
</div>

<div class="code-box">
<div class="title">ファイルのsvn blameを表示する</div>
<pre>
$ git <em class="blue">svn blame</em> <em>&lt;ファイル&gt;</em>
</pre>
</div>
