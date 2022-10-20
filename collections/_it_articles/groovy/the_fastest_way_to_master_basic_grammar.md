---
title: Groovy基礎文法最速マスター
display_order: 10
created: 2010-06-05
updated: 2021-04-08
---
当メモは2010-06-05に[投稿されたもの](https://npnl.hatenablog.jp/entry/20100605/1275736594)を加筆修正し、再掲したものです。  
当初の掲載からだいぶ時間が経過していますので、古い内容のものもあると思いますのでご注意下さい。  
順次アップデートしていく予定です。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#getting-started">はじめに</a></li>
<li><a href="#basis">1. 基礎</a></li>
<li><a href="#data-type">2. データ型</a></li>
<li><a href="#grammar">3. 文法</a></li>
<li><a href="#class">4. クラス</a></li>
<li><a href="#reference">参照</a></li>
</ul>

* * *
## <a name="getting-started">はじめに</a><a class="heading-anchor-permalink" href="#getting-started">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2010-06-05" updated="2021-04-08" %}</div>
GroovyはJavaのシンタクスシュガーな上位互換として設計されており、  
妥当なJavaプログラムであれば、*ほぼそのままでGroovyプログラムとして動かすことができます*([参照](https://npnl.hatenablog.jp/entry/20110212/1297522544))。  
誤解を恐れずに言うならば、現存するプログラミング言語中でもっともJavaと親和性の高い*Better Java*な言語、  
それがGroovyであるということです(唯一の違いは拡張子が`.java`ではなく`.groovy`であることくらいです)。  
Groovyを利用すれば*世界中に存在する有益なJava資産をすべて利用することができます*。  
また、スクリプトとしてではなく`.class`ファイルにコンパイルすることも可能です。  
コンパイルすることで通常のJavaプログラムと同等の動作スピードを得ることができます。

なお、上記のような特徴から、`Java`を全く知らない人よりも、`Java`をある程度知っている人が`Groovy`を学習することで、  
爆発的なパワーを手に入れることができるようになると思います。

{% include goto_pagetop.html %}

* * *
## <a name="basis">1. 基礎</a><a class="heading-anchor-permalink" href="#basis">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2010-06-05" updated="2021-04-08" %}</div>
### Groovyの実行
<table class="normal">
	<tr>
		<th markdown="span">コマンド</th>
		<th markdown="span">説明</th>
	</tr>
	<tr>
		<td markdown="span">groovy</td>
		<td markdown="span">Groovyスクリプトを実行するインタプリタを起動します。  
							コマンドライン引数として1行だけのGroovyスクリプトを指定することもできます。</td>
	</tr>
	<tr>
		<td markdown="span">groovysh</td>
		<td markdown="span">Groovyコードを対話的に実行するためのコマンドラインシェルを起動します。  
							文やスクリプトを1行ごとに入力しコードをその場で実行することができます。</td>
	</tr>
	<tr>
		<td markdown="span">groovyConsole</td>
		<td markdown="span">Groovyコードを対話的に実行するためのグラフィカルインタフェースを起動します。  
							GroovyConsoleはGroovyスクリプトファイルをロードして実行することもできます。</td>
	</tr>
</table>

### 表示 (print, println, printf)
<div class="code-box">
<div class="title">表示</div>
<pre>
print 'Hello, Groovy!!'        <em class="comment">// 改行なし</em>
println 'Hello, Groovy!!'      <em class="comment">// 改行あり</em>
printf 'Hello, %s', 'Groovy!!' <em class="comment">// 整形して表示</em>
</pre>
</div>

### コメント
<div class="code-box">
<div class="title">コメント</div>
<pre>
<em class="comment">// 一行コメント</em>
<em class="comment">/* 複数行コメント */</em>
<em class="comment">/** Groovydoc(Javadoc)コメント */</em>
</pre>
</div>
- `Groovydoc`については[こちら](http://groovy-lang.org/groovydoc.html)。

### 括弧やセミコロンの省略
Groovyではコードの解釈に支障がない場合に限り、括弧やセミコロンの省略が可能です。
<div class="code-box">
<div class="title">括弧やセミコロンの省略</div>
<pre>
println<em>(</em>"hi"<em>);</em>
println<em>(</em>"hi"<em>)</em>
println "hi"
</pre>
</div>
- 上記はすべて同じ意味となります。

### アサーション
Groovyではどこでも`assert文`を利用できます。  
コード内に*assertテストを埋め込んでコードの正当性を保つのがGroovyのスタイル*です。

<div class="code-box-syntax">
<div class="title">書式</div>
<pre>
assert <em>式, コメント</em>
</pre>
</div>
- 上記のような形式で利用できます。
- コメントは省略可能です。

<div class="code-box no-title">
<pre>
def a = 10
def b = 20
assert 30 == a + b, '足したら30のはず'
</pre>
</div>
- 式が真の間は実行しても何も起こりませんが、偽の場合はエラーとなります。
- assert文が文に埋め込まれているおかげで、その時点での変数などの状態の正当性が主張できるわけです。

以降、サンプルコードでも`assert文`を利用します。

### 等値性と同一性
`#equals()`は`==`、`==`は`#is()`。  
分かりにくいので、Javaと比較すると以下のようになります。

<table class="normal">
	<tr>
		<th markdown="span"></th>
		<th markdown="span">Groovy</th>
		<th markdown="span">Java</th>
	</tr>
	<tr>
		<td markdown="span">等値性</td>
		<td markdown="span">a == b</td>
		<td markdown="span">a.equals(b)</td>
	</tr>
	<tr>
		<td markdown="span">同一性</td>
		<td markdown="span">a.is(b)</td>
		<td markdown="span">a == b</td>
	</tr>
</table>
また、nullに対してもチェック可能です。

<div class="code-box">
<div class="title">等値性と同一性</div>
<pre>
assert null <em>==</em> null
assert !(null <em>==</em> 1)
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="data-type">2. データ型</a><a class="heading-anchor-permalink" href="#data-type">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2010-06-05" updated="2021-04-08" %}</div>
### すべてがObject(プリミティブはない)
`1`、 `1.0f`などのJavaでのプリミティブは  `java.lang.Integer`や、`java.lang.Float`などのラッパーでラッピングされているため、  
通常のリテラルのように利用することが可能となります。

### 数値型リテラル
数値型リテラルとして利用できるものは、以下表のようになります。
<table class="normal">
	<tr>
		<th markdown="span">型</th>
		<th markdown="span">エイリアス</th>
		<th markdown="span">リテラル例</th>
	</tr>
	<tr>
		<td markdown="span">java.lang.Integer</td>
		<td markdown="span">int</td>
		<td markdown="span">15, 0x1234ffff</td>
	</tr>
	<tr>
		<td markdown="span">java.lang.Long</td>
		<td markdown="span">long</td>
		<td markdown="span">100L, 200l*9</td>
	</tr>
	<tr>
		<td markdown="span">java.lang.Float</td>
		<td markdown="span">float</td>
		<td markdown="span">1.23f, 4.56F</td>
	</tr>
	<tr>
		<td markdown="span">java.lang.Double</td>
		<td markdown="span">double</td>
		<td markdown="span">15, 0x1234ffff</td>
	</tr>
	<tr>
		<td markdown="span">java.lang.BigInteger</td>
		<td markdown="span">-</td>
		<td markdown="span">123g, 456G</td>
	</tr>
	<tr>
		<td markdown="span">java.lang.BigDecimal</td>
		<td markdown="span">-</td>
		<td markdown="span">1.23, 4.56, 1.4E4, 2.8e4, 1.23g, 1.23G</td>
	</tr>
</table>

### def (型の指定)
defキーワードはどんな型でもよいということを示すために使われます。  
明示的に型を指定してもよいです。
<div class="code-box">
<div class="title">型の指定</div>
<pre>
<em>def</em> a = 1      <em class="comment">// => 実際の型はjava.lang.Integer (暗黙の型付け)</em>
<em>def</em> b = 1.0f   <em class="comment">// => 実際の型はjava.lang.Float   (暗黙の型付け)</em>
<em>int</em> c = 1      <em class="comment">// => 実際の型はjava.lang.Integer (Javaの基本型を使った明示的な型付け)</em>
<em>float</em> d = 1    <em class="comment">// => 実際の型はjava.lang.Float   (Javaの基本型を使った明示的な型付け)</em>
<em>Integer</em> e = 1  <em class="comment">// => 実際の型はjava.lang.Integer (参照型の型名を使った明示的な型付け)</em>
<em>String</em> f = '1' <em class="comment">// => 実際の型はjava.lang.String  (参照型の型名を使った明示的な型付け)</em>
</pre>
</div>
`int`や`float`などは`java.lang.Integer`や`java.lang.Float`のエイリアスです。

### 演算子のオーバーライド
たとえば、`1 + 1` は `1.plus(1)` の便利な書き方に過ぎません。  
これは`Integer`クラスが`plus`メソッドの実装を持つことによって実現されています。  
これは*他の演算子についても可能で自作クラスにも適用できます*。*Javaと違って特定のインタフェース実装は必要ありません*。  
主な例を示します。

<table class="normal">
	<tr>
		<th markdown="span">演算子</th>
		<th markdown="span">名前</th>
		<th markdown="span">メソッド</th>
	</tr>
	<tr>
		<td markdown="span">a + b</td>
		<td markdown="span">加算</td>
		<td markdown="span">a.plus(b)</td>
	</tr>
	<tr>
		<td markdown="span">a - b</td>
		<td markdown="span">減算</td>
		<td markdown="span">a.minus(b)</td>
	</tr>
	<tr>
		<td markdown="span">a * b</td>
		<td markdown="span">乗算</td>
		<td markdown="span">a.multiply(b)</td>
	</tr>
	<tr>
		<td markdown="span">a / b</td>
		<td markdown="span">除算</td>
		<td markdown="span">a.div(b)</td>
	</tr>
	<tr>
		<td markdown="span">a % b</td>
		<td markdown="span">剰余</td>
		<td markdown="span">a.mod(b)</td>
	</tr>
	<tr>
		<td markdown="span">a ** b</td>
		<td markdown="span">べき乗</td>
		<td markdown="span">a.power(b)</td>
	</tr>
	<tr>
		<td markdown="span">a << b</td>
		<td markdown="span">左シフト</td>
		<td markdown="span">a.leftShift(b)</td>
	</tr>
	<tr>
		<td markdown="span">a >> b</td>
		<td markdown="span">右シフト</td>
		<td markdown="span">a.rightShift(b)</td>
	</tr>
	<tr>
		<td markdown="span">a >>> b</td>
		<td markdown="span">論理右シフト</td>
		<td markdown="span">a.rightShiftUnsigned(b)</td>
	</tr>
	<tr>
		<td markdown="span">a & b</td>
		<td markdown="span">ビット積</td>
		<td markdown="span">a.and(b)</td>
	</tr>
	<tr>
		<td markdown="span">a | b</td>
		<td markdown="span">ビット和</td>
		<td markdown="span">a.or(b)</td>
	</tr>
	<tr>
		<td markdown="span">a ^ b</td>
		<td markdown="span">排他的ビット和</td>
		<td markdown="span">a.xor(b)</td>
	</tr>
	<tr>
		<td markdown="span">a == b, a != b</td>
		<td markdown="span">等値判定</td>
		<td markdown="span">a.equals(b)[^override-equals]</td>
	</tr>
	<tr>
		<td markdown="span">a < b, a > b,  
		                    a <= b, a >= b,  
							a <=> b</td>
		<td markdown="span">大小比較</td>
		<td markdown="span">a.compareTo(b)</td>
	</tr>
	<tr>
		<td markdown="span">a as b</td>
		<td markdown="span">強制型変換</td>
		<td markdown="span">a.asType(b)</td>
	</tr>
	<tr>
		<td markdown="span">a in b</td>
		<td markdown="span">包含判定</td>
		<td markdown="span">a.isCase(b)</td>
	</tr>
	<tr>
		<td markdown="span">a++, ++a</td>
		<td markdown="span">インクリメント</td>
		<td markdown="span">a.next()</td>
	</tr>
	<tr>
		<td markdown="span">a--, --a</td>
		<td markdown="span">デクリメント</td>
		<td markdown="span">a.previous()</td>
	</tr>
	<tr>
		<td markdown="span">+a</td>
		<td markdown="span">単項プラス</td>
		<td markdown="span">a.positive()</td>
	</tr>
	<tr>
		<td markdown="span">-a</td>
		<td markdown="span">単項マイナス</td>
		<td markdown="span">a.negative()</td>
	</tr>
	<tr>
		<td markdown="span">~a</td>
		<td markdown="span">ビット否定</td>
		<td markdown="span">a.bigwiseNegate()</td>
	</tr>
	<tr>
		<td markdown="span">a[b]</td>
		<td markdown="span">添字</td>
		<td markdown="span">a.getAt(b)</td>
	</tr>
	<tr>
		<td markdown="span">a[b] = c</td>
		<td markdown="span">添字代入</td>
		<td markdown="span">a.putAt(b, c)</td>
	</tr>
</table>

[^override-equals]: `a`が`Comparable`を実装している場合は、`a.compareTo(b)`

### 文字列
文字列リテラルは３種類あります。

#### シングルクォート文字列
１つ目はシングルクォートを用いるものです。こちらは通常の文字列として扱われます。`java.lang.String`と等価です。

<div class="code-box">
<div class="title">通常の文字列(java.lang.Stringと等価)</div>
<pre>
def str = <em>'シングルクォート'</em>
</pre>
</div>

#### ダブルクォート文字列
２つ目はダブルクォートを用いるものです。こちらは以下のように変数(`$`の後に変数名)や式を埋め込むことができます。`groovy.lang.GString`と等価です。

<div class="code-box">
<div class="title">変数埋め込み可能文字列</div>
<pre>
def a = 'world'
def str1 = <em>"hello $a"</em>
def str2 = <em>"hello ${a}"</em>
assert str1 == str2
assert str1 == 'hello world'
</pre>
</div>

#### スラッシュ文字列
３つ目はスラッシュ`/`を用いるものです。こちらはバックスラッシュ`\`をエスケープせずに利用できるため、正規表現を埋め込む際に利用されます。それ以外はダブルクォートのものと同様です。

<div class="code-box">
<div class="title">バックスラッシュがエスケープされない文字列(正規表現用)</div>
<pre>
def pathStr = <em>/C:\temp\xxxx/</em>  <em class="comment">// バックスラッシュがそのまま使える</em>
def regexpStr = <em>/^\d{4}-\d{3}/</em>  <em class="comment">// 正規表現を宣言する時に便利</em>
def color = 'blue'
def interpolatedSlashy = <em>/a </em><em class="blue">${color}</em><em> car/</em>  <em class="comment">// 変数埋め込みも可能</em>
</pre>
</div>
- 注意が必要なのはスラッシュ文字列中で、`$`をエスケープできない点です。`$`をエスケープしたい場合は、以下のドルスラッシュ文字列を利用します。

### ドルスラッシュ文字列
４つ目はドルスラッシュ`$/`と`/$`を用いるものです。基本的にはスラッシュ文字列と同じなのですが、文字列中のエスケープ文字が`\`ではなく、`$`になったものです。
<div class="code-box">
<div class="title">バックスラッシュがエスケープされない文字列(エスケープ文字は$)</div>
<pre>
def pathStr = <em>$/C:\temp\xxxx/$</em>  <em class="comment">// バックスラッシュがそのまま使える</em>
def regexpStr = <em>$/^\d{4}-\d{3}/$</em>  <em class="comment">// 正規表現を宣言する時に便利</em>
def color = 'blue'
def interpolatedSlashy = <em>$/a </em><em class="blue">${color}</em><em> car/$</em>  <em class="comment">// 変数埋め込みも可能</em>
def interpolatedSlashy2 = <em>$/a </em><em class="blue">$${color}</em><em> car/$</em>  <em class="comment">// $でエスケープも可能</em>
</pre>
</div>
- 最後のinterpolatedSlashy2の例の`$${color}`の部分は`${color}`という文字列になります。(`$`でエスケープできる)

#### 複数行文字列
上記４つの文字列の複数行文字列[^here-document]もリテラルレベルでサポートされています。  
シングルクォートとダブルクォートはそれぞれ3つにすることで複数行文字列として利用可能です。  
スラッシュ文字列とドルスラッシュ文字列は最初から複数行文字列として利用可能です。

[^here-document]: いわゆるヒアドキュメント

<div class="code-box">
<div class="title">複数行文字列(ヒアドキュメント)</div>
<pre>
<em class="comment">// シングルクォート文字列の複数バージョン</em>
def multiStr1 = <em>'''
これは
複数行の
文字列です。
'''</em>

<em class="comment">// シングルクォート文字列の複数バージョン</em>
def multiStr2 = <em>"""
本日は
${new Date()}
なり。
"""</em>

def color = 'blue'

<em class="comment">// スラッシュ文字列</em>
def multiStr3 = <em>/
C:\temp\xxxx
^\d{4}-\d{3}
a ${color} car
/</em>

<em class="comment">// ドルスラッシュ文字列</em>
def multiStr4 = <em>$/
a ${color} car
a $${color} car
/$</em>
</pre>
</div>
- ちなみにこの例の書き方ですと、先頭に改行が入ってしまいます。改行がない状態で宣言したい場合は[こちら](http://d.hatena.ne.jp/fumokmm/20080830/1220063759)を参照ください。

### 文字列のまとめ
まとめると以下表のようになります。
<table class="normal">
	<tr>
		<th markdown="span">文字列の名称</th>
		<th markdown="span">シンタックス</th>
		<th markdown="span">変数埋め込み</th>
		<th markdown="span">複数行</th>
		<th markdown="span">エスケープ文字</th>
	</tr>
	<tr>
		<td markdown="span">シングルクォート文字列</td>
		<td markdown="span">'…​'</td>
		<td markdown="span">不可</td>
		<td markdown="span">不可</td>
		<td markdown="span">\</td>
	</tr>
	<tr>
		<td markdown="span">トリプルシングルクォート文字列</td>
		<td markdown="span">'''…​'''</td>
		<td markdown="span">不可</td>
		<td markdown="span">可</td>
		<td markdown="span">\</td>
	</tr>
	<tr>
		<td markdown="span">ダブルクォート文字列</td>
		<td markdown="span">"…​"</td>
		<td markdown="span">可</td>
		<td markdown="span">不可</td>
		<td markdown="span">\</td>
	</tr>
	<tr>
		<td markdown="span">トリプルダブルクォート文字列</td>
		<td markdown="span">"""…​"""</td>
		<td markdown="span">可</td>
		<td markdown="span">可</td>
		<td markdown="span">\</td>
	</tr>
	<tr>
		<td markdown="span">スラッシュ文字列</td>
		<td markdown="span">/…​/</td>
		<td markdown="span">可</td>
		<td markdown="span">可</td>
		<td markdown="span">\</td>
	</tr>
	<tr>
		<td markdown="span">ドルスラッシュ文字列</td>
		<td markdown="span">$/…​/$</td>
		<td markdown="span">可</td>
		<td markdown="span">可</td>
		<td markdown="span">$</td>
	</tr>
</table>

{% include goto_pagetop.html %}

* * *
## <a name="grammar">3. 文法</a><a class="heading-anchor-permalink" href="#grammar">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2010-06-05" updated="2021-04-08" %}</div>
### 文
文は1行にひとつ書きます。セミコロン`;`を付けることで、1行に複数の文を記述することができます。

<div class="code-box-syntax">
<div class="title">文(行で分割)</div>
<pre>
文1
文2
</pre>
</div>

<div class="code-box-syntax">
<div class="title">文(セミコロンで分割)</div>
<pre>
文1; 文2
</pre>
</div>

### 制御構造

#### if-else
<div class="code-box-syntax">
<div class="title">単一行のif</div>
<pre>
if (false) assert false
</pre>
</div>

<div class="code-box-syntax">
<div class="title">nullは偽</div>
<pre>
if (null) {
  assert false
} else {
  assert true
}
</pre>
</div>

#### while
<div class="code-box-syntax">
<div class="title">while</div>
<pre>
def i = 0
while (i < 10) {
  i++
}
assert i == 10
</pre>
</div>

#### do
Groovyにdoはありません。[^no-do]

[^no-do]: [こちら](https://npnl.hatenablog.jp/entry/20110630/1309446463)で無理やりdo-whileを実装する実験をしました。

#### for

#### while
<div class="code-box-syntax">
<div class="title">昔ながらのfor</div>
<pre>
for (i = 0; i < 10; i++) {
  println i
}
</pre>
</div>

<div class="code-box-syntax">
<div class="title">範囲に対するfor</div>
<pre>
def clinks = 0
for (remainingGuests in 0..9) {
  clinks += remainingGuests 
}
</pre>
</div>

<div class="code-box-syntax">
<div class="title">リストに対するfor</div>
<pre>
def list = [0, 1, 2, 3, 4, 5]
for (j in list) {
  assert j == list[j]
}
</pre>
</div>

#### switch
<div class="code-box-syntax">
<div class="title">switch</div>
<pre>
switch(3) {
  case 1 : assert false; break
  case 3 : assert true;  break
  default: assert false
}
</pre>
</div>

#### try-catch-finally
<div class="code-box-syntax">
<div class="title">try-catch-finally</div>
<pre>
try {
  <em>// 処理</em>
} catch(e) {
  <em>// 例外e発生時処理</em>
} finally {
  <em>// 最終処理</em>
}
</pre>
</div>

#### return/break/continue
`return`, `break`, `continue`の一般的なロジックはJavaと同じです。  
ただし、Groovyでは`return`が省略可能です。省略した場合、最後に評価された値が返却されます。

<div class="code-box-syntax">
<div class="title">returnは省略可能、返却値は最後に評価されたもの</div>
<pre>
def method() {
  def a = 10
  def b = 20
  a + b
}
assert method() == 30
</pre>
</div>

### Booleanテスト(Groovy Truth)
<table class="normal">
	<tr>
		<th markdown="span">実行時の真</th>
		<th markdown="span">判定される値</th>
		<th markdown="span">実行時の真</th>
		<th markdown="span">判定される値</th>
	</tr>
	<tr>
		<td markdown="span">Boolean</td>
		<td markdown="span">値がtrue</td>
		<td markdown="span">String、GString</td>
		<td markdown="span">文字列が空ではない</td>
	</tr>
	<tr>
		<td markdown="span">Matcher</td>
		<td markdown="span">マッチする</td>
		<td markdown="span">Number、Character</td>
		<td markdown="span">値がゼロではない</td>
	</tr>
	<tr>
		<td markdown="span">Collection</td>
		<td markdown="span">コレクションが空ではない</td>
		<td markdown="span">上記以外</td>
		<td markdown="span">参照がnullではない</td>
	</tr>
	<tr>
		<td markdown="span">Map</td>
		<td markdown="span">マップが空ではない</td>
		<td markdown="span"></td>
		<td markdown="span"></td>
	</tr>
</table>

<div class="code-box">
<div class="title">Boolean値は自明</div>
<pre>
assert true
assert !false
</pre>
</div>

<div class="code-box">
<div class="title">Matcherはマッチすること</div>
<pre>
assert ('a' =~ /./)
assert !('a' =~ /b/)
</pre>
</div>

<div class="code-box">
<div class="title">コレクションは空ではないこと</div>
<pre>
assert [1]
assert ![]
</pre>
</div>

<div class="code-box">
<div class="title">マップは空ではないこと</div>
<pre>
assert ['a': 1]
assert ![:]
</pre>
</div>

<div class="code-box">
<div class="title">文字列は空ではないこと</div>
<pre>
assert 'a'
assert !''
</pre>
</div>

<div class="code-box">
<div class="title">数値（どの型も）はゼロではないこと</div>
<pre>
assert 1
assert 1.1
assert 1.2f
assert 1.3g
assert 2L
assert 3G
assert !0
</pre>
</div>

<div class="code-box">
<div class="title">その他は、すべてnullではないこと</div>
<pre>
assert new Object()
assert !null
</pre>
</div>

### 正規表現
Groovyは言語レベルで正規表現をサポートしています。

<div class="code-box">
<div class="title">正規表現</div>
<pre>
assert '12345' =~ /\d+/
assert 'xxxxx' == '12345'.replaceAll(/\d/, 'x')
</pre>
</div>
正規表現については[ここ](http://uehaj.hatenablog.com/entry/20070823/1200970407)がとても参考になります。

### リスト、マップ、範囲
リストは`[]`で囲み、カンマで区切ります。空リストは`[]`です。

<div class="code-box">
<div class="title">リスト</div>
<pre>
def roman = <em>['', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII']</em> <em class="comment">// ローマ数字のリスト</em>
assert roman[4] == 'IV' <em class="comment">// リストへのアクセス</em>
roman[8] = 'VIII' <em class="comment">// リストの拡大</em>
assert roman.size() == 9
</pre>
</div>

マップも`[]`で囲み、`「キー:値」`の形で内容を示し、カンマで区切ります。空マップは`[:]`です。

<div class="code-box">
<div class="title">マップ</div>
<pre>
def http = <em>[
  100 : 'CONTINUE',
  200 : 'OK',
  400 : 'BAD REQUEST' ]</em>
assert http[200] == 'OK'
http[500] = 'INTERNAL SERVER ERROR'
assert http.size() == 4
</pre>
</div>

範囲は「`a..b`」や「`a..<b`」を使います。`..`の方は、後ろを含み、`..<`の方は後ろを含みません。

<div class="code-box">
<div class="title">ここにタイトル</div>
<pre>
def x = <em>1..10</em>
assert x.contains(5)
assert x.contains(15) == false
assert x.size() == 10
assert x.from == 1
assert x.to == 10
assert x.reverse() == 10..1
def y = <em>1..&lt;10</em>
assert y.from == 1
assert y.to == 9
</pre>
</div>

### クロージャ
<div class="code-box">
<div class="title">ここにタイトル</div>
<pre>
[1, 2, 3].each <em>{ entry -> println entry }</em>
[4, 5, 6].each <em>{ println it }</em> <em class="comment">// パラメータ省略時はitで参照できる</em>
[a: 100, b: 200, c: 300].each <em>{ key, value ->
  println "${key}=${value}"
}</em>
</pre>
</div>
このあたりのもうちょっと詳しいサンプルは[このあたり](https://npnl.hatenablog.jp/entry/20081224/1230124652)でどうぞ。

{% include goto_pagetop.html %}

* * *
## <a name="class">4. クラス</a><a class="heading-anchor-permalink" href="#class">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2010-06-05" updated="2021-04-08" %}</div>
### 暗黙的インポート
Groovyでは以下のパッケージが暗黙的にインポート済みです。
<div class="code-box">
<div class="title">暗黙的インポート</div>
<pre>
java.io.*
java.lang.*
java.math.BigDecimal
java.math.BigInteger
java.net.*
java.util.*
groovy.lang.*
groovy.util.*
</pre>
</div>

### クラス宣言
<div class="code-box">
<div class="title">クラス</div>
<pre>
class Book {    <em class="comment">// クラスを宣言</em>
  String title  <em class="comment">// 型を明示的に指定してフィールドを宣言</em>
  def prop      <em class="comment">// defキーワードでフィールド宣言</em>
  Book() {      <em class="comment">// コンストラクタ</em>
    <em class="comment">// ...</em>
  }
  int methodA(int p) { <em class="comment">// 型を明示的に指定してメソッドを宣言</em>
    <em class="comment">// ...</em>
  }
  void methodB(String p) { <em class="comment">// 戻り値なしメソッド</em>
    <em class="comment">// ...</em>
  }
  def methodC(p) { <em class="comment">// defを使ってメソッドを宣言</em>
    <em class="comment">// ...</em>
  }
  static def methodS() { <em class="comment">// 静的メソッドを宣言</em>
    <em class="comment">// ...</em>
  }
}
</pre>
</div>

### GroovyBean
GroovyではJavaよりも簡単にbeanを扱えます。

<div class="code-box">
<div class="title">GroovyBean</div>
<pre>
class Book {
  String title  <em class="comment">// プロパティの宣言</em>
}
def groovyBook = new Book()

<em class="comment">// 明示的なメソッド呼び出しによるプロパティの利用</em>
groovyBook.setTitle('Groovy world')
assert groovyBook.getTitle() == 'Groovy world'

<em class="comment">// Groovyによるショートカットを使ったプロパティの利用</em>
groovyBook.title = 'No Groovy, No Life'
assert groovyBook.title == 'No Groovy, No Life'
</pre>
</div>

まだまだ紹介しきれないので、ちょこちょこ追加していく予定です。

{% comment %}
<!--
**5. GDK (([GinA] P235))
GroovyではGDKと呼ばれる、Javaクラスに対しての独自拡張を行っています。GDKを利用することでJavaクラスをより便利に利用することができます。

***java.lang.Objectに対して追加されたメソッド
>|groovy|
Boolean any { closure }
||<

**6.ビルダー (([GinA] P194))
**AntBuilder (([GinA] P205, P400))
**CliBuilder (([GinA] P416))
**SwingBuilder (([GinA] P209))
**MarkupBuilder (([GinA] P202))
-->

**おすすめリンク
[http://groovy.codehaus.org/groovy-jdk/:title:bookmark] Groovy JDK

**参考書籍 [GinA]
ISBN:4839927278:detail

**参考サイト
[http://www.okisoft.co.jp/esc/groovy/index.html:title:bookmark]
[http://d.hatena.ne.jp/uehaj/:title:bookmark]

**関連記事
[http://d.hatena.ne.jp/fumokmm/20081224/1230124652:title:bookmark]
[http://d.hatena.ne.jp/fumokmm/20100518/1274196024:title:bookmark]
[http://d.hatena.ne.jp/fumokmm/20080830/1220063759:title:bookmark]

**関連リンク
[http://groovy.codehaus.org/:title:bookmark] (本家)
[http://groovy.codehaus.org/Japanese+Home:title:bookmark] (本家の日本語版)
[http://en.wikipedia.org/wiki/Groovy_%28programming_language%29:title:bookmark]
[http://ja.wikipedia.org/wiki/Groovy:title:bookmark]
[http://groovy.codehaus.org/The+groovydoc+Ant+task:title:bookmark]

**更新履歴
- 2011-07-22 「doはない」の注釈に[http://d.hatena.ne.jp/fumokmm/20110630/1309446463:title:bookmark]を追加。
-->
{% endcomment %}

{% include goto_pagetop.html %}

* * *
## <a name="reference">参照</a><a class="heading-anchor-permalink" href="#reference">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2010-06-05" updated="2021-04-08" %}</div>
### 元記事
- [元記事](https://npnl.hatenablog.jp/entry/20100605/1275736594)

### 参考書籍
- {% include book/book_609.html %} {% comment %} Groovyイン・アクション {% endcomment %}

### Groovy公式サイト
- [Apache Groovy](https://groovy-lang.org/)
- [(Apache Groovy) groovydoc, the Groovy & Java documentation generator](http://groovy-lang.org/groovydoc.html)
- [(Apache Groovy) Syntax](https://groovy-lang.org/syntax.html)
- [Groovy JDK API Documentation](https://docs.groovy-lang.org/docs/latest/html/groovy-jdk/)

### 関連記事
- [(No Programming, No Life) JavaからGroovyへ移行する簡単なステップ](https://npnl.hatenablog.jp/entry/20110212/1297522544)
- [(No Programming, No Life) Groovyのヒアドキュメントで改行取り消し](https://npnl.hatenablog.jp/entry/20080830/1220063759)
- [(No Programming, No Life) Groovyでdo-whileループを！](https://npnl.hatenablog.jp/entry/20110630/1309446463)
- [(No Programming, No Life) Groovyで頻出なコードの書き方のチートシート](https://npnl.hatenablog.jp/entry/20081224/1230124652)
- [(No Programming, No Life) Scalaも素晴らしいけど、Groovyも素晴らしいですよ](https://npnl.hatenablog.jp/entry/20100518/1274196024)

### 参考サイト
- [uehaj's blog](http://uehaj.hatenablog.com/)
- [(uehaj's blog) Groovyの奇妙な正規表現（Groovyの奇妙な演算子(3)改め)](http://uehaj.hatenablog.com/entry/20070823/1200970407)
- [(Wikipedia/en) Apache Groovy](https://en.wikipedia.org/wiki/Apache_Groovy)
- [(Wikipedia/ja) Groovy](https://ja.wikipedia.org/wiki/Groovy)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
