---
title: VBAの文法
article_group_id: basis-group
display_order: 10
created: 2020-09-08
updated: 2021-09-14
---
ここではVBAの文法を簡単にまとめておきます。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<div style="column-count: 2;">
    <ul id="index_ul">
        <li><a href="#基礎文法">基礎文法</a>
            <ul>
                <li><a href="#式">式</a></li>
                <li><a href="#リテラル">リテラル</a></li>
                <li><a href="#変数">変数</a></li>
                <li><a href="#条件分岐 - If-Then-Elseステートメント">条件分岐 - If-Then-Elseステートメント</a></li>
            </ul>
        </li>
        <li><a href="#参照・参考">参照・参考</a>
            <ul>
                <li><a href="#参考">参考</a></li>
            </ul>
        </li>
    </ul>
</div>

## <a name="基礎文法">基礎文法</a><a class="heading-anchor-permalink" href="#基礎文法">§</a>
* * *
## <a name="式">式</a><a class="heading-anchor-permalink" href="#式">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-09-08" updated="2020-09-09" %}</div>
VBAには様々な式が存在します。`数式`, `条件式`, `オブジェクト式`, `代入式`などです。  
式とは、`数値`、`ブール値`、`日付`、`文字列`、`オブジェクト`などの`値`を生成する  
[`リテラル`](#リテラル)、`演算子`、`変数`、`定数`、`関数`、`キーワード`などによる組み合わせのことを言います。  
式は計算され、いずれかの値に確定します。式の値が確定することを評価するとも言います。

{% include goto_pagetop.html %}

* * *
## <a name="リテラル">リテラル</a><a class="heading-anchor-permalink" href="#リテラル">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-09-08" updated="2020-09-09" %}</div>
「`100`」という数値や、「`True`」というブール値、「`"Hello"`」という文字列など、  
それぞれ定められた記法により、式の中で直接仕様することができます。  
定められた記法および、その値自体のことを`リテラル`と呼びます。

{% include goto_pagetop.html %}

* * *
## <a name="変数">変数</a><a class="heading-anchor-permalink" href="#変数">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-09-08" updated="2020-09-09" %}</div>
変数は数値、文字列などの値を格納することができる名前付きの保存場所です。  
変数の値はプログラム内で自由に変更することができます。  
値を変更することを代入といいます。  
また変数の名前と種類について定義することを宣言といいます。

{% include goto_pagetop.html %}

* * *
## <a name="条件分岐 - If-Then-Elseステートメント">条件分岐 - If-Then-Elseステートメント</a><a class="heading-anchor-permalink" href="#条件分岐 - If-Then-Elseステートメント">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-14" updated="2021-09-14" %}</div>
### If-Then-Else
<div class="code-box-syntax no-title">
<pre>
<em>If</em> <em class="blue">&lt;条件式&gt;</em> <em>Then</em>
    <em class="orange">処理1</em>
<em>Else</em>
    <em class="orange">処理2</em>
<em>End If</em>
</pre>
</div>
- `If`に続いて`<条件式>`を記述します。
- `条件式`が`True`であれば`Then`に続く`処理1`が実行されます。
- `条件式`が`False`であれば`Else`に続く`処理2`が実行されます。
- `Else句`は省略可能です。

- 条件には`ブール式`または`数値式`を指定します。  
  - `数値式`の場合、`0`は`False`、`0以外`はすべて`True`と判定されます。

以下のように一行に記述することもできます。  
<div class="code-box-syntax no-title">
<pre>
<em>If</em> <em class="blue">&lt;条件&gt;</em> <em>Then</em> <em class="orange">処理1</em> <em>Else</em> <em class="orange">&lt;処理2&gt;</em>
</pre>
</div>
- 一行に記述した場合、末尾の`End If`は省略可能です。

### If-ElseIf
あとで書きます。

{% include goto_pagetop.html %}

## <a name="参照・参考">参照・参考</a><a class="heading-anchor-permalink" href="#参照・参考">§</a>
* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-09-08" updated="2020-09-09" %}</div>
- {% include book/book_449.html %} {% comment %} パーフェクト Excel VBA {% endcomment %}

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
