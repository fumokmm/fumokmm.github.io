---
title: VBAの型
display_order: 20
created: 2020-09-02
updated: 2021-01-04
---
こちらはVBAの型についてのメモです。

## <a name="index">目次</a><a href="#目次">§</a>

<ul id="index_ul">
<li><a href="#types">利用可能な型</a></li>
<li><a href="#reference">参考</a></li>
</ul>

* * *
## <a name="types">利用可能な型</a><a href="#types">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-09-02" updated="2021-01-04" %}</div>
VBAで利用可能な型は以下があります。

<table class="normal">
    <tr>
        <th>分類</th>
        <th>名称</th>
        <th>データ型</th>
        <th>未初期化状態の値</th>
        <th>説明</th>
    </tr>
    <tr>
        <td rowspan="6">数値</td>
        <td>バイト型</td>
        <td>Byte</td>
        <td>0</td>
        <td>1Byteで表せる正の整数値</td>
    </tr>
    <tr>
        <td>整数型</td>
        <td>Integer</td>
        <td>0</td>
        <td>2Byteで表せる整数値</td>
    </tr>
    <tr>
        <td>長整数型</td>
        <td>Long</td>
        <td>0</td>
        <td>4Byteで表せる整数値</td>
    </tr>
    <tr>
        <td>単精度浮動小数点型</td>
        <td>Single</td>
        <td>0</td>
        <td>4Byteで表せる浮動小数点値</td>
    </tr>
    <tr>
        <td>倍精度浮動小数点型</td>
        <td>Double</td>
        <td>0</td>
        <td>8Byteで表せる浮動小数点値</td>
    </tr>
    <tr>
        <td>通貨型</td>
        <td>Currency</td>
        <td>0</td>
        <td>8Byteで表せる固定小数点値</td>
    </tr>
    <tr>
        <td>ブール値</td>
        <td>ブール型</td>
        <td>Boolean</td>
        <td>False</td>
        <td>TrueまたはFalseのどちらかの値を取るデータ型</td>
    </tr>
    <tr>
        <td>日付</td>
        <td>日付型</td>
        <td>Date</td>
        <td>1899年12月30日0時0分0秒</td>
        <td>日付と時刻</td>
    </tr>
    <tr>
        <td>文字列</td>
        <td>文字列型</td>
        <td>String</td>
        <td>vbNullString</td>
        <td>文字列</td>
    </tr>
    <tr>
        <td rowspan="2">オブジェクト</td>
        <td>オブジェクト型</td>
        <td>Object</td>
        <td>Nothing</td>
        <td>任意のオブジェクト参照を表すデータ型</td>
    </tr>
    <tr>
        <td>固有オブジェクト型</td>
        <td>Range / Worksheet など</td>
        <td>Nothing</td>
        <td>特定の種類のオブジェクト参照を表すデータ型</td>
    </tr>
    <tr>
        <td colspan="2">ユーザー定義型</td>
        <td>ユーザーが定義したデータ型</td>
        <td>要素ごとの未初期化状態の値</td>
        <td>Typeステートメントを仕様して定義される任意のデータ型</td>
    </tr>
    <tr>
        <td colspan="2">バリアント型</td>
        <td>Variant</td>
        <td>Empty</td>
        <td>あらゆる種類の値を扱う特殊なデータ型</td>
    </tr>
</table>

{% include goto_pagetop.html %}

* * *
## <a name="reference">参考</a><a href="#reference">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-09-02" updated="2021-01-04" %}</div>
- {% include book/book_449.html %} {% comment %} パーフェクト Excel VBA {% endcomment %}

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
