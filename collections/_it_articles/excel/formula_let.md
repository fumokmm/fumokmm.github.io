---
title: ExcelのLET関数
article_group_id: formula-group
display_order: 10
created: 2022-05-29
updated: 2022-05-29
---
LET関数を使うと関数の中で一時的に計算結果やセル値などを保持して利用することができるようになります。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#構文">構文</a></li>
<li><a href="#使用例">使用例</a></li>
<li><a href="#関連メモ">関連メモ</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="構文">構文</a><a class="heading-anchor-permalink" href="#構文">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-05-29" updated="2022-05-29" %}</div>
<div class="code-box-syntax no-title">
<div class="copy-button">Copy</div>
<pre>
=LET(<em>&lt;名前&gt;</em>, <em class="blue">&lt;名前の値&gt;</em>, <em class="orange">&lt;計算&gt;</em>)
=LET(<em>&lt;名前1&gt;</em>, <em class="blue">&lt;名前の値1&gt;</em>, [<em>&lt;名前2&gt;</em>, <em class="blue">&lt;名前の値2&gt;</em>, ...] <em class="orange">&lt;計算&gt;</em>)
</pre>
</div>
- `<名前>`に対して、`<名前の値>`を設定して、指定した名前を変数のようにして`<計算>`の中で利用可能になります。
- 名前と値の組は複数指定可能です。



{% include goto_pagetop.html %}

* * *
## <a name="使用例">使用例</a><a class="heading-anchor-permalink" href="#使用例">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-05-29" updated="2022-05-29" %}</div>
書き途中

{% include goto_pagetop.html %}

* * *
## <a name="関連メモ">関連メモ</a><a class="heading-anchor-permalink" href="#関連メモ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-05-29" updated="2022-05-29" %}</div>
- [Excelでセルの値が0の時に0を非表示にする方法]({% link _it_articles/excel/how_to_hide_zero_in_excel_when_the_value_of_a_cell_is_zero.md %})

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-05-29" updated="2022-05-29" %}</div>
### サポートバージョン
- Excel for Microsoft 365
- Excel for Microsoft 365 for Mac
- Excel for the web
- Excel 2021
- Excel 2021 for Mac

### 参照
- [(Microsoft \| サポート) LET 関数](https://support.microsoft.com/ja-jp/office/let-%E9%96%A2%E6%95%B0-34842dd8-b92b-4d3f-b325-b8b8f9908999)

### 参考サイト
- [(窓の杜) 「Excel」のLET関数は“複雑な数式”を“人が読める式”に変えられる！ 「Office 2021」新搭載の謎関数を攻略](https://forest.watch.impress.co.jp/docs/topic/special/1356887.html)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
