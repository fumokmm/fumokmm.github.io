---
title: YAMLのメモ
article_group_id: format-group
display_order: 70
created: 2021-04-20
updated: 2021-11-15
---
YAMLのメモです。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#nullの扱い">nullの扱い</a></li>
<li><a href="#空配列の扱い">空配列の扱い</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="nullの扱い">nullの扱い</a><a class="heading-anchor-permalink" href="#nullの扱い">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-15" updated="2021-11-15" %}</div>
YAMLではnullは`null`または、チルダ(`~`)で表現します。
<div class="code-box no-title">
<pre>
a: <em>null</em>
b: <em>~</em>
</pre>
</div>

### 参考
- [(Symfony) YAMLフォーマット](https://symfony.com/legacy/doc/reference/1_2/ja/02-yaml)

{% include goto_pagetop.html %}

* * *
## <a name="空配列の扱い">空配列の扱い</a><a class="heading-anchor-permalink" href="#空配列の扱い">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-01-24" updated="2022-01-24" %}</div>
YAMLでは空配列は`[]`で表現します。
<div class="code-box no-title">
<pre>
a: <em>[]</em>
</pre>
</div>
なお、何も書かないと`null`になってしまうようです。
<div class="code-box no-title">
<pre>
a:
</pre>
</div>

### 参考
- [(Qiita) YAMLで空の配列を表現する](https://qiita.com/wataru-morioka/items/3b619bca5cf912f6c339)

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-15" updated="2022-01-24" %}</div>
### 参考サイト
- [(Qiita) YAMLで空の配列を表現する](https://qiita.com/wataru-morioka/items/3b619bca5cf912f6c339)
- [(Symfony) YAMLフォーマット](https://symfony.com/legacy/doc/reference/1_2/ja/02-yaml)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
