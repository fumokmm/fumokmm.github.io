---
title: VBAの文法
article_group_id: basis-group
display_order: 10
created: 2020-09-08
updated: 2021-12-17
---
{% capture link_to_it_c %}{% link _it_articles/c/index.md %}{% endcapture %}
{% assign link_to_it_c = link_to_it_c | remove: 'index' %}

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
                <li><a href="#条件分岐 - Select-Caseステートメント">条件分岐 - Select-Caseステートメント</a></li>
            </ul>
        </li>
        <li><a href="#参照・参考">参照・参考</a>
            <ul>
                <li><a href="#参考サイト">参考サイト</a></li>
                <li><a href="#参考書籍">参考書籍</a></li>
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
<div class="copy-button">Copy</div>
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
<div class="copy-button">Copy</div>
<pre>
<em>If</em> <em class="blue">&lt;条件&gt;</em> <em>Then</em> <em class="orange">処理1</em> <em>Else</em> <em class="orange">&lt;処理2&gt;</em>
</pre>
</div>
- 一行に記述した場合、末尾の`End If`は省略可能です。

### If-ElseIf
あとで書きます。

{% include goto_pagetop.html %}

* * *
## <a name="条件分岐 - Select-Caseステートメント">条件分岐 - Select-Caseステートメント</a><a class="heading-anchor-permalink" href="#条件分岐 - Select-Caseステートメント">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-17" updated="2021-12-17" %}</div>
Select Case文は複数の条件分岐をすっきり書くための構文です。  
基本的には[条件分岐 - If-Then-Elseステートメント](#条件分岐 - If-Then-Elseステートメント)で書けるものです。

### Select-Case
<div class="code-box-syntax no-title">
<div class="copy-button">Copy</div>
<pre>
<em>Select Case</em> <em class="blue">&lt;比較する値&gt;</em>
    <em>Case</em> <em class="blue">&lt;条件1&gt;</em>
        <em class="comment">' 条件1を満たしたときの処理</em>
    <em>Case</em> <em class="blue">&lt;条件2&gt;</em>
        <em class="comment">' 条件2を満たしたときの処理</em>
    <em>Case Else</em>
        <em class="comment">' いずれの条件も満たさなかったときの処理</em>
<em>End Select</em>
</pre>
</div>
- [C言語]({{link_to_it_c}})と違って[フォールスルー](https://ja.wikipedia.org/wiki/Switch%E6%96%87#%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%82%B9%E3%83%AB%E3%83%BC)はしない。
- `<条件>`の書き方に以下パターンがあります。
  - 値とマッチするか。(完全一致)
  - 複数のどれかにマッチするか。(カンマ区切りる)
  - 範囲内に含まれる。(xx To yy)
  - 大小比較 (Is >= xx, Is <= xx)
- 上に記述した`<条件>`とマッチするか評価されてゆき、どれか一つでもマッチすると、以降の処理は実行されません。
- どの`<条件>`にもマッチしなかった場合、`Case Else`で指定した処理が実行されます。
  - `Case Else`を省略した場合で、かつどの`<条件>`にもマッチしなかった場合は、何も処理されません。

### 例：値とマッチ
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
Dim p_time As String
p_time = "朝"
Select Case p_time
    Case <em>"朝"</em>
        Debug.Print "おはようございます！"
    Case <em>"昼"</em>
        Debug.Print "こんにちは！"
    Case <em>"夜"</em>
        Debug.Print "こんばんは！"
    Case Else
        Debug.Print "Zzz..."
End Select
</pre>
</div>
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
おはようございます！
</pre>
</div>

### 例：複数のどれかにマッチ
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
Dim p_num As Integer
p_num = 5
Select Case p_num
    Case <em>1, 3, 5, 7, 9</em>
        Debug.Print p_num &amp; "は奇数です。"
    Case <em>2, 4, 6, 8</em>
        Debug.Print p_num &amp; "は偶数です。"
    Case Else
        Debug.Print "1から9までの値を指定してください。"
End Select
</pre>
</div>
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
5は奇数です。
</pre>
</div>

### 例：範囲内に含まれる
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
Dim p_age As Integer
p_age = 40
Select Case p_age
    Case <em>0 To 18</em>
        Debug.Print p_age &amp; "歳はこどもです。"
    Case <em>19 To 65</em>
        Debug.Print p_age &amp; "歳は大人です。"
    Case <em>66 To 99</em>
        Debug.Print p_age &amp; "歳はシニアです。"
    Case Else
        Debug.Print p_age &amp; "歳以上の人はセンテナリアンと呼びます。"
End Select
</pre>
</div>
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
40歳は大人です。
</pre>
</div>
- センテナリアンって言葉をこのサンプルをメモしていて初めて知りました。

### 例：大小比較
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
Dim p_temperature As Integer
p_temperature = 105
Select Case p_temperature
    Case <em>Is &lt;= 0</em>
        Debug.Print p_temperature &amp; "度で水は固体です。"
    Case <em>Is &gt;= 100</em>
        Debug.Print p_temperature &amp; "度で水は気体です。"
    Case Else
        Debug.Print p_temperature &amp; "度で水は液体です。"
End Select
</pre>
</div>
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
105度で水は気体です。
</pre>
</div>
- `Is`の部分に`<比較する値>`が入っていると思ってCase句を書いてください。

### 参考
- [(Wikipedia) switch文](https://ja.wikipedia.org/wiki/Switch%E6%96%87)
- [(Valmore) 【Excel VBA入門】Select Case文の使い方。複数条件をスッキリ書く！](https://valmore.work/excel-vba-case/)

{% include goto_pagetop.html %}

## <a name="参照・参考">参照・参考</a><a class="heading-anchor-permalink" href="#参照・参考">§</a>
* * *
## <a name="参考サイト">参考サイト</a><a class="heading-anchor-permalink" href="#参考サイト">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-17" updated="2021-12-17" %}</div>
### 参照
- [(Wikipedia) switch文](https://ja.wikipedia.org/wiki/Switch%E6%96%87)

### 参考サイト
- [(Valmore) 【Excel VBA入門】Select Case文の使い方。複数条件をスッキリ書く！](https://valmore.work/excel-vba-case/)

{% include goto_pagetop.html %}

* * *
## <a name="参考書籍">参考書籍</a><a class="heading-anchor-permalink" href="#参考書籍">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-09-08" updated="2020-09-09" %}</div>
- {% include book/book_449.html %} {% comment %} パーフェクト Excel VBA {% endcomment %}

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
