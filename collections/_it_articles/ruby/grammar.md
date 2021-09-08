---
title: Rubyの文法
display_order: 10
created: 2020-12-03
updated: 2021-09-08
---
ここではRubyの文法を簡単にまとめておきます。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<div style="column-count: 2;">
    <ul id="index_ul">
        <li><a href="#はじめに">はじめに</a>
            <ul>
                <li><a href="#Hello World">Hello World</a></li>
                <li><a href="#コメント">コメント</a></li>
            </ul>
        </li>
        <li><a href="#型">型</a>
            <ul>
                <li><a href="#数値型">数値型</a></li>
                <li><a href="#論理型">論理型</a></li>
                <li><a href="#文字列型">文字列型</a></li>
            </ul>
        </li>
        <li><a href="#基礎文法">基礎文法</a>
            <ul>
                <li><a href="#条件分岐 - if文">条件分岐 - if文</a></li>
                <li><a href="#条件分岐 - unless文">条件分岐 - unless文</a></li>
                <li><a href="#Truthy">Truthy</a></li>
            </ul>
        </li>
        <li><a href="#外部ライブラリの読み込み">外部ライブラリの読み込み</a>
            <ul>
                <li><a href="#require">require</a></li>
                <li><a href="#load">load</a></li>
                <li><a href="#include">include</a></li>
                <li><a href="#prepend">prepend</a></li>
                <li><a href="#extend">extend</a></li>
            </ul>
        </li>
        <li><a href="#参照・参考">参照・参考</a>
            <ul>
                <li><a href="#参考書籍">参考書籍</a></li>
                <li><a href="#参考サイト">参考サイト</a></li>
                <li><a href="#ソース">ソース</a></li>
            </ul>
        </li>
    </ul>
</div>

## <a name="はじめに">はじめに</a><a class="heading-anchor-permalink" href="#はじめに">§</a>
* * *
## <a name="Hello World">Hello World</a><a class="heading-anchor-permalink" href="#Hello World">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-06" updated="2021-07-06" %}</div>
<div class="code-box no-title">
<pre>
puts "Hello World"
puts 'こんにちは'
</pre>
</div>

<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
Hello World
こんにちは
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="コメント">コメント</a><a class="heading-anchor-permalink" href="#コメント">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-06" updated="2021-07-06" %}</div>
<div class="code-box no-title">
<pre>
<em class="comment"># ここがコメント</em>
<em class="comment"># puts "コメント部分は処理されない"</em>
</pre>
</div>

{% include goto_pagetop.html %}

## <a name="型">型</a><a class="heading-anchor-permalink" href="#型">§</a>
* * *
## <a name="数値型">数値型</a><a class="heading-anchor-permalink" href="#数値型">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-06" updated="2021-07-07" %}</div>
### 整数(Integer)
<div class="code-box no-title">
<pre>
num1 = <em>1234</em> <em class="comment"># 正の整数</em>
num2 = <em>-1234</em> <em class="comment"># 負の整数</em>
<em class="comment"># 数値の途中のアンダーバー(_)は無視される</em>
num3 = <em>1_234_000</em>

puts num1
puts num2
puts num3
</pre>
</div>

<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
1234
-1234
1234000
</pre>
</div>

### 10進数、16進数、8進数、2進数
<div class="code-box no-title">
<pre>
num1 = <em>0d9999</em>      <em class="comment"># 10進数 (0dで始まる数値は10進数とみなされる)</em>
num2 = <em>0xffff</em>      <em class="comment"># 16進数 (0xで始まる数値は16進数とみなされる)</em>
num3 = <em>0o777</em>       <em class="comment"># 8進数 (0oで始まる数値は 8進数とみなされる)</em>
num4 = <em>0b11000100</em>  <em class="comment"># 2進数 (0bで始まる数値は 2進数とみなされる)</em>

puts num1
puts num2
puts num3
puts num4
</pre>
</div>

<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
9999
65535
511
196
</pre>
</div>

### 浮動小数点(Float)

<div class="code-box no-title">
<pre>
num1 = <em>1.234</em>
num2 = <em>1.2e3</em>  <em class="comment"># 指数表記 (1.2 × 10^3)</em>

puts num1
puts num2
</pre>
</div>

<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
1.234
1200.0
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="論理型">論理型</a><a class="heading-anchor-permalink" href="#論理型">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-06" updated="2021-07-07" %}</div>
### 論理型(Boolean)
<div class="code-box no-title">
<pre>
bool1 = <em>true</em>   <em class="comment"># TrueClassの唯一のインスタンス</em>
bool2 = <em>false</em>  <em class="comment"># FalseClassの唯一のインスタンス</em>

puts bool1
puts bool2
puts bool1.class == TrueClass
puts bool2.class == FalseClass
</pre>
</div>

