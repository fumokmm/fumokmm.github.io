---
title: PowerShellの文法
article_group_id: basis-group
display_order: 10
created: 2021-05-16
updated: 2021-07-20
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#関数">関数</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="関数">関数</a><a class="heading-anchor-permalink" href="#関数">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-20" updated="2021-07-20" %}</div>
### 可変長引数

可変長引数は変数`$args`という配列に渡されます。
<div class="code-box">
<div class="title">variable_length_parameter.ps1</div>
<pre>
function foo {
    Write-Host $args.Count
    foreach($i in $args) {
        Write-Host $i
    }
}

# 呼び出し
foo a b あいう
</pre>
</div>

<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
PS C:\temp&gt; .\variable_length_parameter.ps1
3
a     
b     
あいう
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-16" updated="2021-05-16" %}</div>
- [(PowerShell Scripting Weblog) PowerShell基礎文法最速マスター](http://winscript.jp/powershell/202)
- [(鷲ノ巣) PowerShell のスコープ完全に理解した](https://tech.blog.aerie.jp/entry/powershell-advent-calendar-2018-18)
- [(バヤシタ) ソースコードの式の途中で改行する方法](https://bayashita.com/p/entry/show/87)
- [(hakeの日記) PowerShell - 関数（可変長引数）](https://hake.hatenablog.com/entry/20161227/p1)
- [(hakeの日記) PowerShell - 関数（値渡しと参照渡し）](https://hake.hatenablog.com/entry/20161230/p1)
- [(HIRO's.NET) 03.引数を省略可能にするには](https://hiros-dot.net/PowerShell/function/func03.htm)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
