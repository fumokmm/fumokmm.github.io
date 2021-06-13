---
title: PowerShellでファイルパスのフルパスを解決する
article_group_id: tips-group
display_order: 65
created: 2021-06-13
updated: 2021-06-13
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#Resolve-Pathを利用する">Resolve-Pathを利用する</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="Resolve-Pathを利用する">Resolve-Pathを利用する</a><a class="heading-anchor-permalink" href="#Resolve-Pathを利用する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-13" updated="2021-06-13" %}</div>
`Resolve-Path`を使います。

<div class="code-box-output no-title">
<pre>
<em class="command">PS C:\temp\java-currentver&gt;</em> ls


    ディレクトリ: C:\temp\java-currentver


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----        2019/11/08     21:30                bin
d-----        2019/11/08     21:30                conf
d-----        2019/11/08     21:30                include
d-----        2019/11/08     21:30                jmods
d-----        2019/11/08     21:30                legal
d-----        2019/11/08     21:30                lib
-a----        2019/10/06     12:01           3244 COPYRIGHT
-a----        2019/11/08     21:30           1263 release


<em class="command">PS C:\temp\java-currentver&gt;</em> cd lib
<em class="command">PS C:\temp\java-currentver\lib&gt;</em> <em>Resolve-Path</em> <em class="blue">..\bin</em>

Path
----
C:\temp\java-currentver\bin
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-13" updated="2021-06-13" %}</div>
- [(Microsoft \| Docs) Resolve-Path](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/resolve-path?view=powershell-7.1)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
