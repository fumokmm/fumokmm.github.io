---
title: C#で文字列を数値に変換する
article_group_id: tips-group
display_order: 10
created: 2022-02-21
updated: 2022-02-21
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#Parseメソッド">Parseメソッド</a></li>
<li><a href="#TryParseメソッド">TryParseメソッド</a></li>
<li><a href="#Convertメソッド">Convertメソッド</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-21" updated="2022-02-21" %}</div>
C#で文字列を数値に変換するには、数値型(int、long、doubleなど)にある`Parse`または`TryParse`メソッドや、`System.Convert`クラスのメソッドを使用します。

{% include goto_pagetop.html %}

* * *
## <a name="Parseメソッド">Parseメソッド</a><a class="heading-anchor-permalink" href="#Parseメソッド">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-21" updated="2022-02-21" %}</div>
Parseメソッドは、変換に失敗した時に、`FormatException`がスローされますので、try-catchで例外を捕捉する必要があります。
<div class="code-box-syntax no-title">
<pre>
int result = int.<em>Parse</em>(<em class="blue">&lt;変換する文字列&gt;</em>);
</pre>
</div>
<div class="code-box">
<div class="title">例</div>
<pre>
string s = "10";
try
{
    int result = int.<em>Parse</em>(s);
    Console.WriteLine($"結果 {i}");
}
catch(FormatException e)
{
    Console.WriteLine($"エラー {e.Message}");
}
</pre>
</div>
- 文字列の先頭と末尾の空白文字は、無視されるみたいです。

{% include goto_pagetop.html %}

* * *
## <a name="TryParseメソッド">TryParseメソッド</a><a class="heading-anchor-permalink" href="#TryParseメソッド">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-21" updated="2022-02-21" %}</div>
TryParseメソッドは、変換に失敗した時は例外をスローするのではなく、単純に戻り値で`false`を返却します。  
変換した結果の受け取りは、第2引数にOUTパラメータで指定して受け取ります。
<div class="code-box-syntax no-title">
<pre>
bool result = int.<em>TryParse</em>(<em class="blue">&lt;変換する文字列&gt;</em>, <em class="blue">out &lt;変換結果&gt;</em>);
</pre>
</div>
<div class="code-box">
<div class="title">例</div>
<pre>
string s = "10";
int i = -1;
bool result = int.<em>TryParse</em>(s, <em class="blue">out i</em>);
Console.WriteLine($"結果: {i}, 変換成功:{result}");
</pre>
</div>
- 文字列の先頭と末尾の空白文字は、無視されるみたいです。

{% include goto_pagetop.html %}

* * *
## <a name="Convertメソッド">Convertメソッド</a><a class="heading-anchor-permalink" href="#Convertメソッド">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-21" updated="2022-02-21" %}</div>
Convertクラスの各変換メソッドを利用することもできます。
<div class="code-box-syntax no-title">
<pre>
int result = Convert.<em>ToInt32</em>(<em class="blue">&lt;変換する文字列&gt;</em>);
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-21" updated="2022-02-21" %}</div>
### 参考サイト
- [(Microsoft \|Docs) 文字列を数値に変換する方法 (C# プログラミング ガイド)](https://docs.microsoft.com/ja-jp/dotnet/csharp/programming-guide/types/how-to-convert-a-string-to-a-number)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
