---
title: Pythonでリスト操作
article_group_id: basis-group
display_order: 10
created: 2021-10-31
updated: 2021-11-25
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
                <li><a href="#*演算子">*演算子</a></li>
            </ul>
        </li>
        <li><a href="#チェック系メソッド">チェック系メソッド</a>
            <ul>
                <li><a href="#リストに要素が含まれているか">リストに要素が含まれているか</a></li>
            </ul>
        </li>
        <li><a href="#参照・参考">参照・参考</a>
            <ul>
                <li><a href="#参考サイト">参考サイト</a></li>
                <li><a href="#サンプルソース">サンプルソース</a></li>
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
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-31" updated="2021-11-16" %}</div>
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
`extend`と同じ挙動は、[+演算子](#+演算子)を使い`+=`とすることでも可能です。


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
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-31" updated="2021-11-16" %}</div>
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
- 新しいリストが返却されるので、元のリスト(ここではlist1, list2)に変化はありません。

元のリストに破壊的に要素を追加するには`+=`を使います。
<div class="code-box no-title">
<pre>
list4 = [400, 500]
list4 <em>+=</em> ["ccc", "ddd"]
print(list4)
</pre>
</div>
<div class="code-box-output no-title">
<pre>
[400, 500, 'ccc', 'ddd']
</pre>
</div>
- 同じ挙動をするメソッドとしては[extend](#extend)があります。

### 参考
- [(Let'sプログラミング) リストへの要素の追加と別のリストとの結合](https://www.javadrive.jp/python/list/index6.html)
- [(@IT) ［解決！Python］リスト（配列）に要素を追加するには（+演算子／+=演算子／append／extend／insertメソッド）](https://atmarkit.itmedia.co.jp/ait/articles/2012/11/news015.html)

{% include goto_pagetop.html %}

* * *
## <a name="*演算子">*演算子</a><a class="heading-anchor-permalink" href="#*演算子">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-31" updated="2021-11-16" %}</div>
リストの要素を繰り返したリストを取得するには、`*`演算子を利用します。
<div class="code-box no-title">
<pre>
list1 = ["a"] <em>* 3</em>
print(list1)
</pre>
</div>
<div class="code-box-output no-title">
<pre>
['a', 'a', 'a']
</pre>
</div>
<div class="code-box no-title">
<pre>
list2 = [10, 20, 30] <em>* 2</em>
print(list2)
</pre>
</div>
<div class="code-box-output no-title">
<pre>
[10, 20, 30, 10, 20, 30]
</pre>
</div>
- 新しいリストが返却されるので、元のリスト(ここではlist1やlist2)に変化はありません。

元のリストに破壊的に変更し要素を追加するには`*=`を使います。
<div class="code-box no-title">
<pre>
list3 = ["a", "b", "c"]
list3 <em>*= 2</em>
print(list3)
</pre>
</div>
<div class="code-box-output no-title">
<pre>
['a', 'b', 'c', 'a', 'b', 'c']
</pre>
</div>

### 参考
- [(Python Carnival) 【Python3入門】*(アスタリスク)1個の機能まとめ](https://pycarnival.com/one_asterisk/)

{% include goto_pagetop.html %}

## <a name="チェック系メソッド">チェック系メソッド</a><a class="heading-anchor-permalink" href="#チェック系メソッド">§</a>
* * *
## <a name="リストに要素が含まれているか">リストに要素が含まれているか</a><a class="heading-anchor-permalink" href="#リストに要素が含まれているか">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-25" updated="2021-11-25" %}</div>
リストに要素が含まれているかをチェックするには、`in演算子`を利用します。

<div class="code-box-syntax no-title">
<pre>
&lt;要素&gt; in &lt;リスト&gt;
</pre>
</div>
- `<要素>`が`<リスト>`に含まれている場合、`True`が、含まれない場合`False`が返却されます。

### 例
<div class="code-box no-title">
<pre>
list = ["A", "B", <em>"C"</em>, "D", "E"]
assert ("C" <em>in</em> list) == <em class="blue">True</em>
</pre>
</div>

### 参考
- [(Let'sプログラミング) リストに指定した値と同じ要素が含まれているか確認する](https://www.javadrive.jp/python/list/index10.html)

### サンプルソース
- [(language-examples) 0003_list_include.py](https://github.com/fumokmm/language-examples/blob/main/Python/0003_list_include.py)

{% include goto_pagetop.html %}

## <a name="参照・参考">参照・参考</a><a class="heading-anchor-permalink" href="#参照・参考">§</a>
* * *
## <a name="参考サイト">参考サイト</a><a class="heading-anchor-permalink" href="#参考サイト">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-31" updated="2021-11-25" %}</div>
- [(@IT) ［解決！Python］リスト（配列）に要素を追加するには（+演算子／+=演算子／append／extend／insertメソッド）](https://atmarkit.itmedia.co.jp/ait/articles/2012/11/news015.html)
- [(Let'sプログラミング) リストに指定した値と同じ要素が含まれているか確認する](https://www.javadrive.jp/python/list/index10.html)
- [(Let'sプログラミング) リストへの要素の追加と別のリストとの結合](https://www.javadrive.jp/python/list/index6.html)
- [(Python Carnival) 【Python3入門】*(アスタリスク)1個の機能まとめ](https://pycarnival.com/one_asterisk/)

{% include goto_pagetop.html %}

* * *
## <a name="サンプルソース">サンプルソース</a><a class="heading-anchor-permalink" href="#サンプルソース">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-25" updated="2021-11-25" %}</div>
- [(language-examples) 0003_list_include.py](https://github.com/fumokmm/language-examples/blob/main/Python/0003_list_include.py)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
