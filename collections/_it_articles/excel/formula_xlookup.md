---
title: ExcelのXLOOKUP関数
article_group_id: formula-group
display_order: 40
created: 2022-07-14
updated: 2022-08-29
---
XLOOKUP関数はVLOOKUP関数とHLOOKUP関数の上位互換です。使える環境の人は使わない手はないです。
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
<div class="copy-button">Copy</div>
<pre>
=XLOOKUP(<em>&lt;検索値&gt;</em>, <em>&lt;検索範囲&gt;</em>, <em>&lt;戻り範囲&gt;</em>)
=XLOOKUP(<em>&lt;検索値&gt;</em>, <em>&lt;検索範囲&gt;</em>, <em>&lt;戻り範囲&gt;</em>, <em class="blue">[&lt;見つからない場合&gt;]</em>)
=XLOOKUP(<em>&lt;検索値&gt;</em>, <em>&lt;検索範囲&gt;</em>, <em>&lt;戻り範囲&gt;</em>, <em class="blue">[&lt;見つからない場合&gt;]</em>, <em class="blue">[&lt;一致モード&gt;]</em>, <em class="blue">[&lt;検索モード&gt;]</em>)
</pre>
</div>
- 基本的な動きとしては、`<検索値>`を`<検索範囲>`の中から探して、`<戻り範囲>`中の同じ位置のものを返却します。
- 見つからなかったときに返す値として、`<見つからない場合>`がオプションとして指定可能です。
- `<一致モード>`とか`<検索モード>`なども指定可能です。
  - デフォルトだと、`<一致モード>`は完全一致、`<検索モード>`は範囲の先頭項目から検索です。(`VLOOKUP`でよく指定するオプションなので、基本は省略で大丈夫かなと思います。)
  - `<一致モード>`は完全一致や完全一致しなかった場合は、その次に小さな値や大きな値、ワイルドカードで検索などが指定可能です。
  - `<検索モード>`は範囲の先頭項目や末尾項目から検索、バイナリで検索などが指定可能です。

{% include goto_pagetop.html %}

* * *
## <a name="使用例">使用例</a><a class="heading-anchor-permalink" href="#使用例">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-07-14" updated="2022-08-29" %}</div>
<p class="center size-6" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20220829/20220829233501.png)
</p>
<p class="center size-6" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20220829/20220829233434.png)
</p>

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
- Excel 2019
- Excel 2016
- Excel for iPad
- Excel for iPhone
- Excel for Android タブレット
- Excel for Android フォン

### 参照
- [(Microsoft \| サポート) XLOOKUP 関数](https://support.microsoft.com/ja-jp/office/xlookup-%E9%96%A2%E6%95%B0-b7fd680e-6d10-43e6-84f9-88eae8bf5929)

### 参考サイト
- [(窓の杜) ExcelのVLOOKUP関数にサヨナラを ～圧倒的に便利な「XLOOKUP関数」をOffice 2021で利用しよう！](https://forest.watch.impress.co.jp/docs/topic/special/1356264.html)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
