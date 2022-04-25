---
title: Googleアカウント別のChrome起動用ショートカットを作成
article_group_id: setting-group
display_order: 20
created: 2020-09-25
updated: 2022-04-25
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#設定">設定</a></li>
<li><a href="#前に開いていたユーザプロファイルが立ち上がってしまう場合">前に開いていたユーザプロファイルが立ち上がってしまう場合</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="設定">設定</a><a class="heading-anchor-permalink" href="#設定">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-09-25" updated="2020-09-25" %}</div>
1. 右上の「三点アイコン」をクリック（`chrome://settings/` に直接アクセスしてもOK）します
1. 「設定」をクリックします
1. 「Google の設定」の中の「Chrome の名前と画像」をクリックします
1. 「デスクトップ ショートカットを表示」クリックして、スライダーをONにします
1. これでデスクトップにショートカットアイコンが出来上がります
1. 以上

{% include goto_pagetop.html %}

* * *
## <a name="前に開いていたユーザプロファイルが立ち上がってしまう場合">前に開いていたユーザプロファイルが立ち上がってしまう場合</a><a class="heading-anchor-permalink" href="#前に開いていたユーザプロファイルが立ち上がってしまう場合">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-25" updated="2022-04-25" %}</div>
たまに作成したショートカットを使っても、前に起動したユーザプロファイルのChromeが立ち上がってしまう場合があります。  
そんな時はショートカットの末尾に`--profile-directory`が付与されているか確認して下さい。
<div class="code-box no-title">
<pre>
--profile-directory="Profile X"
</pre>
</div>
- `X`には数値が入ります。

- この`--profile-directory`が指定されていると、指定したユーザプロファイルでChromeが立ち上がります。

<div class="code-box">
<div class="title">ショートカット例</div>
<pre>
リンク先: "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --profile-directory=<em>"Profile 4"</em>
</pre>
</div>

### Profile X
- `Profile X`の部分は以下にフォルダが作成されています。
- 人ごとに違いますので、ご自分の環境で確認してください。
- なお、最初にログインしたときのユーザは`Profile X`ではなく`Default`というプロファイル名になります。
<div class="code-box no-title">
<pre>
C:\Users\{Windowsユーザ名}\AppData\Local\Google\Chrome\User Data\<em>Profile X</em>
   or
C:\Users\{Windowsユーザ名}\AppData\Local\Google\Chrome\User Data\<em>Default</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-09-25" updated="2022-04-25" %}</div>
- [Googleアカウント別のChromeのショートカットを作成する方法](https://www.suzu6.net/posts/184-chrome-taskbar/)
- [(Effectiveさお) [Chrome] Google Chromeのマルチプロファイル設定](https://h-sao.com/blog/2017/01/04/how-to-use-multiple-browser-profiles-in-chrome/)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
