---
title: Rubyの文法
display_order: 10
created: 2020-12-03
updated: 2021-03-19
---
ここではRubyの文法を簡単にまとめておきます。

## <a name="index">目次</a><a href="#目次">§</a>

<div style="column-count: 2;">
    <ul id="index_ul">
        <li><a href="#basic">基礎文法</a>
            <ul>
                <li><a href="#if">条件分岐 - If文</a></li>
                <li><a href="#truthy">Truthy</a></li>
            </ul>
        </li>
        <li><a href="#external-library">外部ライブラリの読み込み</a>
            <ul>
                <li><a href="#require">require</a></li>
                <li><a href="#load">load</a></li>
                <li><a href="#include">include</a></li>
                <li><a href="#prepend">prepend</a></li>
                <li><a href="#extend">extend</a></li>
            </ul>
        </li>
        <li><a href="#reference-group">参照・参考</a>
            <ul>
                <li><a href="#reference">参考</a></li>
            </ul>
        </li>
    </ul>
</div>

## <a name="basic">基礎文法</a><a href="#basic">§</a>
* * *
## <a name="if">条件分岐 - If文</a><a href="#if">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-09" updated="2021-03-09" %}</div>
<div class="code-box-syntax">
<div class="title">If文</div>
<pre>
<em>if</em> <em class="blue">条件式</em> <em>then</em>
  <em class="comment"># 条件式が真の時に実行する処理1</em>
  <em class="comment"># 条件式が真の時に実行する処理2</em>
<em>end</em>
</pre>
</div>

<div class="code-box-syntax">
<div class="title">If文 - 条件式に後ろが改行の場合はthenを省略できる</div>
<pre>
<em>if</em> <em class="blue">条件式</em>
  <em class="comment"># 条件式が真の時に実行する処理1</em>
  <em class="comment"># 条件式が真の時に実行する処理2</em>
<em>end</em>
</pre>
</div>

### 参考
- [(Let'sプログラミング) if文](https://www.javadrive.jp/ruby/if/index1.html)

{% include goto_pagetop.html %}

* * *
## <a name="truthy">Truthy</a><a href="#truthy">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-03" updated="2020-12-03" %}</div>
Rubyでは、条件式などで偽とみなされる値(falsey value)を`nil`と`false`のみと定めていて、それ以外のオブジェクトはすべて真とみなされる値(truthy value)となります。

{% include goto_pagetop.html %}

## <a name="external-library">外部ライブラリの読み込み</a><a href="#external-library">§</a>
* * *
## <a name="require">require</a><a href="#require">§</a>
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

### 参考
- [(Qiita) Ruby基礎 \| requireとincludeとextendの違いを確認（includeとextendはメソッド探索で確認）](https://qiita.com/suzukiry/items/db936ff7312ba7d97315)
- [(Tech Academy) Rubyの外部ファイル読み込みとrequireの使い方を現役エンジニアが解説【初心者向け】](https://techacademy.jp/magazine/21359)

{% include goto_pagetop.html %}

* * *
## <a name="load">load</a><a href="#load">§</a>
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

### 参考
- [(Qiita) Ruby基礎 \| requireとincludeとextendの違いを確認（includeとextendはメソッド探索で確認）](https://qiita.com/suzukiry/items/db936ff7312ba7d97315)
- [(Tech Academy) Rubyのloadの使い方を現役エンジニアが解説【初心者向け】](https://techacademy.jp/magazine/20141)

{% include goto_pagetop.html %}

* * *
## <a name="include">include</a><a href="#include">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-18" updated="2021-03-19" %}</div>
あとで書きます。

### 関連項目
- [require](#require)
- [load](#load)
- [prepend](#prepend)
- [extend](#extend)

### 参考
- [(Qiita) Ruby基礎 \| requireとincludeとextendの違いを確認（includeとextendはメソッド探索で確認）](https://qiita.com/suzukiry/items/db936ff7312ba7d97315)
- [(圧倒亭グランパのブログ) 【ruby】 メソッド探索から見る、モジュール・特異メソッド・特異クラス](https://at-grandpa.hatenablog.jp/entry/2016/02/14/090544)

{% include goto_pagetop.html %}

* * *
## <a name="prepend">prepend</a><a href="#prepend">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-18" updated="2021-03-19" %}</div>
あとで書きます。

### 関連項目
- [require](#require)
- [load](#load)
- [include](#include)
- [extend](#extend)

### 参考
- [(Qiita) Ruby基礎 \| requireとincludeとextendの違いを確認（includeとextendはメソッド探索で確認）](https://qiita.com/suzukiry/items/db936ff7312ba7d97315)
- [(圧倒亭グランパのブログ) 【ruby】 メソッド探索から見る、モジュール・特異メソッド・特異クラス](https://at-grandpa.hatenablog.jp/entry/2016/02/14/090544)

{% include goto_pagetop.html %}

* * *
## <a name="extend">extend</a><a href="#extend">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-18" updated="2021-03-19" %}</div>
あとで書きます。

### 関連項目
- [require](#require)
- [load](#load)
- [include](#include)
- [prepend](#prepend)

### 参考
- [(Qiita) Ruby基礎 \| requireとincludeとextendの違いを確認（includeとextendはメソッド探索で確認）](https://qiita.com/suzukiry/items/db936ff7312ba7d97315)

{% include goto_pagetop.html %}

## <a name="reference-group">参照・参考</a><a href="#reference-group">§</a>
* * *
## <a name="reference">参考</a><a href="#reference">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-03" updated="2021-03-18" %}</div>
- {% include book/book_373.html %} {% comment %} Ruby on Rails 5.0 初級①: 経路、アクション、テンプレート {% endcomment %}
- [(Let'sプログラミング) if文](https://www.javadrive.jp/ruby/if/index1.html)
- [(Qiita) Ruby基礎 \| requireとincludeとextendの違いを確認（includeとextendはメソッド探索で確認）](https://qiita.com/suzukiry/items/db936ff7312ba7d97315)
- [(圧倒亭グランパのブログ) 【ruby】 メソッド探索から見る、モジュール・特異メソッド・特異クラス](https://at-grandpa.hatenablog.jp/entry/2016/02/14/090544)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
