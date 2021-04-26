---
chapter_no: 30
chapter_id: data-type
chapter_title: 2. データ型
created: 2010-06-05
updated: 2021-04-08
---
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
