---
title: Windows Batchで空ファイルを作成する
article_group_id: reverse-lookup
display_order: 10
created: 2021-08-13
updated: 2021-08-13
---
いわゆるLinuxで言うところの`touch`コマンド。
## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#typeコマンドを使う">typeコマンドを使う</a></li>
<li><a href="#copyコマンドを使う">copyコマンドを使う</a></li>
<li><a href="#NULとは何？">NULとは何？</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="typeコマンドを使う">typeコマンドを使う</a><a class="heading-anchor-permalink" href="#typeコマンドを使う">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-13" updated="2021-08-13" %}</div>
<div class="code-box no-title">
<pre>
type nul &gt; empty.txt
</pre>
</div>
- ファイルは上書きされます。

{% include goto_pagetop.html %}

* * *
## <a name="copyコマンドを使う">copyコマンドを使う</a><a class="heading-anchor-permalink" href="#copyコマンドを使う">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-13" updated="2021-08-13" %}</div>
<div class="code-box no-title">
<pre>
copy nul empty.txt
</pre>
</div>
- ファイルは上書きされます。

{% include goto_pagetop.html %}

* * *
## <a name="NULとは何？">NULとは何？</a><a class="heading-anchor-permalink" href="#NULとは何？">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-13" updated="2021-08-13" %}</div>
- `NUL`はヌルデバイスと言います。
- Linuxでいう、`/dev/null`がWindowsでは`NUL`に相当するようです。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-13" updated="2021-08-13" %}</div>
### 関連メモ
- [PowerShellで空ファイルを作成する]({% link _it_articles/powershell/create_an_empty_file.md %})

### 参考サイト
- [(SOFTELメモ) 【Windows】空のファイルを作成する（Linuxで言うtouch）](https://www.softel.co.jp/blogs/tech/archives/4596)
- [(WIN.JUST4FUN.BIZ) ファイルサイズ0の空ファイルの作成方法](https://win.just4fun.biz/?%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E3%83%97%E3%83%AD%E3%83%B3%E3%83%97%E3%83%88/%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%B5%E3%82%A4%E3%82%BA0%E3%81%AE%E7%A9%BA%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%81%AE%E4%BD%9C%E6%88%90%E6%96%B9%E6%B3%95)

### ソース
- [(language-examples) 0001_empty_file.bat](https://github.com/fumokmm/language-examples/blob/main/Windows_Batch/0001_empty_file.bat)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
