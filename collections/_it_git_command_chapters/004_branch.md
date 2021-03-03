---
chapter_no: 004
chapter_id: branch
chapter_title: ブランチ(branch, merge, cherry-pick)
created: 2010-11-07
updated: 2021-03-03
---
<div class="code-box">
<div class="title">ローカルのブランチを表示する</div>
<pre>
$ git <em class="blue">branch</em>
</pre>
</div>

<div class="code-box">
<div class="title">リモートのブランチだけを表示する</div>
<pre>
$ git <em class="blue">branch</em> <em class="command">-r</em>
</pre>
</div>

<div class="code-box">
<div class="title">ローカルとリモートのブランチをすべて表示する</div>
<pre>
$ git <em class="blue">branch</em> <em class="command">-a</em>
</pre>
</div>

<div class="code-box">
<div class="title">現在のブランチから新しいブランチを作る</div>
<pre>
$ git <em class="blue">branch</em> <em>&lt;新しいブランチ名&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">別のブランチをチェックアウトする</div>
<pre>
$ git <em class="blue">checkout</em> <em>&lt;ブランチ名&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">現在のブランチから新しいブランチを作り、ついでにチェックアウトまでする</div>
<pre>
$ git <em class="blue">checkout</em> <em class="command">-b</em> <em>&lt;ブランチ名&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">別の時点を起点にしたブランチを作る</div>
<pre>
$ git <em class="blue">branch</em> <em>&lt;新しいブランチ名&gt;</em> <em>&lt;起点&gt;</em>
</pre>
</div>
- リポジトリの履歴のどの時点からでも、そこを`<起点>`としたブランチを作成できます。  
- `<起点>`にするのは、`別のブランチ名`でも`コミット名`でも`タグ名`でもよいです。

<div class="code-box">
<div class="title">ブランチの移動または名前の変更</div>
<pre>
$ git <em class="blue">branch</em> <em class="option">-m</em> <em>&lt;既存のブランチ名&gt;</em> <em>&lt;新しいブランチ名&gt;</em>
</pre>
</div>
- `<新しいブランチ名>`が存在しない場合のみ成功します。

<div class="code-box">
<div class="title">別のブランチを現在のブランチにマージする</div>
<pre>
$ git <em class="blue">merge</em> <em>&lt;ブランチ名&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">マージだけしてコミットしない（寸止め）</div>
<pre>
$ git <em class="blue">merge</em> <em class="command">--no-commit</em> <em>&lt;ブランチ名&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">コミットのチェリーピック（つまみ食い）</div>
<pre>
$ git <em class="blue">cherry-pick</em> <em class="command">-n</em> <em>&lt;コミット名&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">チェリーピックだけしてコミットしない（つまみ食いの寸止め）</div>
<pre>
$ git <em class="blue">cherry-pick</em> <em class="command">--no-commit</em> <em>&lt;コミット名&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">マージ済みのブランチ一覧を表示する</div>
<pre>
$ git <em class="blue">branch</em> <em class="command">--merged</em>
</pre>
</div>

<div class="code-box">
<div class="title">未マージのブランチ一覧を表示する</div>
<pre>
$ git <em class="blue">branch</em> <em class="command">--no-merged</em>
</pre>
</div>

<div class="code-box">
<div class="title">１つのブランチの履歴を圧縮して別の履歴にする</div>
<pre>
$ git <em class="blue">merge</em> <em class="command">--squash</em> <em>&lt;ブランチ名&gt;</em>
$ git <em class="blue">commit</em>
</pre>
</div>
- `<ブランチ名>`のブランチでコミットした内容が圧縮されてステージされた状態になりますので、その後コミットして下さい。

<div class="code-box">
<div class="title">ブランチを削除する</div>
<pre>
$ git <em class="blue">branch</em> <em class="command">-d</em> <em>&lt;削除するブランチ名&gt;</em>
</pre>
</div>
- ブランチが現在のブランチにマージされている場合のみ成功します。

<div class="code-box">
<div class="title">ブランチをなにがなんでも削除する</div>
<pre>
$ git <em class="blue">branch</em> <em class="command">-D</em> <em>&lt;削除するブランチ名&gt;</em>
</pre>
</div>
- ブランチが現在のブランチにマージされていなくても成功します。
