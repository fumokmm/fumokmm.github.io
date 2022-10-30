---
title: Visual Studio Codeで拡張子別にフォントを変更する
article_group_id: tips-group
display_order: 60
created: 2022-10-30
updated: 2022-10-30
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#手順">手順</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-30" updated="2022-10-30" %}</div>
特定の拡張子でフォントを変えたい場合があるので、その時の手順をメモ。

{% include goto_pagetop.html %}

* * *
## <a name="手順">手順</a><a class="heading-anchor-permalink" href="#手順">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-30" updated="2022-10-30" %}</div>
- コマンドパレットで `Preferences: Configure Language Specific Settings...` と入力します。
- 言語(拡張子)の一覧が表示されるので、対象の言語を選択します。
- Settingsで`Text Editor > Font`あたりを選択し、フォントを設定します。

<p class="center size-6" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20221030/20221030102012.png)  
</p>

- もしくは、`settings.json`で以下のように編集する。
- 特定の言語の編集エリアでフォントを指定
<div class="code-box">
<div class="title">例：SQL</div>
<div class="copy-button">Copy</div>
<pre>
"[sql]": {
    "editor.fontFamily": <em>"monospace"</em>,
}
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-30" updated="2022-10-30" %}</div>
### 参考サイト
- [(メモ) VSCode：拡張子別にフォントを変更したい](https://masablg.blogspot.com/2020/07/vscode.html)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
