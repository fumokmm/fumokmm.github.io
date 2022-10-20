---
title: PowerShellでファイルパスからファイル名を取得する
article_group_id: reverse-lookup-group
display_order: 62
created: 2021-05-31
updated: 2021-05-31
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#System.IO.Pathを利用する">System.IO.Pathを利用する</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="System.IO.Pathを利用する">System.IO.Pathを利用する</a><a class="heading-anchor-permalink" href="#System.IO.Pathを利用する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-31" updated="2021-05-31" %}</div>
.NET APIの`System.IO.Path`を使う方法です。  
拡張子ありの場合は`GetFileName`を使います。拡張子なしの場合`GetFileNameWithoutExtension`を使います。

<div class="code-box-output">
<div class="title">拡張子あり</div>
<div class="copy-button">Copy</div>
<pre>
<em class="command">PS C:\Users\fumo&gt;</em> [System.IO.Path]::<em>GetFileName</em>("C:\temp\fileA.txt")
fileA.txt
</pre>
</div>

<div class="code-box-output">
<div class="title">拡張子なし</div>
<div class="copy-button">Copy</div>
<pre>
<em class="command">PS C:\Users\fumo&gt;</em> [System.IO.Path]::<em>GetFileNameWithoutExtension</em>("C:\temp\fileA.txt")
fileA
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-31" updated="2021-05-31" %}</div>
- [(Qiita @Kosen-amaiさん) PowerShellメモ　パス関連操作](https://qiita.com/Kosen-amai/items/c7669e711d6b5743a840)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
