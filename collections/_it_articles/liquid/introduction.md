---
title: Liquidの紹介
display_order: 10
created: 2021-09-05
updated: 2021-09-05
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#Liquidとは？">Liquidとは？</a></li>
<li><a href="#オブジェクト">オブジェクト</a></li>
<li><a href="#タグ">タグ</a></li>
<li><a href="#フィルター">フィルター</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="Liquidとは？">Liquidとは？</a><a class="heading-anchor-permalink" href="#Liquidとは？">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-05" updated="2021-09-05" %}</div>
Liquidはオブジェクトとタグとフィルターを使ってテンプレートファイルを動的な表示コンテンツを作成するツールです。

{% include goto_pagetop.html %}

* * *
## <a name="オブジェクト">オブジェクト</a><a class="heading-anchor-permalink" href="#オブジェクト">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-05" updated="2021-09-05" %}</div>
{% raw %}
オブジェクトはLiquidがページに表示する内容の入れ物です。  
オブジェクトと変数は二重の波括弧(`{{` と `}}`)に値を評価され出力されます。

<div class="code-box">
<div class="title">Input</div>
<pre>
{{ page.title }}
</pre>
</div>

<div class="code-box-output">
<div class="title">Output</div>
<pre>
Liquidの紹介
</pre>
</div>

この例の場合、Liquidは`page`オブジェクトの`title`プロパティの内容を出力します。
それは "Liquidの紹介" という内容のテキストです。
{% endraw %}

{% include goto_pagetop.html %}

* * *
## <a name="タグ">タグ</a><a class="heading-anchor-permalink" href="#タグ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-05" updated="2021-09-08" %}</div>
{% raw %}
タグはテンプレート内でロジックは制御フローを生成します。  
波括弧とパーセント(`{%` と `%}`)で囲んだ内容は最終的には何も出力されません。  
ここの中では、変数に値を設定し、条件やループを生成することになります。

<div class="code-box">
<div class="title">Input</div>
<pre>
{% if user %}
  Hello {{ user.name }}!
{% endif %}
</pre>
</div>

<div class="code-box-output">
<div class="title">Output</div>
<pre>
  Hello fumo!
</pre>
</div>
{% endraw %}

タグは色々なタイプに分類されます。
- [制御フロー]({% link _it_articles/liquid/control_flow.md %})
- 繰り返し
- テンプレート
- [変数設定]({% link _it_articles/liquid/variable.md %})

詳細はまたあとで書きます。

{% include goto_pagetop.html %}

* * *
## <a name="フィルター">フィルター</a><a class="heading-anchor-permalink" href="#フィルター">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-05" updated="2021-09-05" %}</div>
{% raw %}
フィルターはLiquidのオブジェクトや変数の出力結果を変換します。関数みたいなものと考えてもらえるといいと思います。  
フィルターは二重波括弧内で使い、パイプ(`|`)で区切って変数などに適用して行きます。

<div class="code-box">
<div class="title">Input</div>
<pre>
{{ "/my/fancy/url" | append: ".html" }}
</pre>
</div>
<div class="code-box-output">
<div class="title">Output</div>
<pre>
/my/fancy/url.html
</pre>
</div>

一つに出力に対して複数のフィルターが使用されることもあります。適用順は左から右です。
<div class="code-box">
<div class="title">Input</div>
<pre>
{{ "fumo!" | capitalize | prepend: "Hello " }}
</pre>
</div>
<div class="code-box-output">
<div class="title">Output</div>
<pre>
Hello Fumo!
</pre>
</div>

この例では、まず "fumo!" という文字列の先頭を大文字にして、その後 "Hello " という文字列を頭にくっつけています。
{% endraw %}

利用可能な主なフィルターは[こちら]({% link _it_articles/liquid/filters.md %})で紹介しています。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-05" updated="2021-09-05" %}</div>
### 参照
- [(Liquid) Introduction](https://shopify.github.io/liquid/basics/introduction/)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
