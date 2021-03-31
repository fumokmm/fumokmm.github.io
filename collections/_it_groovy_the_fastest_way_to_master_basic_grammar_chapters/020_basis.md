---
chapter_no: 020
chapter_id: basis
chapter_title: 1. 基礎
created: 2010-06-05
updated: 2021-03-31
---
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

<div class="code-box-syntax">
<div class="title">等値性と同一性</div>
<pre>
assert null <em>==</em> null
assert !(null <em>==</em> 1)
</pre>
</div>
