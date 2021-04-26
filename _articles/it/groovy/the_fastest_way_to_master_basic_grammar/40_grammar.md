---
chapter_no: 40
chapter_id: grammar
chapter_title: 3. 文法
created: 2010-06-05
updated: 2021-04-08
---
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