<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
true
false
true
true
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="文字列型">文字列型</a><a class="heading-anchor-permalink" href="#文字列型">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-06" updated="2021-07-06" %}</div>
そのうち書きます。

{% include goto_pagetop.html %}

## <a name="基礎文法">基礎文法</a><a class="heading-anchor-permalink" href="#基礎文法">§</a>
* * *
## <a name="条件分岐 - if文">条件分岐 - if文</a><a class="heading-anchor-permalink" href="#条件分岐 - if文">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-09" updated="2021-09-08" %}</div>
<div class="code-box-syntax">
<div class="title">if文</div>
<pre>
<em>if</em> <em class="blue">条件式</em> <em>then</em>
  <em class="comment"># 条件式が真の時に実行する処理1</em>
  <em class="comment"># 条件式が真の時に実行する処理2</em>
<em>end</em>
</pre>
</div>

条件式に後ろが改行の場合は`then`を省略できます。
<div class="code-box-syntax">
<div class="title">if文 (then省略)</div>
<pre>
<em>if</em> <em class="blue">条件式</em>
  <em class="comment"># 条件式が真の時に実行する処理1</em>
  <em class="comment"># 条件式が真の時に実行する処理2</em>
<em>end</em>
</pre>
</div>

条件式が偽の場合に別の条件を指定するには`elsif`を使います。  
`else if`ではないのでご注意下さい。
<div class="code-box-syntax">
<div class="title">if-elsif文</div>
<pre>
if <em class="blue">条件式1</em>
  <em class="comment"># 条件式1が真の時に実行する処理1</em>
  <em class="comment"># 条件式1が真の時に実行する処理2</em>
<em>elsif</em> <em class="blue">条件式2</em>
  <em class="comment"># 条件式2が真の時に実行する処理1</em>
  <em class="comment"># 条件式2が真の時に実行する処理2</em>
<em>end</em>
</pre>
</div>

条件式が偽の場合に実行する節ブロックを指定するには`else`を使います。
<div class="code-box-syntax">
<div class="title">if-else文</div>
<pre>
if 条件式
  <em class="comment"># 条件式が真の時に実行する処理1</em>
  <em class="comment"># 条件式が真の時に実行する処理2</em>
<em>else</em>
  <em class="comment"># 条件式が偽の時に実行する処理1</em>
  <em class="comment"># 条件式が偽の時に実行する処理2</em>
<em>end</em>
</pre>
</div>

`elsif`と`else`は組み合わせられます。
<div class="code-box-syntax">
<div class="title">if-elsif-else文</div>
<pre>
<em>if</em> <em class="blue">条件式1</em>
  <em class="comment"># 条件式1が真の時に実行する処理1</em>
  <em class="comment"># 条件式1が真の時に実行する処理2</em>
<em>elsif</em> <em class="blue">条件式2</em>
  <em class="comment"># 条件式2が真の時に実行する処理1</em>
  <em class="comment"># 条件式2が真の時に実行する処理2</em>
<em>else</em>
  <em class="comment"># 条件式1,条件式2がともに偽の時に実行する処理1</em>
  <em class="comment"># 条件式1,条件式2がともに偽の時に実行する処理2</em>
<em>end</em>
</pre>
</div>

