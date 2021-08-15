---
title: PowerShellでエスケープシーケンスと改行コードを変換する
article_group_id: reverse-lookup-group
display_order: 90
created: 2021-08-10
updated: 2021-08-10
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#-replaceを利用して置換する">-replaceを利用して置換する</a></li>
<li><a href="#エスケープシーケンスを改行コードへ変換">エスケープシーケンスを改行コードへ変換</a></li>
<li><a href="#改行コードをエスケープシーケンスへ変換">改行コードをエスケープシーケンスへ変換</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="-replaceを利用して置換する">-replaceを利用して置換する</a><a class="heading-anchor-permalink" href="#-replaceを利用して置換する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-10" updated="2021-08-10" %}</div>
- `-replace`を使います。  
- PowerShellではエスケープ文字がバックスラッシュ`\`ではなくて、バッククォート<code>`</code>なので注意が必要。

{% include goto_pagetop.html %}

* * *
## <a name="エスケープシーケンスを改行コードへ変換">エスケープシーケンスを改行コードへ変換</a><a class="heading-anchor-permalink" href="#エスケープシーケンスを改行コードへ変換">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-10" updated="2021-08-10" %}</div>
<div class="code-box no-title">
<pre>
$esc = "aaa\nbbb\nccc"
Write-Host "1: $($esc)"
$esc2 = $esc <em>-replace</em> <em class="blue">'\\n'</em>, <em class="blue">"`r`n"</em>
Write-Host "2: $($esc2)"
</pre>
</div>
- こちらはエスケープ文字`\n`を`改行コード(CRLF)`に変換するサンプルです。
<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
1: aaa\nbbb\nccc
2: aaa
bbb
ccc
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="改行コードをエスケープシーケンスへ変換">改行コードをエスケープシーケンスへ変換</a><a class="heading-anchor-permalink" href="#改行コードをエスケープシーケンスへ変換">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-10" updated="2021-08-10" %}</div>
<div class="code-box no-title">
<pre>
$crlf = @"
aaa
bbb
ccc
"@
Write-Host "3: $($crlf)"
$crlf2 = $crlf <em>-replace</em> <em class="blue">"`r`n"</em>, <em class="blue">"\n"</em>
Write-Host "4: $($crlf2)"
</pre>
</div>
- こちらは改行コード入りの`改行コード(CRLF)`をエスケープ文字`\n`にエスケープするサンプルです。
<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
3: aaa
bbb
ccc
4: aaa\nbbb\nccc
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-10" updated="2021-08-10" %}</div>
### 参考サイト
- [(Qiita) PowerShellで改行コードを\nエスケープシーケンスに変換する](https://qiita.com/shingo_kawahara/items/05e7b4a23eb5457f75ea)

### ソース
- [(language-examples) 0019_convert_cr_lf.ps1](https://github.com/fumokmm/language-examples/blob/main/PowerShell/0019_convert_cr_lf.ps1)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
