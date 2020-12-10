---
article: /it/python/grammar
chapter_no: 002
chapter_id: comment
chapter_title: コメント
created: 2020-12-10
updated: 2020-12-10
---
{% include article_def.html type="chapter" %}

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
