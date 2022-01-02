---
title: パスを結合する
article_group_id: path-control-group
display_order: 10
created: 2022-01-02
updated: 2022-01-02
---
{% capture link_to_it_ruby %}{% link _it_articles/ruby/index.md %}{% endcapture %}
{% assign link_to_it_ruby = link_to_it_ruby | remove: 'index' %}
## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#Rubyでパスを結合する">Rubyでパスを結合する</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="Rubyでパスを結合する">Rubyでパスを結合する</a><a class="heading-anchor-permalink" href="#Rubyでパスを結合する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-01-02" updated="2022-01-02" %}</div>
### 構文
<div class="code-box-syntax no-title">
<pre>
File.join(item...)
</pre>
</div>
- `File::SEPARATOR`を間に入れて文字列を連結します。
- 戻り値の型は文字列です。
- パスが結合された文字列が返却されます。

### 例
<div class="code-box no-title">
<pre>
File.<em>join</em>(<em class="blue">"a","b"</em>)                        <em class="comment"># =&gt; "a/b"</em>
File.<em>join</em>(<em class="blue">"a/","b"</em>)                       <em class="comment"># =&gt; "a/b"</em>
File.<em>join</em>(<em class="blue">"a/","/b"</em>)                      <em class="comment"># =&gt; "a/b"</em>
File.<em>join</em>(<em class="blue">"a","/b"</em>)                       <em class="comment"># =&gt; "a/b"</em>
File.<em>join</em>(<em class="blue">"a", ["b", ["c", ["d"]]]</em>)       <em class="comment"># =&gt; "a/b/c/d"</em>
File.<em>join</em>(<em class="blue">"", "a", ["b", ["c", ["d"]]]</em>)   <em class="comment"># =&gt; "/a/b/c/d"</em>
File.<em>join</em>(<em class="blue">[]</em>)                             <em class="comment"># =&gt; ""</em>
File.<em>join</em>                                 <em class="comment"># =&gt; ""</em>
</pre>
</div>

### 参考
- [File.join](https://docs.ruby-lang.org/ja/latest/class/File.html#S_JOIN)

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-01-02" updated="2022-01-02" %}</div>
### 関連メモ
- [Rubyのメモ]({{link_to_it_ruby}})

### 参照
- [File.join](https://docs.ruby-lang.org/ja/latest/class/File.html#S_JOIN)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
