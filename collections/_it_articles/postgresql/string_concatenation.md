---
title: PostgreSQLで文字列を結合する
article_group_id: tips-group
display_order: 20
created: 2022-10-19
updated: 2022-10-19
---
## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#結合方法">結合方法</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-19" updated="2022-10-19" %}</div>
- PostgreSQLでの文字列結合についてです。
- `+`では結合できませんので注意。

{% include goto_pagetop.html %}

* * *
## <a name="結合方法">結合方法</a><a class="heading-anchor-permalink" href="#結合方法">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-19" updated="2022-10-19" %}</div>
### 文字列結合には || 演算子を使う
文字列結合には `||` 演算子を利用します。  
複数続けて連続で指定可能です。
<div class="code-box-syntax no-title">
<pre>
&lt;文字列1&gt; <em>||</em> &lt;文字列2&gt; [<em>||</em> &lt;文字列x&gt; ...]
</pre>
</div>
<div class="code-box">
<div class="title">例</div>
<pre>
select 'abc' <em>||</em> 'あいう';
select 'abc' <em>||</em> 'あいう' <em>||</em> '123';
</pre>
</div>

### nullを `||` で結合すると nullになってしまう
<div class="code-box">
<div class="title">例</div>
<pre>
select 'abc' || 'あいう' || null;
</pre>
</div>
<div class="code-box">
<div class="title">出力結果</div>
<pre>
null
</pre>
</div>

### nullが入っている場合はconcat関数を使う
concat関数を使うと、`null`が入っていても結合することができます。
<div class="code-box-syntax no-title">
<pre>
concat(&lt;文字列&gt; [, &lt;文字列&gt; ...])
</pre>
</div>
<div class="code-box">
<div class="title">例</div>
<pre>
select concat('abc', 'あいう', null);
</pre>
</div>
- `null`部分は単純に無視されます(空文字で結合されると考えてもよいです)。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-19" updated="2022-10-19" %}</div>
### 参考サイト
- [(PostgresWeb) 【PostgreSQL】文字列の結合、nullを結合する](https://postgresweb.com/combine-strings)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
