---
title: .gitignoreのメモ
article_group_id: reference-group
display_order: 20
created: 2022-12-07
updated: 2022-12-07
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#基本">基本</a></li>
<li><a href="#ファイルを除外する">ファイルを除外する</a></li>
<li><a href="#ディレクトリを除外する">ディレクトリを除外する</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="基本">基本</a><a class="heading-anchor-permalink" href="#基本">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-12-07" updated="2022-12-07" %}</div>
あとで書く

{% include goto_pagetop.html %}

* * *
## <a name="ファイルを除外する">ファイルを除外する</a><a class="heading-anchor-permalink" href="#ファイルを除外する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-12-07" updated="2022-12-07" %}</div>
あとで書く

{% include goto_pagetop.html %}

* * *
## <a name="ディレクトリを除外する">ディレクトリを除外する</a><a class="heading-anchor-permalink" href="#ディレクトリを除外する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-12-07" updated="2022-12-07" %}</div>
- ディレクトリ配下のファイルを全て追跡対象から除外するときは、末尾に`/（スラッシュ）`を付ける。
- 末尾の`/（スラッシュ）`は「ディレクトリとその配下の除外」を意味する記号となる。
- もしスラッシュがなければ、通常のパターンマッチングとなり、パスにマッチがみつかればそれを除外します。
- もし`/（スラッシュ）`を付けないと、ファイルと同様、パスにマッチすればそれを除外することになる。（ディレクトリに無頓着になる）

<div class="code-box">
<div class="title">ディレクトリ配下（のすべてのパスを）除外する</div>
<div class="copy-button">Copy</div>
<pre>
directory-a<em>/</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-12-07" updated="2022-12-07" %}</div>
### 参考サイト
- [(WWWクリエイターズ \| 開発ブログ) .gitignore の書き方。ファイル/ディレクトリの除外](https://www-creators.com/archives/1662)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
