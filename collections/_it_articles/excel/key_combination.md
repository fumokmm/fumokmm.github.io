---
title: Excel作業効率を上げるキーコンビネーション
article_group_id: tips-group
display_order: 900
created: 2020-12-17
updated: 2023-02-20
---
ここではExcel作業するときに知っていると作業効率の上がるキーコンビネーションをまとめておきます。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#general">全般</a></li>
<li><a href="#row">行操作</a></li>
<li><a href="#column">列操作</a></li>
<li><a href="#sheet">シート操作</a></li>
<li><a href="#cell">セル操作</a></li>
<li><a href="#filter">フィルター操作</a></li>
<li><a href="#edit">編集操作</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="general">全般</a><a class="heading-anchor-permalink" href="#general">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-25" updated="2023-02-20" %}</div>
### <a name="keyboard">キーボード操作</a>
{% include article_parts/key_combination.html title="直前の操作を繰り返す" key1="F4" %}

### <a name="mouse">マウス操作</a>
{% include article_parts/key_combination.html title="横スクロール" key1="Shift" key2="Ctrl" key3="マウススクロール" %}

{% include goto_pagetop.html %}

* * *
## <a name="row">行操作</a><a class="heading-anchor-permalink" href="#row">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-17" updated="2021-03-25" %}</div>
### <a name="row-insert-and-delete">挿入・削除</a>
{% include article_parts/key_combination.html title="行挿入" key1="Alt + H" key2="I" key3="2" key4="R" %}
{% include article_parts/key_combination.html title="行削除" key1="Alt + H" key2="D" key3="R" %}
- 関連：[列の挿入・削除]({% link _it_articles/excel/key_combination.md %}#column-insert-and-delete)

### <a name="row-hide-and-show-again">非表示・再表示</a>
{% include article_parts/key_combination.html title="行の非表示" key1="Ctrl + 9" %}
{% include article_parts/key_combination.html title="行の再表示" key1="Ctrl + Shift + 9" %}
- 関連：[列の非表示・再表示]({% link _it_articles/excel/key_combination.md %}#column-hide-and-show-again)

#### 参考
- [(Office TANAKA) 行/列を簡単に表示/非表示する](http://officetanaka.net/excel/function/tips/tips37.htm)


{% include goto_pagetop.html %}

* * *
## <a name="column">列操作</a><a class="heading-anchor-permalink" href="#column">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-17" updated="2021-03-25" %}</div>
### <a name="column-insert-and-delete">挿入・削除</a>
{% include article_parts/key_combination.html title="列挿入" key1="Alt + H" key2="I" key3="2" key4="C" %}
{% include article_parts/key_combination.html title="列削除" key1="Alt + H" key2="D" key3="C" %}
- 関連：[行の挿入・削除]({% link _it_articles/excel/key_combination.md %}#row-insert-and-delete)

### <a name="column-hide-and-show-again">非表示・再表示</a>
{% include article_parts/key_combination.html title="列の非表示" key1="Ctrl + 0" %}
{% include article_parts/key_combination.html title="列の再表示" key1="Ctrl + Shift + 0" %}
- 関連：[行の非表示・再表示]({% link _it_articles/excel/key_combination.md %}#row-hide-and-show-again)

#### 参考
- [(Office TANAKA) 行/列を簡単に表示/非表示する](http://officetanaka.net/excel/function/tips/tips37.htm)

{% include goto_pagetop.html %}

* * *
## <a name="sheet">シート操作</a><a class="heading-anchor-permalink" href="#sheet">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-17" updated="2021-11-18" %}</div>
### シート自体
{% include article_parts/key_start.html title="シート挿入" %}
    {% include article_parts/key_combination.html key1="Alt + H" key2="I" key3="2" key4="S" %}
    {% include article_parts/key_or.html %}
    {% include article_parts/key_combination.html key1="Shift + F11" %}
{% include article_parts/key_end.html %}
{% include article_parts/key_combination.html title="シート削除" key1="Alt + H" key2="D" key3="S" %}
{% include article_parts/key_combination.html title="シート名変更" key1="Alt + H" key2="O" key3="R" %}
{% include article_parts/key_combination.html title="シートの移動またはコピー" key1="Alt + H" key2="O" key3="M" %}
{% include article_parts/key_combination.html title="シート見出しの色変更" key1="Alt + H" key2="O" key3="T" %}

#### 参考
- [(超文系Excel講座) シート間を移動してシート名を変更するショートカット](https://bunkei-excel.com/539.html)
- [(Office Hack) Excelのシート名変更のショートカットキー（Windows）](https://office-hack.com/excel/shortcutkey-sheetname-change/)
- [(できるネット) ショートカットキーでワークシートの名前を変更する](https://dekiru.net/article/12471/)
- [(神速Excel) エクセルは、0.5秒でシートの挿入・削除ができる](https://diamond.jp/articles/-/217226)

### 数式バー
{% include article_parts/key_combination.html title="数式バーの展開" key1="Ctrl + Shift + U" %}
{% include article_parts/key_combination.html title="数式バーの展開を元に戻す" key1="Ctrl + Shift + U" additional="展開と同じキー" %}

{% include goto_pagetop.html %}

* * *
## <a name="cell">セル操作</a><a class="heading-anchor-permalink" href="#cell">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-17" updated="2021-05-17" %}</div>
### セルの値の操作
{% include article_parts/key_combination.html title="セルの値をすべてクリア" key1="Alt + H" key2="E" key3="A" %}
{% include article_parts/key_combination.html title="セルの書式のクリア" key1="Alt + H" key2="E" key3="F" %}
{% include article_parts/key_combination.html title="セルの数式と値のクリア" key1="Alt + H" key2="E" key3="C" %}
{% include article_parts/key_combination.html title="セルのコメントのクリア" key1="Alt + H" key2="E" key3="M" %}
{% include article_parts/key_combination.html title="セルのハイパーリンクのクリア" key1="Alt + H" key2="E" key3="L" %}
{% include article_parts/key_combination.html title="セルの背景色を「塗りつぶしなし」にする" key1="Alt + H" key2="H" key3="N" %}

### セル自体の操作
{% include article_parts/key_combination.html title="セル挿入" key1="Alt + H" key2="I" key3="2" key4="I" %}
{% include article_parts/key_combination.html title="セル削除" key1="Alt + H" key2="D" key3="D" %}

{% include goto_pagetop.html %}

* * *
## <a name="filter">フィルター操作</a><a class="heading-anchor-permalink" href="#filter">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-17" updated="2020-12-23" %}</div>
{% include article_parts/key_start.html title="フィルターのクリア（フィルターされた状態で実施）" %}
    {% include article_parts/key_combination.html key1="Alt + A" key2="C" %}
    {% include article_parts/key_or.html %}
    {% include article_parts/key_combination.html key1="Alt + A" key2="C" key3="2" %}
{% include article_parts/key_end.html %}

{% include goto_pagetop.html %}

* * *
## <a name="edit">編集操作</a><a class="heading-anchor-permalink" href="#edit">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-17" updated="2021-03-15" %}</div>
### 値貼り付け
{% include article_parts/key_combination.html title="値貼り付け(1)" key1="Alt + H" key2="V" key3="V" additional="セルをコピーしていた場合" %}
{% include article_parts/key_combination.html title="値貼り付け(2)" key1="Alt + H" key2="V" key3="T" additional="テキストをコピーしていた場合" %}
{% include article_parts/key_combination.html title="値貼り付け(3)" key1="Alt + V" key2="V" key3="Enter" additional="テキストをコピーしていた場合" %}

### 数式貼り付け
{% include article_parts/key_combination.html title="数式貼り付け" key1="Alt + H" key2="V" key3="F" additional="セルをコピーしていた場合" %}

### メモの編集
{% include article_parts/key_combination.html title="新しいメモ" key1="Alt + R" key2="T" key3="N" %}
{% include article_parts/key_combination.html title="メモの編集" key1="Alt + R" key2="T" key3="E" %}
{% include article_parts/key_combination.html title="メモの削除" key1="Alt + R" key2="D" %}
{% include article_parts/key_combination.html title="前のメモ" key1="Alt + R" key2="T" key3="P" %}
{% include article_parts/key_combination.html title="次のメモ" key1="Alt + R" key2="T" key3="T" %}
{% include article_parts/key_combination.html title="メモの表示/非表示" key1="Alt + R" key2="T" key3="O" %}
{% include article_parts/key_combination.html title="すべてのメモを表示" key1="Alt + R" key2="T" key3="S" %}
{% include article_parts/key_combination.html title="コメントに変換" key1="Alt + R" key2="T" key3="C" %}

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-17" updated="2023-02-20" %}</div>
### 関連メモ
- [Excelで横スクロールする]({% link _it_articles/excel/horizontal_scrolling.md %})

### 参考サイト
- [(Office Hack) Excelのシート名変更のショートカットキー（Windows）](https://office-hack.com/excel/shortcutkey-sheetname-change/)
- [(Office TANAKA) 行/列を簡単に表示/非表示する](http://officetanaka.net/excel/function/tips/tips37.htm)
- [(Office TANAKA) 行/列を簡単に表示/非表示する](http://officetanaka.net/excel/function/tips/tips37.htm)
- [(できるネット) ショートカットキーでワークシートの名前を変更する](https://dekiru.net/article/12471/)
- [(神速Excel) エクセルは、0.5秒でシートの挿入・削除ができる](https://diamond.jp/articles/-/217226)
- [(超文系Excel講座) シート間を移動してシート名を変更するショートカット](https://bunkei-excel.com/539.html)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
