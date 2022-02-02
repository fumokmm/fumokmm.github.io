---
title: Pythonのコンテキストマネージャ
article_group_id: basis-group
display_order: 30
created: 2022-02-02
updated: 2022-02-02
---
{% capture link_to_it_java %}{% link _it_articles/java/index.md %}{% endcapture %}
{% assign link_to_it_java = link_to_it_java | remove: 'index' %}

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#実装方法">実装方法</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-02" updated="2022-02-02" %}</div>
- Pythonにはコンテキストマネージャというものがあります。
- これは一般的にはリソースの開閉(`open`、`close`)を伴う処理で、開き忘れや閉じ忘れがないようサポートしてくれる機能になります。
- [Java]({{link_to_it_java}})でいうところの`AutoCloseable`みたいなものです。
- 定義するにはクラスを定義する際に、`__enter__`メソッドと`__exit__`メソッドを実装します。
- コンテキストマネージャが生成されるとき、`__enter__`が呼ばれ、`withブロック`で定義されたコンテキストから抜けるときに`__exit__`メソッドが呼ばれます。
- 裏で例外処理`try-except-finally`を利用しており、コンテキストから抜けるときに`__exit__`メソッドが確実に呼ばれます。

{% include goto_pagetop.html %}

* * *
## <a name="実装方法">実装方法</a><a class="heading-anchor-permalink" href="#実装方法">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-02" updated="2022-02-02" %}</div>
- 基本的には、`__enter__`メソッドと、`__exit__`メソッドを定義するだけです。
- `__exit__`メソッドの`exc_type`, `exc_value`, `traceback`は、コンテキスト内で例外が発生した場合に渡されます。
  - 例外が発生していないときは`None`です。
- `__enter__`メソッドで`return`している`self`が、`withブロック`で`as`として受け取った変数となります。

<div class="code-box no-title">
<pre>
class MyContextManager:
    <em>def __enter__(self):
        print('1 ENTER!')</em>
        <em class="blue">return self</em>

    <em>def __exit__(self, exc_type, exc_value, traceback):
        print('4 EXIT!')</em>

    def foo(self):
        print('3 FOO!')

# テストプログラム
with MyContextManager() <em class="blue">as cm</em>:
    print('2 ** hello **')
    <em class="blue">cm</em>.foo()
</pre>
</div>

<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
<em>1 ENTER!</em>
2 ** hello **
3 FOO!
<em>4 EXIT!</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-02" updated="2022-02-02" %}</div>
### 参考サイト
- [(Python入門) Python のコンテキストマネージャと with ブロック](https://python.keicode.com/lang/context-manager.php)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
