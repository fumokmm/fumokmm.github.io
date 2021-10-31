---
title: Pythonでリスト操作
article_group_id: basis-group
display_order: 10
created: 2021-10-31
updated: 2021-10-31
---
Pythonのリストは組み込み型のひとつです。  
便利なメソッドが多数用意されていますので、よく使いそうなメソッドをメモしておきます。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<div style="column-count: 2;">
    <ul id="index_ul">
        <li><a href="#要素追加系メソッド">要素追加系メソッド</a>
            <ul>
                <li><a href="#append">append</a></li>
                <li><a href="#extend">extend</a></li>
                <li><a href="#+演算子">+演算子</a></li>
            </ul>
        </li>
        <li><a href="#参照・参考">参照・参考</a>
            <ul>
                <li><a href="#参考サイト">参考サイト</a></li>
            </ul>
        </li>
    </ul>
</div>

## <a name="要素追加系メソッド">要素追加系メソッド</a><a class="heading-anchor-permalink" href="#要素追加系メソッド">§</a>
* * *
## <a name="append">append</a><a class="heading-anchor-permalink" href="#append">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-31" updated="2021-10-31" %}</div>
リストに要素を追加するには`append`メソッドを利用します。
<div class="code-box no-title">
<pre>
list = [100, 200, 300]
list<em>.append(400)</em>
print(list)
</pre>
</div>
<div class="code-box-output no-title">
<pre>
[100, 200, 300, <em>400</em>]
</pre>
</div>

### 参考
- [(Let'sプログラミング) リストへの要素の追加と別のリストとの結合](https://www.javadrive.jp/python/list/index6.html)

{% include goto_pagetop.html %}

* * *
## <a name="extend">extend</a><a class="heading-anchor-permalink" href="#extend">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-31" updated="2021-10-31" %}</div>
リストにリストの要素を1階層展開してすべて追加するには`extend`メソッドを利用します。
<div class="code-box no-title">
<pre>
list1 = [100, 200, 300]
list2 = ["aaa", "bbb"]
list1<em>.extend(list2)</em>
print(list1)
</pre>
</div>
<div class="code-box-output no-title">
<pre>
[100, 200, 300, <em>'aaa', 'bbb'</em>]
</pre>
</div>

ちなみに、`extend`の代わりに`append`でリストを追加すると、リスト毎追加されてしまいます。
<div class="code-box no-title">
<pre>
list1 = [100, 200, 300]
list2 = ["aaa", "bbb"]
list1<em>.append(list2)</em>  <em class="comment"># appendでリストを追加する</em>
print(list1)
</pre>
</div>
<div class="code-box-output no-title">
<pre>
[100, 200, 300, <em>['aaa', 'bbb']</em>]
</pre>
</div>



### 参考
- [(Let'sプログラミング) リストへの要素の追加と別のリストとの結合](https://www.javadrive.jp/python/list/index6.html)

{% include goto_pagetop.html %}

* * *
## <a name="+演算子">+演算子</a><a class="heading-anchor-permalink" href="#+演算子">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-31" updated="2021-10-31" %}</div>
リストにリストの要素を1階層展開してすべて追加した新しいリストを取得するには、`+`演算子を利用します。
<div class="code-box no-title">
<pre>
list1 = [100, 200, 300]
list2 = ["aaa", "bbb"]
list3 = <em>list1 + list2</em>
print(list3)
print(list1)
print(list2)
</pre>
</div>
<div class="code-box-output no-title">
<pre>
<em>[100, 200, 300, 'aaa', 'bbb']</em>
[100, 200, 300]
['aaa', 'bbb']
</pre>
</div>
- 新しいリストが返却されるので、元のリスト(ここではlist1, list2)には変化はありません。

### 参考
- [(Let'sプログラミング) リストへの要素の追加と別のリストとの結合](https://www.javadrive.jp/python/list/index6.html)

{% include goto_pagetop.html %}

## <a name="参照・参考">参照・参考</a><a class="heading-anchor-permalink" href="#参照・参考">§</a>
* * *
## <a name="参考サイト">参考サイト</a><a class="heading-anchor-permalink" href="#参考サイト">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-31" updated="2021-10-31" %}</div>
- [(Let'sプログラミング) リストへの要素の追加と別のリストとの結合](https://www.javadrive.jp/python/list/index6.html)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
