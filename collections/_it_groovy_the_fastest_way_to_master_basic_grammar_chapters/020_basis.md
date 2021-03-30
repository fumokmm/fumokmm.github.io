---
chapter_no: 020
chapter_id: basis
chapter_title: 基礎
created: 2010-06-05
updated: 2021-03-30
---
### Groovyの実行
<table class="normal">
<tr><th>コマンド</th><th>説明</th></tr>
<tr>
    <td>groovy</td>
    <td markdown="span">Groovyスクリプトを実行するインタプリタを起動します。  
    コマンドライン引数として1行だけのGroovyスクリプトを指定することもできます。</td>
</tr>
<tr>
    <td>groovysh</td>
    <td markdown="span">Groovyコードを対話的に実行するためのコマンドラインシェルを起動します。  
    文やスクリプトを1行ごとに入力しコードをその場で実行することができます。</td>
</tr>
<tr>
    <td>groovyConsole</td>
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

