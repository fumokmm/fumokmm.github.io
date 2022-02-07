---
title: Windowsでシンボリックリンクを作成する
article_group_id: tips-group
display_order: 50
created: 2021-12-24
updated: 2021-12-24
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#PowerShellで作成">PowerShellで作成</a></li>
<li><a href="#コマンドプロンプトで作成">コマンドプロンプトで作成</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-24" updated="2021-12-24" %}</div>
- `PowerShell`の場合`New-Item`コマンドレットを使います。
- `コマンドプロンプト`の場合`mklink`コマンドを使います。

{% include goto_pagetop.html %}

* * *
## <a name="PowerShellで作成">PowerShellで作成</a><a class="heading-anchor-permalink" href="#PowerShellで作成">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-24" updated="2021-12-24" %}</div>
<div class="code-box-syntax no-title">
<pre>
New-Item -Value <em>&lt;リンク先フォルダ&gt;</em> -Path <em>&lt;シンボリックリンクの配置先&gt;</em> -Name <em>&lt;シンボリックリンク名&gt;</em> <em class="blue">-ItemType SymbolicLink</em>
</pre>
</div>
PowerShellの場合は、ファイル、フォルダへのシンボリックリンクのどちらもこの書式で記述できます。

### 例
<div class="code-box no-title">
<pre>
New-Item -Value "C:\Program Files\Java\jdk-13.0.1" -Path "C:\temp" -Name "java-currentver" -ItemType SymbolicLink
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="コマンドプロンプトで作成">コマンドプロンプトで作成</a><a class="heading-anchor-permalink" href="#コマンドプロンプトで作成">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-24" updated="2021-12-24" %}</div>
<div class="code-box-syntax">
<div class="title">ファイルのシンボリックリンク</div>
<pre>
mklink <em>&lt;シンボリックリンク名&gt;</em> <em>&lt;ファイルへのパス&gt;</em>
</pre>
</div>
- ファイルの場合はオプション要らない。

<div class="code-box-syntax">
<div class="title">フォルダのシンボリックリンク</div>
<pre>
mklink <em class="blue">/d</em> <em>&lt;シンボリックリンク名&gt;</em> <em>&lt;ファイルへのパス&gt;</em>
</pre>
</div>
- ディレクトリの場合は`/d オプション`を付ける。

### 例
<div class="code-box no-title">
<pre>
mklink /d "C:\temp\java-currentver" "C:\Program Files\Java\jdk-13.0.1"
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-24" updated="2021-12-24" %}</div>
### 参考サイト
- [(No Programming, No Life) Windowsでもシンボリックリンクが使える話](https://npnl.hatenablog.jp/entry/2019/11/21/233025)
- [(iPentec) シンボリックリンクの作成と削除 (Windows Tips)](https://www.ipentec.com/document/windows-create-symbolic-link)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
