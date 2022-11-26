---
title: Gitでコミットした後に好きな時点へ戻り、その時点からコミットした時点までをローカル変更した状態として復元する
article_group_id: case-study-group
display_order: 10
created: 2022-11-26
updated: 2022-11-26
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#手順">手順</a></li>
<li><a href="#補足説明">補足説明</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-11-26" updated="2022-11-26" %}</div>
ちょっと使いどころの難しい`git reset --mixed`や`git reset --soft`の使い道を紹介します。

{% include goto_pagetop.html %}

* * *
## <a name="手順">手順</a><a class="heading-anchor-permalink" href="#手順">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-11-26" updated="2022-11-26" %}</div>
### 1. コミット後、ひとまず作業用のブランチを作ります
作業用ブランチ名は`work`とします。
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
$ git switch -c <em>work</em>
</pre>
</div>

### 2. 次に戻りたい地点まで、resetコマンドで戻ります
戻りたい地点を`xyz`とします。
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
$ git reset <em class="blue">--mixed</em> <em>xyz</em>
</pre>
</div>
- ここでのポイントは`--mixed`を指定することです。
- `reset`のデフォルトは`--mixed`なので、特に指定しなくても良いですが、ここでは敢えて意識するため指定しています。
<div class="code-box">
<div class="title">単純にこれでもOK</div>
<div class="copy-button">Copy</div>
<pre>
$ git reset <em>xyz</em>
</pre>
</div>

以上です。簡単でしょ？

{% include goto_pagetop.html %}

* * *
## <a name="補足説明">補足説明</a><a class="heading-anchor-permalink" href="#補足説明">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-11-26" updated="2022-11-26" %}</div>
### どういう状態か？
2の状態は「ローカル変更した状態」で「まだステージングしていない」状態となっています。  
つまり、戻りたい地点でちょっとファイルを編集しただけの状態ということです。  
この状態からの次のアクションとしては、コミットしたいファイルを`add`してステージし、その後コミットする感じです。  

### git merge --squashとの比較
ちなみに、ここで紹介しているやり方は、`git merge --squash`とだいたい同じです。  
やった作業内容を失いたくないので、ひとまず一時的に作ったブランチにコミットを溜め込んでおいて、  
最後にこの手法でコミットしたい場所まで戻って、差分を一つにまとめてコミットする、なんてことができますね。
`git merge --squash`の場合、コミットコメントをいい感じに寄せ集めてくれたりしますが、  
ここで紹介しているやり方のほうが柔軟に`add`し直せるので、便利かなと個人的には感じています。

### なんで最初にworkブランチを作っているのか？
これは、元々コミットしていたブランチで作業してしまうと、そのブランチの`HEAD`位置が`reset`によって書き換えられてしまい、  
元いた位置がわからなくなってしまうため、元いた位置(ブランチ)が消えないようにするために敢えてブランチを作ってから作業しているということです。

もしかすると、元のブランチを再利用したい人は、手順1でブランチを作るのではなく、タグでも付けておくという方法でもいいかもしれません。
<div class="code-box">
<div class="title">1の手順はタグでも可</div>
<div class="copy-button">Copy</div>
<pre>
git tag old_commit_point
</pre>
</div>

### ステージングした状態で戻りたい場合
2の状態はステージングされていない状態ですので  
仮に、「ステージングはした状態」として戻りたかった場合、以下のように`--mixed`を`--soft`に変えるだけです。  

戻りたい地点を`xyz`とします。
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
$ git reset <em class="blue">--soft</em> <em>xyz</em>
</pre>
</div>

あまりいい用例を思い浮かばないのですが、例えば
「コミットしたんだけど、コメントをミスったので、直前に戻ってコメントだけ修正して再コミットしたい場合」とかですかね。
いわゆる`git commit --amend`で同じことができたりするものです。(`xyz`の部分は`HEAD^`になるかと思います。)

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-11-26" updated="2022-11-26" %}</div>
### 関連メモ
- [Gitコマンドのメモ]({% link _it_articles/git/command.md %})

### 参考サイト
- [(Qiita) 第6話 git reset 3種類をどこよりもわかりやすい図解で解説！【連載】マンガでわかるGit ～コマンド編～](https://www.r-staffing.co.jp/engineer/entry/20191129_1)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
