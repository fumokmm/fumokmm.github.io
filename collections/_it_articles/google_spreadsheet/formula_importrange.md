---
title: IMPORTRANGE関数
article_group_id: formula-group
display_order: 10
created: 2022-04-08
updated: 2022-04-08
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#形式">形式</a></li>
<li><a href="#.XLSXのRANGEはインポートできない">.XLSXのRANGEはインポートできない</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="形式">形式</a><a class="heading-anchor-permalink" href="#形式">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-08" updated="2022-04-08" %}</div>
<div class="code-box-syntax no-title">
<div class="copy-button">Copy</div>
<pre>
IMPORTRANGE(&lt;spreadsheet_url&gt;, range_string)
</pre>
</div>
- インポートしてきた範囲をちょっとでもいじると(更新すると)とたんにエラーとなり、インポートしていた内容が見えなくなります。

<div class="code-box">
<div class="title">例</div>
<div class="copy-button">Copy</div>
<pre>
IMPORTRANGE("https://docs.google.com/spreadsheets/d/XXXXXXXXXXXXXXXXXXXXXXXX/edit#gid=999999999", "シート1!A1:C10")
</pre>
</div>
- スプレッドシートの`シート1`シートの`A1:C10`の範囲のデータをインポートしてきます。

{% include goto_pagetop.html %}

* * *
## <a name=".XLSXのRANGEはインポートできない">.XLSXのRANGEはインポートできない</a><a class="heading-anchor-permalink" href="#.XLSXのRANGEはインポートできない">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-08" updated="2022-04-08" %}</div>
- Googleスプレッドシートで.xlsxファイルも開くことができる
- しかし、.xlsxファイルの範囲をIMPORTRANGEで参照すると、「認証エラー」みたいなエラーが出てインポートできなかった(2022/4/8 現在)。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-08" updated="2022-04-08" %}</div>
### 参考サイト
- [(ドキュメント エディタ ヘルプ) Google スプレッドシートの関数リスト](https://support.google.com/docs/table/25273?hl=ja&ref_topic=9054531)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
