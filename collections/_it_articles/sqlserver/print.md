---
title: SQL Serverで任意のメッセージを出力する
article_group_id: tips-group
display_order: 100
created: 2021-08-02
updated: 2021-08-02
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#PRINT">PRINT</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="PRINT">PRINT</a><a class="heading-anchor-permalink" href="#PRINT">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-02" updated="2021-08-02" %}</div>
- `@変数名`で宣言した変数に設定した文字列などを出力するには、`PRINT`を利用します。
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
DECLARE <em>@nm</em> as nvarchar(40)
SET <em>@nm</em> = 'fumo'
PRINT 'こんにちは!' + <em>@nm</em> + 'さん'
</pre>
</div>

### 出力結果
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
こんにちは!fumoさん
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-02" updated="2021-08-02" %}</div>
### ソース
- [(language-examples) 0001_print.sql](https://github.com/fumokmm/language-examples/blob/main/SQLServer/0001_print.sql)

### 参考
- [(Microsoft \| Docs) PRINT (Transact-SQL)](https://docs.microsoft.com/en-us/sql/t-sql/language-elements/print-transact-sql)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
