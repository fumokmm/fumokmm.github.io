---
title: Gitでファイル単位で元に戻す
article_group_id: case-study-group
display_order: 20
created: 2022-12-05
updated: 2022-12-05
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#手順">手順</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="手順">手順</a><a class="heading-anchor-permalink" href="#手順">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-12-05" updated="2022-12-05" %}</div>
### 1. 削除してしまったファイルを元に戻す
<div class="code-box">
<div class="title">a.txtを削除</div>
<div class="copy-button">Copy</div>
<pre>
$ git rm <em>a.txt</em>
</pre>
</div>
<div class="code-box">
<div class="title">a.txtの削除を元に戻す(ステージされた状態へ戻る)</div>
<div class="copy-button">Copy</div>
<pre>
$ git checkout HEAD <em>a.txt</em>
</pre>
</div>

（書き途中）

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-12-05" updated="2022-12-05" %}</div>
### 参考サイト
- [(Awesome Blog) Gitで誤って削除・編集したファイルを復元する方法](https://awesome-linus.com/2019/03/06/git-delete-or-edit-file-by-mistake/)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
