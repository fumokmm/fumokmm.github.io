---
title: Pythonの文法
article_group_id: basis-group
display_order: 10
created: 2020-12-10
updated: 2020-12-10
---
ここではPythonの文法を簡単にまとめておきます。特に記載のない場合、Python3を対象としています。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#helloworld">ハローワールド</a></li>
<li><a href="#comment">コメント</a></li>
</ul>

* * *
## <a name="helloworld">ハローワールド</a><a class="heading-anchor-permalink" href="#helloworld">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-10" updated="2020-12-10" %}</div>
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

{% include goto_pagetop.html %}

* * *
## <a name="comment">コメント</a><a class="heading-anchor-permalink" href="#comment">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-10" updated="2020-12-10" %}</div>
### 行コメント

`#`以降が行コメントになります。

<div class="code-box">
<div class="title">comment1.py</div>
<pre>
<em class="comment"># これはコメント</em>
print('Hello') <em class="comment"># これもコメント</em>
</pre>
</div>

### 複数行コメント

シングルクォーテーション3つ(`'''`)で囲むと複数行コメントになります。

<div class="code-box">
<div class="title">comment2.py</div>
<pre>
<em class="comment">'''
この行はコメント！
この行もコメント！
'''</em>
</pre>
</div>

Pythonはインデントでブロックを表現する言語なので、複数行コメントの場合はインデントに注意しましょう。  
同じブロックにいないとエラーになります。

<div class="code-box">
<div class="title">comment2.py</div>
<pre>
for x in {1, 2, 3}:
  print("text")
  <em class="comment">'''
  forのブロック内でのコメントは
  同じインデントを付けて書く必要がある
  '''</em>
  print(x)

<em class="comment">'''
この行もコメント(forのブロックの外)
この行もコメント(forのブロックの外)
'''</em>
</pre>
</div>

### 参考

- [(UX MILK) Pythonでのコメントアウトの書き方](https://uxmilk.jp/8847)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
