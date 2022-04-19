---
title: VBAでExcelオートシェイプ内の文字列を検索する
article_group_id: excel-group
display_order: 10
created: 2022-04-12
updated: 2022-04-19
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#コード">コード</a></li>
<li><a href="#関連メモ">関連メモ</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="コード">コード</a><a class="heading-anchor-permalink" href="#コード">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-12" updated="2022-04-12" %}</div>
以下のような関数(サブプロシージャ)を準備する。
<div class="code-box">
<div class="title">標準モジュール(Module1)</div>
<pre>
Option Explicit

Public Sub SearchInAutoShapes(ByRef x_shapes As Object)
    Dim p_shape As Object
    For Each p_shape In x_shapes
        <em class="comment">' グループ化された図形の場合</em>
        If p_shape.Type = MsoShapeType.msoGroup Then
            <em class="comment">' 再帰呼び出し
            SearchInAutoShapes p_shape.GroupItems
        
        {em:comment{' グループ化されていない場合</em>
        Else
            <em class="comment">' テキストがある場合</em>
            If p_shape.TextFrame2.HasText Then
                Dim p_textRange As Office.TextRange2
                Set p_textRange = p_shape.TextFrame2.TextRange
                Dim p_textInShape As String
                p_textInShape = p_textRange.Text
                
                MsgBox p_textInShape
                
                If p_textInShape = "たちつてと" Then
                    p_shape.Select
                End If
            End If
        End If
    Next p_shape
End Sub
</pre>
</div>
呼び出し側
<div class="code-box">
<div class="title">Sheet1</div>
<pre>
Option Explicit

Private Sub CommandButton1_Click()
    Dim p_sheet As Worksheet
    Set p_sheet = ActiveWorkbook.ActiveSheet
    <em>SearchInAutoShapes</em> <em class="blue">p_sheet.Shapes</em>
End Sub
</pre>
</div>

### 解説
- `SearchInAutoShapes`には、ワークシートの`Shapes`を渡します(そのシート中の全オートシェイプのコレクション)。
- オートシェイプがグループ化されていた場合、自分自身を再帰呼び出しして探しています。
- グループじゃないオートシェイプが特定できたら、`.TextFrame2`プロパティで`TextFrame`を取得してきて、`.HasText`プロパティでテキストを持っているか調べます。
- テキストを持っていたら、`TextFrame`の`.TextRange`プロパティで`TextRange`を取得してきます。
- `TextRange`の`.Text`プロパティから取得できるのが、そのオートシェイプ中の文字列です。
- 上の例では、オートシェイプ内に`"たちつてと"`という文字列があったら、そのオートシェイプを選択しています。

{% include goto_pagetop.html %}

* * *
## <a name="関連メモ">関連メモ</a><a class="heading-anchor-permalink" href="#関連メモ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-19" updated="2022-04-19" %}</div>
- [VBAを使ってWordで一括置換を行う]({% link _it_articles/vba/bulk_replace_in_word.md %})

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-12" updated="2022-04-12" %}</div>
### 動くサンプルはこちらからダウンロードできます
- [(language-examples) 0004_SearchStringInAutoShapes](https://github.com/fumokmm/language-examples/tree/main/VBA/0004_SearchStringInAutoShapes)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
