---
title: VBAを使ってWordで一括置換を行う
article_group_id: word-group
display_order: 10
created: 2022-04-19
updated: 2022-04-19
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#ドキュメント内の文字列を一括置換">ドキュメント内の文字列を一括置換</a></li>
<li><a href="#オートシェイプ内の文字列を一括置換">オートシェイプ内の文字列を一括置換</a></li>
<li><a href="#関連メモ">関連メモ</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-19" updated="2022-04-19" %}</div>
Wordでドキュメント内の文字列やオートシェイプ内の文字列をVBAで一括置換したい場合ってありますよね？  
そんな時のためのサンプルコードです。

{% include goto_pagetop.html %}

* * *
## <a name="ドキュメント内の文字列を一括置換">ドキュメント内の文字列を一括置換</a><a class="heading-anchor-permalink" href="#ドキュメント内の文字列を一括置換">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-19" updated="2022-04-19" %}</div>
まずはドキュメント内の文字列を一括置換するコードです。
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
Option Explicit

Sub ReplaceTexts()
    With ActiveWindow.Selection.Find
        <em>.Text = "あ"</em>
        .MatchFuzzy = False  <em class="comment">' ワイルドカードを利用するときはあいまい検索をオフにする</em>
        .MatchWildcards = True  <em class="comment">' ワイルドカード指定で検索</em>
        <em class="comment">' 検索を実行</em>
        Do While .Execute
            Dim p_foundStr As String
            p_foundStr = ActiveWindow.Selection.Range.Text
            Debug.Print p_foundStr
            <em class="comment">' 置換を実行</em>
            <em class="blue">ActiveWindow.Selection.Range.Text = "●"</em>
        Loop
    End With
End Sub
</pre>
</div>
- 上記は`"あ"`という文字列を`"●"`に置換しています。

{% include goto_pagetop.html %}

* * *
## <a name="オートシェイプ内の文字列を一括置換">オートシェイプ内の文字列を一括置換</a><a class="heading-anchor-permalink" href="#オートシェイプ内の文字列を一括置換">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-19" updated="2022-04-19" %}</div>
今度はオートシェイプ内の文字列を一括置換するコードです。
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
Option Explicit

Sub ReplaceTextsInShapes()
    <em class="comment">' 全シェイプオブジェクトに対してループ</em>
    Dim p_shape As Variant
    For Each p_shape In ActiveWindow.Document.Shapes
        <em class="comment">' シェイプオブジェクトが描画キャンバスの場合</em>
        If p_shape.Type = msoCanvas Then
            <em class="comment">' 描画キャンバス内のすべてのアイテムに対してループ</em>
            Dim p_canvasShape As Variant
            For Each p_canvasShape In p_shape.CanvasItems
                <em class="comment">' グループ化されている場合は再度ループ</em>
                If p_canvasShape.Type = msoGroup Then
                    Dim p_canvasGroupShape As Variant
                    For Each p_canvasGroupShape In p_canvasShape.GroupItems
                        ReplaceShapeTexts p_canvasGroupShape
                    Next p_canvasGroupShape
                Else
                    ReplaceShapeTexts p_canvasShape
                End If
            Next p_canvasShape
        
        <em class="comment">' オートシェイプがグループ化されている場合</em>
        ElseIf p_shape.Type = msoGroup Then
            Dim p_groupShape As Variant
            For Each p_groupShape In p_shape.GroupItems
                ReplaceShapeTexts p_groupShape
            Next p_groupShape
            
        <em class="comment">' オートシェイプが単なるシェイプオブジェクトの場合</em>
        Else
            ReplaceShapeTexts p_shape
        End If
    Next p_shape
End Sub

Private Sub ReplaceShapeTexts(ByRef x_shapes As Variant)
    <em class="comment">' テキストが含まれないオートシェイプなら処理を抜ける</em>
    If Not x_shapes.TextFrame.HasText Then
        Exit Sub
    End If
    
    Dim p_range As Word.Range
    Dim p_find As Word.Find

    <em class="comment">' [NOTE] Rangeオブジェジェクトから生成したFindは</em>
    <em class="comment">'        検索文字が見つかる度に範囲が再構築される</em>
    Set p_range = x_shapes.TextFrame.TextRange
    Set p_find = p_range.Find
    
    <em>p_find.Text = "あ"</em>
    p_find.MatchFuzzy = False  <em class="comment">' ワイルドカードを利用するときはあいまい検索をオフにする</em>
    p_find.MatchWildcards = True  <em class="comment">' ワイルドカード指定で検索</em>
    <em class="comment">' 検索を実行</em>
    If p_find.Execute Then
        <em class="comment">' 見つかった文字を取得</em>
        Dim p_foundStr As String
        p_foundStr = p_range.Text
        
        <em class="comment">' 置換を実行</em>
        <em class="blue">p_range.Text = "★"</em>
    End If
End Sub
</pre>
</div>
- まずは、`ReplaceTextsInShapes`でオートシェイプの種類を特定しています。
- `ReplaceTextsInShapes`内から、`ReplaceShapeTexts`を呼び出しています。
- 上記はオートシェイプの`"あ"`という文字列を`"★"`に置換しています。

{% include goto_pagetop.html %}

* * *
## <a name="関連メモ">関連メモ</a><a class="heading-anchor-permalink" href="#関連メモ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-19" updated="2022-04-19" %}</div>
- [VBAでExcelオートシェイプ内の文字列を検索する]({% link _it_articles/vba/search_for_strings_in_excel_autoshapes.md %})

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-19" updated="2022-04-19" %}</div>
### サンプルソース
- [(language-examples) 0005_bulk_replace_in_word](https://github.com/fumokmm/language-examples/tree/main/VBA/0005_bulk_replace_in_word)

### 参考サイト
- [(いつも隣にITのお仕事) Word VBAで文字列を置換する方法！いくつかの基本パターンを徹底解説](https://tonari-it.com/word-vba-replace-replacement/)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
