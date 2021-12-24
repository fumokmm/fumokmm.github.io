---
title: Gitコマンドのメモ
article_group_id: reference-group
display_order: 10
created: 2010-11-07
updated: 2021-12-24
---
当メモは2010-11-07に[投稿されたもの](https://npnl.hatenablog.jp/entry/20101107/1289121576)を加筆修正し、再掲したものです。
基本的に当時の内容そのままとなっておりますので、8割りくらいは今でも通用すると思いますが、  
廃止になっている機能もあるかもしれませんのでご注意下さい。  

このリファレンスはGitのコマンドの網羅的な説明にはなっていません。  
よく使う(と思われる)機能をさらっと調べるためのリファレンスですので、  
より詳細な機能を調べる際には[Git ユーザマニュアル (バージョン 1.5.3 以降用)](https://img.atwikiimg.com/www8.atwiki.jp/git_jp/pub/Documentation.ja/user-manual.html)や[Gitマニュアルのリファレンス](https://git-scm.com/docs)などをご参照下さい。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#設定と初期化(config)">設定と初期化(config)</a></li>
<li><a href="#リポジトリの初期化(init, clone)">リポジトリの初期化(init, clone)</a></li>
<li><a href="#日常の作業(add, commit, checkout, reset)">日常の作業(add, commit, checkout, reset)</a></li>
<li><a href="#変更の退避(stash)">変更の退避(stash)</a></li>
<li><a href="#ブランチ(branch, merge, cherry-pick)">ブランチ(branch, merge, cherry-pick)</a></li>
<li><a href="#タグ(tag)">タグ(tag)</a></li>
<li><a href="#履歴(log, diff)">履歴(log, diff)</a></li>
<li><a href="#リモートリポジトリ(remote)">リモートリポジトリ(remote)</a></li>
<li><a href="#サブモジュール(submodule)">サブモジュール(submodule)</a></li>
<li><a href="#GitとSubversionの橋渡し(svn)">GitとSubversionの橋渡し(svn)</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="設定と初期化(config)">設定と初期化(config)</a><a class="heading-anchor-permalink" href="#設定と初期化(config)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2010-11-07" updated="2021-12-24" %}</div>
<div class="code-box">
<div class="title">現在の設定のリストを出力する</div>
<pre>
$ git <em class="blue">config</em> <em class="command">--global</em> <em>-l</em>
</pre>
</div>
<div class="code-box">
<div class="title">グローバルなユーザ名とメールアドレスを設定する</div>
<pre>
$ git <em class="blue">config</em> <em class="command">--global</em> <em>user.name "hoge"</em>
$ git <em class="blue">config</em> <em class="command">--global</em> <em>user.email "hoge@hoge.com"</em>
</pre>
</div>
<div class="code-box">
<div class="title">グローバルなユーザ名とメールアドレス設定を削除する</div>
<pre>
$ git <em class="blue">config</em> <em class="command">--global</em> <em class="command">--unset</em> <em>user.name</em>
$ git <em class="blue">config</em> <em class="command">--global</em> <em class="command">--unset</em> <em>user.email</em>
</pre>
</div>
<div class="code-box">
<div class="title">グローバルなコミットやタグのメッセージ編集用のエディタを設定する</div>
<pre>
$ git <em class="blue">config</em> <em class="command">--global</em> <em>core.editor emacs</em>
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
<div class="code-box">
<div class="title">特定のリポジトリ用のユーザ名とメールアドレス設定を削除する</div>
<pre>
$ cd /path/to/repo
$ git <em class="blue">config</em> <em class="command">--unset</em> <em>user.name</em>
$ git <em class="blue">config</em> <em class="command">--unset</em> <em>user.email</em>
</pre>
</div>
<div class="code-box">
<div class="title">特定のリポジトリ用のコミットやタグのメッセージ編集用のエディタを設定する</div>
<pre>
$ cd /path/to/repo
$ git <em class="blue">config</em> <em>core.editor emacs</em>
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

{% include goto_pagetop.html %}

* * *
## <a name="リポジトリの初期化(init, clone)">リポジトリの初期化(init, clone)</a><a class="heading-anchor-permalink" href="#リポジトリの初期化(init, clone)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2010-11-07" updated="2010-11-07" %}</div>
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

{% include goto_pagetop.html %}

* * *
## <a name="日常の作業(add, commit, checkout, reset)">日常の作業(add, commit, checkout, reset)</a><a class="heading-anchor-permalink" href="#日常の作業(add, commit, checkout, reset)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2010-11-07" updated="2010-11-07" %}</div>
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

{% include goto_pagetop.html %}

* * *
## <a name="変更の退避(stash)">変更の退避(stash)</a><a class="heading-anchor-permalink" href="#変更の退避(stash)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-20" updated="2021-06-20" %}</div>
<div class="code-box">
<div class="title">変更を退避する</div>
<pre>
git <em class="blue">stash push</em>
または
git <em class="blue">stash</em>
</pre>
</div>
- コミットされていない変更が退避されます。(`add`したものとしていないものが含まれる)

<div class="code-box">
<div class="title">変更を退避するとき、addしたものは退避しない</div>
<pre>
git <em class="blue">stash push</em> <em class="command">-k</em>
または
git <em class="blue">stash push</em> <em class="command">--keep-index</em>
</pre>
</div>

<div class="code-box">
<div class="title">変更を退避するとき、新規作成されたファイルも一緒に退避する</div>
<pre>
git <em class="blue">stash push</em> <em class="command">-u</em>
または
git <em class="blue">stash push</em> <em class="command">--include-untracked</em>
</pre>
</div>

<div class="code-box">
<div class="title">変更を退避するときにメッセージも付けて退避する</div>
<pre>
git <em class="blue">stash push</em> <em class="command">-m</em> <em>"メッセージ"</em>
</pre>
</div>

<div class="code-box">
<div class="title">退避した作業の一覧を見る</div>
<pre>
git <em class="blue">stash list</em>
</pre>
</div>

<div class="code-box">
<div class="title">退避した作業を戻す</div>
<pre>
git <em class="blue">stash apply</em> <em>&lt;スタッシュ名&gt;</em>
</pre>
</div>
- `<stash名>`は`git stash list`で見た時に出てくる`stash@{0}`のようなものです。
- `apply`すると、`add`していた変更も`add`されていない状態で戻ります。

<div class="code-box">
<div class="title">退避した作業をaddした状態のまま戻す</div>
<pre>
git <em class="blue">stash apply</em> <em>&lt;スタッシュ名&gt;</em> <em class="command">--index</em>
</pre>
</div>
- `add`した状態のまま戻したい場合は、`apply`するときに`--index`を付けます。

<div class="code-box">
<div class="title">退避した作業を消す</div>
<pre>
git <em class="blue">stash drop</em> <em>&lt;スタッシュ名&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">退避した作業をすべて消す</div>
<pre>
git <em class="blue">stash clear</em>
</pre>
</div>

<div class="code-box">
<div class="title">退避した作業を元に戻すと同時に、stashのリストからも消す</div>
<pre>
git <em class="blue">stash pop</em> <em>&lt;スタッシュ名&gt;</em>
</pre>
</div>
- `apply`してから`drop`するのと同じです。

<div class="code-box">
<div class="title">退避した変更のファイル一覧を見る</div>
<pre>
git <em class="blue">stash show</em> <em>&lt;スタッシュ名&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">退避した変更の詳細を見る</div>
<pre>
git <em class="blue">stash show</em> <em>&lt;スタッシュ名&gt;</em> <em class="command">-P</em>
</pre>
</div>

### 参考
- [Git - git-stash Documentation](https://git-scm.com/docs/git-stash)
- [(Qiita) 【git stash】コミットはせずに変更を退避したいとき](https://qiita.com/chihiro/items/f373873d5c2dfbd03250)
- [(サル先生のGit入門) Stash](https://backlog.com/ja/git-tutorial/reference/stash/)

{% include goto_pagetop.html %}

* * *
## <a name="ブランチ(branch, merge, cherry-pick)">ブランチ(branch, merge, cherry-pick)</a><a class="heading-anchor-permalink" href="#ブランチ(branch, merge, cherry-pick)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2010-11-07" updated="2021-03-23" %}</div>
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
<div class="title">強制的にマージコミットを作りながらマージ（ファストフォワードしない）</div>
<pre>
$ git <em class="blue">merge</em> <em class="command">--no-ff</em> <em>&lt;ブランチ名&gt;</em>
</pre>
</div>
- (参考) [(Qiita) マージコミットとFast-forwardマージ](https://qiita.com/shyamahira/items/59ff8aa1cf7b893aab60)

<div class="code-box">
<div class="title">特定のコミットのみ取り込む（チェリーピック）</div>
<pre>
$ git <em class="blue">cherry-pick</em> <em>&lt;コミット名&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">特定のコミット範囲(Aの一つ後～Bまで)のみ取り込む（チェリーピック）</div>
<pre>
$ git <em class="blue">cherry-pick</em> <em>&lt;コミットA&gt;</em>..<em>&lt;コミットB&gt;</em>
</pre>
</div>
- 範囲指定する際、始点の`<コミットA>`は[開始範囲に含まれない](https://dackdive.hateblo.jp/entry/2016/06/06/203542)ことに注意して下さい。
  - `<コミットA>`～`<コミットB>`を取り込みたい場合は、`コミットA^..コミットB`のようにして、`<コミットA>`の一つ前から指定します。

<div class="code-box">
<div class="title">特定のコミット範囲(AからBまで)のみ取り込む（チェリーピック）</div>
<pre>
$ git <em class="blue">cherry-pick</em> <em>&lt;コミットA&gt;^</em>..<em>&lt;コミットB&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">チェリーピックだけしてコミットしない（つまみ食いの寸止め）</div>
<pre>
$ git <em class="blue">cherry-pick</em> <em class="command">-n</em> <em>&lt;コミット名&gt;</em>
または
$ git <em class="blue">cherry-pick</em> <em class="command">--no-commit</em> <em>&lt;コミット名&gt;</em>
</pre>
</div>
- コミットはされず、ステージされた状態となります。

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

{% include goto_pagetop.html %}

* * *
## <a name="タグ(tag)">タグ(tag)</a><a class="heading-anchor-permalink" href="#タグ(tag)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2010-11-07" updated="2021-03-08" %}</div>
<div class="code-box">
<div class="title">タグを表示する</div>
<pre>
$ git <em class="blue">tag</em>
</pre>
</div>

<div class="code-box">
<div class="title">タグを付ける</div>
<pre>
$ git <em class="blue">tag</em> <em>&lt;タグ名&gt;</em>
</pre>
</div>
- 現在のブランチのHEADにタグが付けられる。

<div class="code-box">
<div class="title">別の時点のコミットにタグを付ける</div>
<pre>
$ git <em class="blue">tag</em> <em>&lt;タグ名&gt; &lt;コミット名&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">タグを削除する</div>
<pre>
$ git <em class="blue">tag</em> <em class="command">-d</em> <em>&lt;タグ名&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">タグをoriginにpushする</div>
<pre>
$ git <em class="blue">push origin</em> <em>&lt;タグ名&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">タグをoriginにpushする(強制上書き)</div>
<pre>
$ git <em class="blue">push origin</em> <em>&lt;タグ名&gt;</em> <em class="command">-f</em>
</pre>
</div>
- タグはブランチをpushしただけでは、originにpushされない([参照](https://qiita.com/aki_55p/items/530754ac6e861122f29b))ので、個別にpushする必要があります。

<div class="code-box">
<div class="title">originのタグを削除する</div>
<pre>
$ git <em class="blue">push</em> <em class="blue">origin</em> <em>:&lt;タグ名&gt;</em>
または
$ git <em class="blue">push</em> <em class="command">--delete</em> <em class="blue">origin</em> <em>&lt;タグ名&gt;</em>
</pre>
</div>
- (参考) [(Stack Overflow) How to delete a remote tag?](https://stackoverflow.com/questions/5480258/how-to-delete-a-remote-tag)
- 1つ目の指定方法は、`<タグ名>`の前にコロン(`:`)が必要
  - これは、`<ローカルのタグ名>:<リモートのタグ名>`を表す形式の、ローカルのタグ名が省略されているパターンです。
  - ローカルのタグを失くして、その状態をpushするところをイメージすると分かりやすいかもしれません。

{% include goto_pagetop.html %}

* * *
## <a name="履歴(log, diff)">履歴(log, diff)</a><a class="heading-anchor-permalink" href="#履歴(log, diff)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2010-11-07" updated="2021-05-20" %}</div>
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

{% include goto_pagetop.html %}

* * *
## <a name="リモートリポジトリ(remote)">リモートリポジトリ(remote)</a><a class="heading-anchor-permalink" href="#リモートリポジトリ(remote)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2010-11-07" updated="2010-11-07" %}</div>
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

{% include goto_pagetop.html %}

* * *
## <a name="サブモジュール(submodule)">サブモジュール(submodule)</a><a class="heading-anchor-permalink" href="#サブモジュール(submodule)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2010-11-07" updated="2010-11-07" %}</div>
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

{% include goto_pagetop.html %}

* * *
## <a name="GitとSubversionの橋渡し(svn)">GitとSubversionの橋渡し(svn)</a><a class="heading-anchor-permalink" href="#GitとSubversionの橋渡し(svn)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2010-11-07" updated="2010-11-07" %}</div>
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

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2010-11-07" updated="2021-09-27" %}</div>
### 元記事
- [(No Programming, No Life) Gitコマンドリファレンス](https://npnl.hatenablog.jp/entry/20101107/1289121576)

### 参照
- [Gitマニュアルのリファレンス](https://git-scm.com/docs)
- [Git ユーザマニュアル (バージョン 1.5.3 以降用)](https://img.atwikiimg.com/www8.atwiki.jp/git_jp/pub/Documentation.ja/user-manual.html)
- [8.1 Git のカスタマイズ - Git の設定](https://git-scm.com/book/ja/v2/Git-%E3%81%AE%E3%82%AB%E3%82%B9%E3%82%BF%E3%83%9E%E3%82%A4%E3%82%BA-Git-%E3%81%AE%E8%A8%AD%E5%AE%9A)

### 参考サイト
- [(dackdive's blog) \[git\]複数のcommitをまとめてcherry-pickする)](https://dackdive.hateblo.jp/entry/2016/06/06/203542)
- [(Hack Your Design!) 美しき git log --graph のエイリアス](https://blog.toshimaru.net/git-log-graph/)
- [(Qiita) 【git stash】コミットはせずに変更を退避したいとき](https://qiita.com/chihiro/items/f373873d5c2dfbd03250)
- [(Qiita) git で branch を push しただけじゃ tag は push されない話](https://qiita.com/aki_55p/items/530754ac6e861122f29b)
- [(Qiita) マージコミットとFast-forwardマージ](https://qiita.com/shyamahira/items/59ff8aa1cf7b893aab60)
- [(Stack Overflow) How to delete a remote tag?](https://stackoverflow.com/questions/5480258/how-to-delete-a-remote-tag)
- [(サル先生のGit入門) 7. merge --squash](https://backlog.com/ja/git-tutorial/stepup/34/)
- [(サル先生のGit入門) Stash](https://backlog.com/ja/git-tutorial/reference/stash/)
- [(まくまくGitノート) git diff や git status での日本語の文字化けを防ぐ (core.page, core.quotepath)](https://maku77.github.io/git/settings/garbling.html)
- [(侍エンジニアブログ) git cherry-pickを完全マスター!特定コミットのみを取り込む方法](https://www.sejuku.net/blog/71544)
- [\[Git\] Git コマンドメモ - それはBlog](http://hamasyou.com/blog/2010/11/11/git/)
- [Git - git-stash Documentation](https://git-scm.com/docs/git-stash)
- [git submodule - みずぴー日記](https://mzp.hatenadiary.org/entry/20080508/git)
- [慣れてきたらコミットをまとめてPull Requestしよう（git merge --squash）](https://www.granfairs.com/blog/cto/git-merge-squash)

### 参考書籍
- {% include book/book_604.html %} {% comment %} 入門git {% endcomment %}

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
