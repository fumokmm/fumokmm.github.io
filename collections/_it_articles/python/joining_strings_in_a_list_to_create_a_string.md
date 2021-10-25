---
title: Pythonでリスト中の文字列を結合して文字列を作る
article_group_id: reverse-lookup-group
display_order: 40
created: 2021-10-18
updated: 2021-10-18
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#str.joinメソッド">str.joinメソッド</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="str.joinメソッド">str.joinメソッド</a><a class="heading-anchor-permalink" href="#str.joinメソッド">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-18" updated="2021-10-18" %}</div>
`str`の`joinメソッド`を使います。  
<div class="code-box-output no-title">
<pre>
&gt;&gt;&gt; list = ["a", "b", "c"]
&gt;&gt;&gt; <em>"/"</em>.<em class="blue">join(</em>list<em class="blue">)</em>
'a/b/c'
</pre>
</div>
- 結合したい文字列のjoinメソッドの引数にリストを渡すと結合した文字列が取得できます。

ただし、リストの中身が文字列じゃないとエラーになるので注意して下さい。
<div class="code-box-output">
<div class="title">TypeError</div>
<pre>
&gt;&gt;&gt; list2 = [100, 200, 300]
&gt;&gt;&gt; "/".join(list2)
Traceback (most recent call last):
  File "&lt;stdin&gt;", line 1, in &lt;module&gt;
<em>TypeError: sequence item 0: expected str instance, int found</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-18" updated="2021-10-18" %}</div>
### 参照
- [(Python Documentation) str.join(iterable)](https://docs.python.org/ja/3/library/stdtypes.html?highlight=list#str.join)

### 参考サイト
- [(プログラミング教育ナビ) 【Python入門】list joinで文字列を連結する方法](https://programming-study.com/technology/python-list-join/)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
