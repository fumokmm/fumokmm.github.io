---
title: Excelでセルの値が0の時に0を非表示にする方法
article_group_id: tips-group
display_order: 30
created: 2022-05-18
updated: 2022-05-29
---
Excelで他のセルの値を参照してくるとき、セルの値が空白だったりすると「0」と表示されてしまう場合があります。そんなときにその「0」の値を消す方法をメモしておきます。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#フォントを白にする">フォントを白にする</a></li>
<li><a href="#条件付き書式を使う">条件付き書式を使う</a></li>
<li><a href="#IF関数を使う">IF関数を使う</a></li>
<li><a href="#セルの書式設定使う">セルの書式設定使う</a></li>
<li><a href="#Excelのオプションで指定する">Excelのオプションで指定する</a></li>
<li><a href="#関連メモ">関連メモ</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="フォントを白にする">フォントを白にする</a><a class="heading-anchor-permalink" href="#フォントを白にする">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-05-18" updated="2022-05-18" %}</div>
- 値が0になっているセルのフォントを「白」にします。
- ただし、値が0でない場合でも見えなくなってしまうため、あまり良い方法ではありません。

{% include goto_pagetop.html %}

* * *
## <a name="条件付き書式を使う">条件付き書式を使う</a><a class="heading-anchor-permalink" href="#条件付き書式を使う">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-05-18" updated="2022-05-18" %}</div>
- 条件付き書式で、値が0のときにフォントが白になるように設定します。
- ただし、背景色が白以外のセルの場合、0が見えてしまうので注意が必要です。

{% include goto_pagetop.html %}

* * *
## <a name="IF関数を使う">IF関数を使う</a><a class="heading-anchor-permalink" href="#IF関数を使う">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-05-18" updated="2022-05-29" %}</div>
- 以下のような感じでIF関数を使って「0」の時は空文字に置き換えます。
<div class="code-box no-title">
<pre>
=IF(<em>A1=0</em>, <em class="blue">""</em>, A1)
</pre>
</div>
- [LET関数]({% link _it_articles/excel/formula_let.md %})が使える環境では以下のような数式の方が効率的です。
<div class="code-box no-title">
<pre>
=LET(<em class="orange">val</em>, A1, IF(<em>val=0</em>, <em class="blue">""</em>, <em class="orange">val</em>))
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="セルの書式設定使う">セルの書式設定使う</a><a class="heading-anchor-permalink" href="#セルの書式設定使う">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-05-18" updated="2022-05-18" %}</div>
- セルの書式設定でユーザ定義にて「#」を指定します。

{% include goto_pagetop.html %}

* * *
## <a name="Excelのオプションで指定する">Excelのオプションで指定する</a><a class="heading-anchor-permalink" href="#Excelのオプションで指定する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-05-18" updated="2022-05-18" %}</div>
- 「Excelのオプション」を表示し、「詳細設定」の中から「ゼロ値のセルにゼロを表示する」のチェックを外します。
<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20220518/20220518234859.png)
</p>
- ※影響範囲はシート単位です。

{% include goto_pagetop.html %}

* * *
## <a name="関連メモ">関連メモ</a><a class="heading-anchor-permalink" href="#関連メモ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-05-29" updated="2022-05-29" %}</div>
- [ExcelのLET関数]({% link _it_articles/excel/formula_let.md %})

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-05-18" updated="2022-05-18" %}</div>
### 参照サイト
- [(Microsoft \| Docs) ゼロ値を表示する、または非表示にする](https://support.microsoft.com/ja-jp/office/%E3%82%BC%E3%83%AD%E5%80%A4%E3%82%92%E8%A1%A8%E7%A4%BA%E3%81%99%E3%82%8B-%E3%81%BE%E3%81%9F%E3%81%AF%E9%9D%9E%E8%A1%A8%E7%A4%BA%E3%81%AB%E3%81%99%E3%82%8B-3ec7a433-46b8-4516-8085-a00e9e476b03)
- [(できるネット) Excelで「0」を表示しない（非表示にする）5つの方法](https://dekiru.net/article/21949/)
- [(Tipsfound) エクセル 0 を表示しない](https://www.tipsfound.com/excel/06009)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
