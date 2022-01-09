---
title: SQL ServerでテーブルをコピーしてバックアップするSQL
article_group_id: control-group
display_order: 60
created: 2020-07-15
updated: 2022-01-09
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#SELECT INSERT">SELECT INSERT</a></li>
</ul>

* * *
## <a name="SELECT INSERT">SELECT INSERT</a><a class="heading-anchor-permalink" href="#SELECT INSERT">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-07-15" updated="2022-01-09" %}</div>
テーブルをサクっとコピーしてバックアップしたい場合に使えるSQLです。

<div class="code-box-syntax">
<div class="title">テーブルをコピーしてバックアップするSQL</div>
<pre>
SELECT * INTO <em>&lt;新しいテーブル名&gt;</em> FROM <em>&lt;テーブル名&gt;</em>;
</pre>
</div>

### 例
以下SQLを実行すると、`M_USER`と同じレイアウトの`M_USER_20201015`という名前のテーブルが作成されます。
<div class="code-box no-title">
<pre>
SELECT * INTO <em>M_USER_20201015</em> FROM <em>M_USER</em>;
</pre>
</div>

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
