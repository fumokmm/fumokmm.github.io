---
title: Juliaの文法
display_order: 20
created: 2021-06-09
updated: 2021-06-09
---
ここではJuliaの文法を簡単にまとめておきます。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<div style="column-count: 2;">
    <ul id="index_ul">
        <li><a href="#run">実行方法</a>
            <ul>
                <li><a href="#スクリプトファイル">スクリプトファイル</a></li>
            </ul>
        </li>
        <li><a href="#reference-group">参照・参考</a>
            <ul>
                <li><a href="#参考">参考</a></li>
            </ul>
        </li>
    </ul>
</div>

## <a name="run">実行方法</a><a class="heading-anchor-permalink" href="#run">§</a>
* * *
## <a name="スクリプトファイル">スクリプトファイル</a><a class="heading-anchor-permalink" href="#スクリプトファイル">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-09" updated="2021-06-09" %}</div>
<div class="code-box">
<div class="title">0001_julia.jl</div>
<pre>
println(<em>PROGRAM_FILE</em>)
for x in <em class="blue">ARGS</em>
    println(x)
end
</pre>
</div>
- スクリプトファイルの拡張子は`.jl`。

<div class="code-box-output no-title">
<pre>
<em class="command">$</em> julia <em>.\0001_julia.jl</em> <em class="blue">1 2 A</em>

.\0001_julia.jl
1
2
A
</pre>
</div>
- 実行はコンソールで、`julia`にスクリプトファイルと引数を指定する。
- `PROGRAM_FILE`でスクリプトファイル名を参照できる。
- `ARGS`で引数を参照できる。

### ソース
- [language-examples](https://github.com/fumokmm/language-examples/tree/main/Julia)

{% include goto_pagetop.html %}

## <a name="reference-group">参照・参考</a><a class="heading-anchor-permalink" href="#reference-group">§</a>
* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-09" updated="2021-06-09" %}</div>
- [(Julia公式) Getting Started](https://docs.julialang.org/en/v1/manual/getting-started/)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
