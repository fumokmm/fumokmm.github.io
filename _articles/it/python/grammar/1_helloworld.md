---
chapter_no: 1
chapter_id: helloworld
chapter_title: ハローワールド
created: 2020-12-10
updated: 2020-12-10
---
`print`を使います。

<div class="code-box">
<div class="title">hello1.py</div>
<pre>
print("Hello, World")
print("Hello, ")
print("World")
</pre>
</div>

<div class="code-box-output">
<div class="title">実行結果</div>
<pre>
<em class="command">$ python hello1.py</em>
Hello, World
Hello, 
World
</pre>
</div>

普通に呼び出すと、改行コード付きで出力されます。 改行コードなしにするには、`end=""` を付けます。

<div class="code-box">
<div class="title">hello2.py</div>
<pre>
print("Hello, ", <em>end=""</em>) <em class="comment"># end="" とすると改行しない</em>
print("World")
</pre>
</div>

<div class="code-box-output">
<div class="title">実行結果</div>
<pre>
<em class="command">$ python hello2.py</em>
Hello, World
</pre>
</div>

### 参考

- [(てきとーなブログ) python3で改行なしprintをする。](http://azoay.hatenablog.com/entry/2015/06/10/203134)
