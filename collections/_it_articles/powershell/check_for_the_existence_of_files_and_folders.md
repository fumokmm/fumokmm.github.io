---
title: PowerShellでファイルやフォルダの存在チェックを行う
article_group_id: reverse-lookup
display_order: 67
created: 2021-07-24
updated: 2021-07-24
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#Test-Pathを利用する">Test-Pathを利用する</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="Test-Pathを利用する">Test-Pathを利用する</a><a class="heading-anchor-permalink" href="#Test-Pathを利用する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-24" updated="2021-07-24" %}</div>
- `Test-Path`を使います。  
- ファイルやフォルダが存在する場合`True`が、存在しない場合`False`が返ってきます。

<div class="code-box-output no-title">
<pre>
<em class="command">PS C:\Users\fumo&gt;</em> ls c:\temp


    ディレクトリ: C:\temp


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
                     :
                     : (略)
                     :
-a----        2021/06/14      0:26             31 out.txt
-a----        2021/06/14      0:26             31 out2.txt
-a----        2021/06/14      0:26             70 out3.txt
                     :
                     : (略)
                     :


<em class="command">PS C:\Users\fumo&gt;</em> <em>Test-Path</em> <em class="blue">C:\temp\out.txt</em>
True
<em class="command">PS C:\Users\fumo&gt;</em> <em>Test-Path</em> <em class="blue">C:\temp\out2.txt</em>
True
<em class="command">PS C:\Users\fumo&gt;</em> <em>Test-Path</em> <em class="blue">C:\temp\out3.txt</em>
True
<em class="command">PS C:\Users\fumo&gt;</em> <em>Test-Path</em> <em class="blue">C:\temp\out4.txt</em>
False
<em class="command">PS C:\Users\fumo&gt;</em> <em>Test-Path</em> <em class="blue">C:\temp</em>
True
<em class="command">PS C:\Users\fumo&gt;</em> <em>Test-Path</em> <em class="blue">C:\temp2</em>
False
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-24" updated="2021-07-24" %}</div>
- [(WIN.JUST4FUN.BIZ) Test-Pathコマンドレットを使用してファイル・フォルダの存在確認を行う方法](https://win.just4fun.biz/?PowerShell/%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%83%BB%E3%83%95%E3%82%A9%E3%83%AB%E3%83%80%E3%81%AE%E5%AD%98%E5%9C%A8%E3%83%81%E3%82%A7%E3%83%83%E3%82%AF%E3%83%BBTest-Path)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
