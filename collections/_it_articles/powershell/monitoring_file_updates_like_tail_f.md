---
title: PowerShellでファイル更新監視(tail -f)する
article_group_id: reverse-lookup-group
display_order: 120
created: 2022-02-17
updated: 2022-02-17
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#指定方法">指定方法</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-17" updated="2022-02-17" %}</div>
- Windowsの標準コマンドにはLinuxのような`tail`コマンドがありません。
- 代わりに、PowerShellの`Get-Content`コマンドレットを使うことで同じようなことが実現できます。

{% include goto_pagetop.html %}

* * *
## <a name="指定方法">指定方法</a><a class="heading-anchor-permalink" href="#指定方法">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-17" updated="2022-02-17" %}</div>
<div class="code-box-syntax no-title">
<pre>
<em>Get-Content</em> <em class="command">-Path</em> <em class="blue">&lt;ファイル名&gt;</em> <em class="command">-Wait</em> <em class="command">-Encoding</em> <em class="blue">&lt;ファイルの文字コード&gt;</em> <em class="command">-Tail</em> <em class="blue">&lt;表示行数&gt;</em>
</pre>
</div>
### 例：UTF-8のログファイルを監視
<div class="code-box-output no-title">
<pre>
Get-Content -Path <em>"C:\temp\app.log"</em> -Wait -Encoding <em>UTF8</em> -Tail <em>20</em>
</pre>
</div>
- 起動すると、最初に末尾20行が表示されます。
- 以降、ファイルに更新があると、その都度更新部分が追加で出力されていきます。
- 停止するには `Ctrl + C` を押下します。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-17" updated="2022-02-17" %}</div>
### 参考サイト
- [(株式会社システムトラスト) PowerShellでtailコマンドを実装する](https://it-engineer-info.com/language/powershell/tail-command)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
