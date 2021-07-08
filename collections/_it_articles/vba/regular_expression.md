---
title: VBAで正規表現を使う
article_group_id: basis-group
display_order: 35
created: 2021-07-08
updated: 2021-07-08
---
こちらはVBAで正規表現を使う方法のメモです。  

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#グループマッチした部分文字列の取り出し">グループマッチした部分文字列の取り出し</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="グループマッチした部分文字列の取り出し">グループマッチした部分文字列の取り出し</a><a class="heading-anchor-permalink" href="#グループマッチした部分文字列の取り出し">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-08" updated="2021-07-08" %}</div>

<div class="code-box no-title">
<pre>
<em class="comment">' [参照設定] Microsoft VBScript Regular Expressions 5.5</em>

Public Function searchCCC(rng As Range) As String
    Dim re As RegExp
    Set re = New RegExp
    With re
        .Pattern = "^【(.+)】(.+)_(.+)_(.+)$"
        .IgnoreCase = False
        .Global = True
        Dim reMatch As Object
        Set reMatch = .Execute(rng)
        If reMatch.Count &gt; 0 Then
            If reMatch(0).SubMatches.Count &gt; 0 Then
                searchCCC = reMatch(0).SubMatches(2)
                Exit Function
            End If
        End If
    End With
    searchCCC = "Not Found."
End Function
</pre>
</div>
### 解説
こちら、参照設定で`Microsoft VBScript Regular Expressions 5.5`が必要となります。  
正規表現パターンは正規表現オブジェクト(`RegExp`)の`obj.Pattern`プロパティにて設定します。  

### 部分一致した部分文字列の取得について
正規表現オブジェクト(`RegExp`)の`obj.Execute`した結果、マッチオブジェクトが返ってくるので、`.Count`にて件数を確認し、`.SubMatches`にて取得します。

### デモ
<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20210708/20210708084455.png)
</p>

### ソース
- [(language-examples) 0003_RegularExpression](https://github.com/fumokmm/language-examples/tree/main/VBA/0003_RegularExpression)

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-08" updated="2021-07-08" %}</div>
- [(小粋空間) Excel VBAで正規表現のグループ化を使ってマッチ文字列を取得する](https://www.koikikukan.com/archives/2014/02/12-015555.php)
- [(Office TANAKA) 正規表現によるマッチング](http://officetanaka.net/excel/vba/tips/tips38.htm)
- [(CodeZine) VBAで正規表現を使う](https://codezine.jp/article/detail/1655)
- [(ExcelWork.info) VBA で正規表現を使う（RegExp オブジェクト）](https://excelwork.info/excel/vbaregexp/)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
