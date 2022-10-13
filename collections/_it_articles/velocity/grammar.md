---
title: Velocityの文法
article_group_id: basis-group
display_order: 20
created: 2022-10-07
updated: 2022-10-13
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#拡張子">拡張子</a></li>
<li><a href="#コメント">コメント</a></li>
<li><a href="#変数">変数</a></li>
<li><a href="#代入">代入</a></li>
<li><a href="#制御フロー">制御フロー</a></li>
<li><a href="#インポート">インポート</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="拡張子">拡張子</a><a class="heading-anchor-permalink" href="#拡張子">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-07" updated="2022-10-07" %}</div>
- `.vm`を使います。

{% include goto_pagetop.html %}

* * *
## <a name="コメント">コメント</a><a class="heading-anchor-permalink" href="#コメント">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-07" updated="2022-10-07" %}</div>
### 1行コメント
- `##` 以降が1行コメントになります。
<div class="code-box no-title">
<pre>
<em class="comment">##この一行はコメントになる。</em>
</pre>
</div>
### 複数行コメント
- `#*`で始まり、`*#`で終わる範囲がコメントになります。
<div class="code-box no-title">
<pre>
<em class="comment">#*　　コメント
改行してもコメント　　*#</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="変数">変数</a><a class="heading-anchor-permalink" href="#変数">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-07" updated="2022-10-07" %}</div>
### 変数の出力
- 以下4種類あります。
<table class="normal">
	<tr>
		<th markdown="span"></th>
		<th markdown="span">記法</th>
		<th markdown="span">説明</th>
		<th markdown="span">値がないときの処理</th>
	</tr>
	<tr>
		<td markdown="span">1</td>
		<td markdown="span">`$変数名`</td>
		<td markdown="span">これが一番単純な記法です。</td>
		<td markdown="span">`$変数名`という文字列を表示します。</td>
	</tr>
	<tr>
		<td markdown="span">2</td>
		<td markdown="span">`${変数名}`</td>
		<td markdown="span">この記法が1の正式記法ですが、だいたいは1の方が使われます。</td>
		<td markdown="span">`$変数名`という文字列を表示します。</td>
	</tr>
	<tr>
		<td markdown="span">3</td>
		<td markdown="span">`$!変数名`</td>
		<td markdown="span">Silent表記法と呼ばれています。</td>
		<td markdown="span">何も出力されません。</td>
	</tr>
	<tr>
		<td markdown="span">4</td>
		<td markdown="span">$!{変数名}</td>
		<td markdown="span">これは2と3を組み合わせた記法です。</td>
		<td markdown="span">何も出力されません。</td>
	</tr>
</table>

{% include goto_pagetop.html %}

* * *
## <a name="代入">代入</a><a class="heading-anchor-permalink" href="#代入">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-07" updated="2022-10-07" %}</div>
### #set
`#set`は右辺の値を左辺に代入する指示子です。

<div class="code-box no-title">
<pre>
#set( $value = "$value * 3")
#set( $name = "Yojigen")
#set( $name = 'Yojigen')
</pre>
</div>
- ダブルクォーテーションを使っている場合は評価され、シングルクォーテーションを使っている場合は評価されません。

<div class="code-box no-title">
<pre>
#set($name = "ふも")
#set($a = "$name")
#set($b = '$name')
$a
$b
</pre>
</div>

<div class="code-box-output">
<div class="title">処理結果</div>
<pre>
ふも
$name
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="制御フロー">制御フロー</a><a class="heading-anchor-permalink" href="#制御フロー">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-07" updated="2022-10-07" %}</div>
### #if、#elseif、#else
`#if`、`#elseif`、`#else`、`#end`は条件分岐するための指示子です。  

<div class="code-box-syntax no-title">
<pre>
#if( <em>&lt;条件&gt;</em> )
[ <em class="blue">&lt;出力&gt;</em> ]