### ソース
- [(language-examples) 0008_if_unless_elsif_else.rb](https://github.com/fumokmm/language-examples/blob/main/Ruby/0008_if_unless_elsif_else.rb)

{% include goto_pagetop.html %}

* * *
## <a name="条件分岐 - unless文">条件分岐 - unless文</a><a class="heading-anchor-permalink" href="#条件分岐 - unless文">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-08" updated="2021-09-08" %}</div>
あとで書きます。お待ちください。

{% include goto_pagetop.html %}

* * *
## <a name="Truthy">Truthy</a><a class="heading-anchor-permalink" href="#Truthy">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-03" updated="2020-12-03" %}</div>
Rubyでは、条件式などで偽とみなされる値(falsey value)を`nil`と`false`のみと定めていて、  
それ以外のオブジェクトはすべて真とみなされる値(truthy value)となります。

{% include goto_pagetop.html %}

## <a name="外部ライブラリの読み込み">外部ライブラリの読み込み</a><a class="heading-anchor-permalink" href="#外部ライブラリの読み込み">§</a>
* * *
## <a name="require">require</a><a class="heading-anchor-permalink" href="#require">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-10" updated="2021-03-19" %}</div>
`require`は外部ファイルを読み込む関数です。標準ライブラリや自分で書いたスクリプトなどを読み込みます。  
[load](#load)とほぼ同じ機能を提供しますが、`require`は*一度読み込まれたスクリプトは再読み込みしない*点が異なっています。

<div class="code-box-syntax">
<div class="title">require (標準ライブラリを読み込む)</div>
<pre>
require <em>'ライブラリ名'</em>
</pre>
</div>

自分で書いたスクリプトを読み込む場合は、`./`から始め相対参照とし、*拡張子の`.rb`は省略します*(書いてもOKです)。
<div class="code-box-syntax">
<div class="title">require (自分で書いたスクリプトを読み込む)</div>
<pre>
require <em>'./path/to/file'</em>
</pre>
</div>

### 関連項目
- [load](#load)
- [include](#include)
- [prepend](#prepend)
- [extend](#extend)

{% include goto_pagetop.html %}

* * *
## <a name="load">load</a><a class="heading-anchor-permalink" href="#load">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-18" updated="2021-03-19" %}</div>
`load`は外部ファイルを読み込む関数です。標準ライブラリや自分で書いたスクリプトなどを読み込みます。  
[require](#require)とほぼ同じ機能を提供しますが、`load`は*スクリプトを再読み込みする*点と、*拡張子の`.rb`が省略できない*ところが異なっています。  
ずっと動かしているプログラムなどで、参照しているスクリプトだけ差し替えて動作させる場合などは、`load`を使うのだと思います。

<div class="code-box-syntax">
<div class="title">load (標準ライブラリを再読み込み)</div>
<pre>
load <em>'ライブラリ名</em><em class="blue">.rb</em><em>'</em>
</pre>
</div>

自分で書いたスクリプトを読み込む場合は、`./`から始め相対参照とします。  
<div class="code-box-syntax">
<div class="title">load (自分で書いたスクリプトを再読み込み)</div>
<pre>
load <em>'./path/to/file</em><em class="blue">.rb</em><em>'</em>
</pre>
</div>

### 関連項目
- [require](#require)
- [include](#include)
- [prepend](#prepend)
- [extend](#extend)

{% include goto_pagetop.html %}

* * *
## <a name="include">include</a><a class="heading-anchor-permalink" href="#include">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-18" updated="2021-03-19" %}</div>
あとで書きます。

### 関連項目
- [require](#require)
- [load](#load)
- [prepend](#prepend)
- [extend](#extend)

{% include goto_pagetop.html %}

* * *
## <a name="prepend">prepend</a><a class="heading-anchor-permalink" href="#prepend">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-18" updated="2021-03-19" %}</div>
あとで書きます。

### 関連項目
- [require](#require)
- [load](#load)
- [include](#include)
- [extend](#extend)

{% include goto_pagetop.html %}

* * *
## <a name="extend">extend</a><a class="heading-anchor-permalink" href="#extend">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-18" updated="2021-03-19" %}</div>
あとで書きます。

### 関連項目
- [require](#require)
- [load](#load)
- [include](#include)
- [prepend](#prepend)

{% include goto_pagetop.html %}

## <a name="参照・参考">参照・参考</a><a class="heading-anchor-permalink" href="#参照・参考">§</a>
* * *
## <a name="参考書籍">参考書籍</a><a class="heading-anchor-permalink" href="#参考書籍">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-03" updated="2020-12-03" %}</div>
- {% include book/book_373.html %} {% comment %} Ruby on Rails 5.0 初級①: 経路、アクション、テンプレート {% endcomment %}

{% include goto_pagetop.html %}

* * *
## <a name="参考サイト">参考サイト</a><a class="heading-anchor-permalink" href="#参考サイト">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-18" updated="2021-07-06" %}</div>
- [(Let'sプログラミング) if文](https://www.javadrive.jp/ruby/if/index1.html)
- [(Qiita) Ruby基礎 \| requireとincludeとextendの違いを確認（includeとextendはメソッド探索で確認）](https://qiita.com/suzukiry/items/db936ff7312ba7d97315)
- [(圧倒亭グランパのブログ) 【ruby】 メソッド探索から見る、モジュール・特異メソッド・特異クラス](https://at-grandpa.hatenablog.jp/entry/2016/02/14/090544)
- [(Tech Academy) Rubyのloadの使い方を現役エンジニアが解説【初心者向け】](https://techacademy.jp/magazine/20141)
- [(Progate) Ruby I](https://prog-8.com/lessons/ruby/study/1)
- [とほほのRuby入門](https://www.tohoho-web.com/ruby/index.html)
  - [(とほほのRuby入門) Ruby入門 - 数値・文字列・型](https://www.tohoho-web.com/ruby/types.html)

{% include goto_pagetop.html %}

* * *
## <a name="ソース">ソース</a><a class="heading-anchor-permalink" href="#ソース">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-06" updated="2021-09-08" %}</div>
- [(language-examples) Ruby](https://github.com/fumokmm/language-examples/tree/main/Ruby)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
