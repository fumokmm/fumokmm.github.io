---
title: C#の文法
article_group_id: basis-group
display_order: 10
created: 2022-01-11
updated: 2022-01-11
---
ここではC#の文法を簡単にまとめておきます。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<div style="column-count: 2;">
    <ul id="index_ul">
        <li><a href="#型">型</a>
            <ul>
                <li><a href="#文字列型">文字列型</a></li>
            </ul>
        </li>
        <li><a href="#参照・参考">参照・参考</a>
            <ul>
                <li><a href="#参考サイト">参考サイト</a></li>
            </ul>
        </li>
    </ul>
</div>

## <a name="型">型</a><a class="heading-anchor-permalink" href="#型">§</a>
* * *
## <a name="文字列型">文字列型</a><a class="heading-anchor-permalink" href="#文字列型">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-01-11" updated="2022-01-11" %}</div>
### エイリアス
- C#では、`string`キーワードは`String`のエイリアスです。(`String`と`string`は同等)
- ただし、`using System;`がなくても機能することから、指定されたエイリアス`string`を使用することが推奨されている。

### 普通の文字列
<div class="code-box-syntax">
<div class="title">普通の文字列</div>
<pre>
string s = <em>"</em><em class="blue">C:\\path\\to\\file</em><em>"</em>;
</pre>
</div>
- 「`\`」はエスケープする必要があります。(「`\\`」と重ねて書く）


### @を使った文字列
<div class="code-box-syntax">
<div class="title">@を利用した文字列</div>
<pre>
string s = <em>@"</em><em class="blue">C:\path\to\file</em><em>"</em>;
</pre>
</div>
- `@`を使うとエスケープを行わずに「`\`」を文字列に含められます。
  - パスを指定したい場合などに便利です。
- これを、「@quoted(クォート) string」と呼びます。

他言語のヒアドキュメント的な使い方もできます。
<div class="code-box-syntax">
<div class="title">@を利用した文字列（改行入り）</div>
<pre>
string sql = <em>@"</em>
<em class="blue">SELECT *
FROM [XX]
WHERE [YY]</em>
<em>"</em>;
</pre>
</div>
- 文字列中に「`"`」を含めたい場合には、「`""`」と二重にする必要があります。
- 改行を含めることも可能になります。
  - SQLのように、複数行に分けて書きたい場合などに便利です。
- これを、「here(ヒア) string」と呼びます。

### 参考
- [(Microsoft \| Docs) 文字列 (C# プログラミング ガイド)](https://docs.microsoft.com/ja-jp/dotnet/csharp/programming-guide/strings/)
- [(ゆめとちぼーとげんじつと) C# の string では「@(アットマーク)」の意味を知っていると便利](https://blog.dreamhive.co.jp/yama/1149.html)

{% include goto_pagetop.html %}

## <a name="参照・参考">参照・参考</a><a class="heading-anchor-permalink" href="#参照・参考">§</a>
* * *
## <a name="参考サイト">参考サイト</a><a class="heading-anchor-permalink" href="#参考サイト">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-01-11" updated="2022-01-11" %}</div>
### 参照
- [(Microsoft \| Docs) 文字列 (C# プログラミング ガイド)](https://docs.microsoft.com/ja-jp/dotnet/csharp/programming-guide/strings/)

### 参考サイト
- [(ゆめとちぼーとげんじつと) C# の string では「@(アットマーク)」の意味を知っていると便利](https://blog.dreamhive.co.jp/yama/1149.html)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
