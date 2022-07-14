---
title: ExcelのXMATCH関数
article_group_id: formula-group
display_order: 50
created: 2022-07-14
updated: 2022-07-14
---
XMATCH関数はMATCH関数の上位互換です。使える環境の人は使わない手はないです。
## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#構文">構文</a></li>
<li><a href="#使用例">使用例</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="構文">構文</a><a class="heading-anchor-permalink" href="#構文">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-07-14" updated="2022-07-14" %}</div>
<div class="code-box-syntax no-title">
<pre>
=XMATCH(<em>&lt;検索値&gt;</em>, <em>&lt;検索範囲&gt;</em>)
=XMATCH(<em>&lt;検索値&gt;</em>, <em>&lt;検索範囲&gt;</em>, <em class="blue">[&lt;一致モード&gt;]</em>, <em class="blue">[&lt;検索モード&gt;]</em>)
</pre>
</div>
- 基本的な動きとしては、`<検索値>`を`<検索範囲>`の中から探して、見つかった検索範囲内でのインデックスを返却します。
- `<一致モード>`とか`<検索モード>`なども指定可能です。
  - デフォルトだと、`<一致モード>`は完全一致、`<検索モード>`は範囲の先頭項目から検索です。(`VLOOKUP`でよく指定するオプションなので、基本は省略で大丈夫かなと思います。)
  - `<一致モード>`は完全一致や完全一致しなかった場合は、その次に小さな値や大きな値、ワイルドカードで検索などが指定可能です。
  - `<検索モード>`は範囲の先頭項目や末尾項目から検索、バイナリで検索などが指定可能です。

{% include goto_pagetop.html %}

* * *
## <a name="使用例">使用例</a><a class="heading-anchor-permalink" href="#使用例">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-07-14" updated="2022-07-14" %}</div>
書き途中

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-07-14" updated="2022-07-14" %}</div>
### サポートバージョン
- Excel for Microsoft 365
- Excel for Microsoft 365 for Mac
- Excel for the web
- Excel 2021
- Excel 2021 for Mac

### 参照
- [(Microsoft \| サポート) XMATCH 関数](https://support.microsoft.com/ja-jp/office/xmatch-%E9%96%A2%E6%95%B0-d966da31-7a6b-4a13-a1c6-5a33ed6a0312)

### 参考サイト
- [(窓の杜) Excelの新関数「XMATCH」関数は使いこなせば強力なツールに！](https://forest.watch.impress.co.jp/docs/serial/offitech/1379258.html)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