[ #elseif( <em>&lt;条件2&gt;</em> ) [ <em class="blue">&lt;出力2</em>&gt; ] ]
・・
[ #else [ <em class="blue">&lt;出力3</em>&gt; ] ]
#end
</pre>
</div>
- 条件部分には、`==`、`=`、`>`、`<`、`<=`、`>=`、`!`などの論理演算子の利用が可能です。
- 戻り値が`boolean型`でない場合は`null`以外は`true`と解釈されます。
- 出力部分には`VTL`またはテキストを記述します。

### 例
`#if`、`#else`、`#elseif`を使った例として、人(Human)クラスのオブジェクトのBMI指数(肥満度指数)を測定する例を考えてみます。   Humanクラスはプロパティとして身長(height:単位はメートル)と体重(weight:単位はキログラム)のみを持っているとします。  
まず、vmファイルを以下に示します。

<div class="code-box">
<div class="title">bmi.vm</div>
<pre>
<em>#set($bmi = $human.weight / $human.height / $human.height)</em>
  あなたのBMI指数は $bmi です。
<em>#if($bmi &lt; 20.0)</em>
  やせ気味です。
<em>#elseif($bmi &gt;= 20.0 &amp;&amp; $bmi &lt; 25.0)</em>
  標準です。
<em>#elseif($bmi &gt;= 25.0 &amp;&amp; $bmi &lt; 40.0)</em>
  肥満です。
<em>#else</em>
  手に負えません。
<em>#end</em>
</pre>
</div>

次にBMI.javaでhumanオブジェクトを生成します。

<div class="code-box">
<div class="title">BMI.java</div>
<pre>
(略)
Human human = new Human("1.67", "50");
(略)

try {
    velocityContext vc = new VelocityContext();
    StringWriter writer = new StringWriter();
    vc.put("human", human);
    Template template = Velocity.getTemplate(<em>"bmi.vm"</em>);
    template.merge(vc, writer);
(略)
</pre>
</div>

<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
  あなたのBMI指数は 17.93 です。
  やせ気味です。
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="インポート">インポート</a><a class="heading-anchor-permalink" href="#インポート">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-13" updated="2022-10-13" %}</div>
### #parse, #include
- `#parse`、`#include`はテンプレート尾中にローカルファイルをインポートするための指示子です。
- 両者の違いは、
  - `#parse`は読み込んだファイルの`VTL`を解析します。
  - `#include`は読み込んだファイルの`VTL`を解析しません。テキストファイルとして利用するのみです。

<div class="code-box-syntax no-title">
<pre>
<em>#parse(</em> <em class="blue">&lt;ファイル名または変数名&gt;</em> <em>)</em>
または
<em>#{parse}(</em> <em class="blue">&lt;ファイル名または変数名&gt;</em> <em>)</em>
  
<em>#include(</em> <em class="blue">&lt;ファイル名または変数名&gt;</em> <em>)</em>
または
<em>#{include}(</em> <em class="blue">&lt;ファイル名または変数名&gt;</em> <em>)</em> 
</pre>
</div>

<div class="code-box">
<div class="title">sample1.vm</div>
<pre>
#set($num = 10)
<em>#parse(</em><em class="blue">"sample2.vm"</em><em>)</em>
sample1.vmの処理が終了
</pre>
</div>

### 再帰的なパース
- `#parse`でインポートしたファイルの中でさらに`#parse`によるインポートが可能です。
- どれだけ深い階層までインポートできるかは、設定ファイルである`velocity.properties`の中の`parse_directive.maxdepth`によって指定します。デフォルトは`10`です。

### 参考サイト
- [(TECHSCORE) 5.VTL・#parse,#includeなど](https://www.techscore.com/tech/Java/ApacheJakarta/Velocity/5/)

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-07" updated="2022-10-07" %}</div>
### 参考サイト
- [(TECHSCORE) Velocity](https://www.techscore.com/tech/Java/ApacheJakarta/Velocity/)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
