---
title: PowerShellでコンソール画面のタイトルを変更する
article_group_id: tips-group
display_order: 40
created: 2022-02-17
updated: 2022-02-17
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#コマンド">コマンド</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-17" updated="2022-02-17" %}</div>
- `$Host.UI.RawUI.WindowTitle`に値を設定します。

{% include goto_pagetop.html %}

* * *
## <a name="コマンド">コマンド</a><a class="heading-anchor-permalink" href="#コマンド">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-17" updated="2022-02-17" %}</div>
<div class="code-box-syntax no-title">
<pre>
<em>$Host.UI.RawUI.WindowTitle</em> = <em class="blue">&lt;タイトル&gt;</em>
</pre>
</div>

### 例：コンソール画面のタイトルを Think Twice に変更
<div class="code-box-output no-title">
<pre>
$Host.UI.RawUI.WindowTitle = <em>"Think Twice"</em>
</pre>
</div>
<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20220217/20220217200850.png)
</p>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-17" updated="2022-02-17" %}</div>
- [(PowerShell Memo) コンソールをカスタマイズする](https://newpops.hatenadiary.org/entry/20060719/p1)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
