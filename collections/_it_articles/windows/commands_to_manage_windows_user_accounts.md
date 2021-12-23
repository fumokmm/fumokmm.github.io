---
title: Windowsのユーザアカウントを管理するコマンド(追加、削除、更新など)
article_group_id: server-management-group
display_order: 10
created: 2021-12-23
updated: 2021-12-23
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#ユーザを作成する">ユーザを作成する</a></li>
<li><a href="#ユーザを削除する">ユーザを削除する</a></li>
<li><a href="#ユーザのパスワード変更する">ユーザのパスワード変更する</a></li>
<li><a href="#ユーザのフルネームを設定する">ユーザのフルネームを設定する</a></li>
<li><a href="#ユーザの説明を設定する">ユーザの説明を設定する</a></li>
<li><a href="#ユーザをグループに追加する">ユーザをグループに追加する</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-23" updated="2021-12-23" %}</div>
Windowsでユーザ管理するには基本的には`net user`コマンドを使います。  
グループに追加する場合などには、`net localgroup`コマンドを使います。

{% include goto_pagetop.html %}

* * *
## <a name="ユーザを作成する">ユーザを作成する</a><a class="heading-anchor-permalink" href="#ユーザを作成する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-23" updated="2021-12-23" %}</div>
<div class="code-box-syntax no-title">
<pre>
net user <em>&lt;ユーザ名&gt;</em> <em>&lt;パスワード&gt;</em> <em class="blue">/add</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="ユーザを削除する">ユーザを削除する</a><a class="heading-anchor-permalink" href="#ユーザを削除する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-23" updated="2021-12-23" %}</div>
<div class="code-box-syntax no-title">
<pre>
net user <em>&lt;ユーザ名&gt;</em> <em class="blue">/delete</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="ユーザのパスワード変更する">ユーザのパスワード変更する</a><a class="heading-anchor-permalink" href="#ユーザのパスワード変更する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-23" updated="2021-12-23" %}</div>
<div class="code-box-syntax no-title">
<pre>
net user <em>&lt;ユーザ名&gt;</em> <em>&lt;新しいパスワード&gt;</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="ユーザのフルネームを設定する">ユーザのフルネームを設定する</a><a class="heading-anchor-permalink" href="#ユーザのフルネームを設定する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-23" updated="2021-12-23" %}</div>
<div class="code-box-syntax no-title">
<pre>
net user <em>&lt;ユーザ名&gt;</em> <em class="blue">/fullname</em>:<em class="orange">"&lt;フルネーム&gt;"</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="ユーザの説明を設定する">ユーザの説明を設定する</a><a class="heading-anchor-permalink" href="#ユーザの説明を設定する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-23" updated="2021-12-23" %}</div>
<div class="code-box-syntax no-title">
<pre>
net user <em>&lt;ユーザ名&gt;</em> <em class="blue">/comment</em>:<em class="orange">"&lt;説明&gt;"</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="ユーザをグループに追加する">ユーザをグループに追加する</a><a class="heading-anchor-permalink" href="#ユーザをグループに追加する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-23" updated="2021-12-23" %}</div>
<div class="code-box-syntax no-title">
<pre>
net localgroup <em>&lt;グループ名&gt;</em> <em>&lt;ユーザ名&gt;</em> <em class="blue">/add</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-23" updated="2021-12-23" %}</div>
### 参考サイト
- [(@IT) Windowsの「net user」コマンドでユーザーアカウントをコマンドラインから管理する](https://atmarkit.itmedia.co.jp/ait/articles/0609/02/news014.html)
- [(Windows 自動化技術大全) 新しいユーザーアカウントをバッチで作成する方法【共通編】](https://automationlabo.com/wat/?p=8957)
- [(Windowsコマンド虎の巻) net user](https://windows.command-ref.com/cmd-net-user.html)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
