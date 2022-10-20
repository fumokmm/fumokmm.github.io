---
title: VBAでテキストファイルをUTF-8(BOMなし)で書き出す
article_group_id: reverse-lookup-group
display_order: 60
created: 2021-06-24
updated: 2021-06-24
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#ADODB.Streamを利用して普通にやるとUTF-8(BOM付き)になってしまう">ADODB.Streamを利用して普通にやるとUTF-8(BOM付き)になってしまう</a></li>
<li><a href="#ADODB.Streamを利用してUTF-8(BOMなし)で書き出す">ADODB.Streamを利用してUTF-8(BOMなし)で書き出す</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="ADODB.Streamを利用して普通にやるとUTF-8(BOM付き)になってしまう">ADODB.Streamを利用して普通にやるとUTF-8(BOM付き)になってしまう</a><a class="heading-anchor-permalink" href="#ADODB.Streamを利用して普通にやるとUTF-8(BOM付き)になってしまう">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-24" updated="2021-06-24" %}</div>
`ADODB.Stream`では、`Charset`プロパティで文字コードを指定できるのですが、これを`UTF-8`と指定しても`UTF-8 BOM付き`となってしまいます。  
以下は`UTF-8 BOM付き`で書き出されてしまうサンプルコードです。

<div class="code-box">
<div class="title">UTF-8(BOM付き)で書き出されてしまう</div>
<div class="copy-button">Copy</div>
<pre>
Sub output_utf8_1()
    <em class="comment">' [参照設定] Microsoft ActiveX Data Objects 6.1 Library</em>
    Dim p_stream As ADODB.Stream
    Set p_stream = New ADODB.Stream
    
    ' 初期設定
    With p_stream
        <em>.Charset = "UTF-8"</em> <em class="comment">' これだけだと UTF-8BOM付き になる…</em>
        .Type = ADODB.StreamTypeEnum.adTypeText
        .LineSeparator = LineSeparatorEnum.adLF
    End With
    
    ' 書き込み
    With p_stream
        .Open
        .WriteText "abc", ADODB.StreamWriteEnum.adWriteLine
        .WriteText "1234", ADODB.StreamWriteEnum.adWriteLine
        .WriteText "あいうえお", ADODB.StreamWriteEnum.adWriteLine
        .SaveToFile "C:\temp\UTF-8BOM付き.txt", ADODB.SaveOptionsEnum.adSaveCreateOverWrite
        .Close
    End With
End Sub
</pre>
</div>

### 出力結果
<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20210624/20210624014303.png)
</p>

{% include goto_pagetop.html %}

* * *
## <a name="ADODB.Streamを利用してUTF-8(BOMなし)で書き出す">ADODB.Streamを利用してUTF-8(BOMなし)で書き出す</a><a class="heading-anchor-permalink" href="#ADODB.Streamを利用してUTF-8(BOMなし)で書き出す">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-24" updated="2021-06-24" %}</div>
`UTF-8`の`BOM`は`0xEF`,`0xBB`,`0xBF`という3バイトの並びがファイルの先頭に付いているものなので、これを除去できれば`BOMなし`にできます。  
ということで、基本的には、`UTF-8 BOM付き`で出力する内容の書き込みをする部分まで行った後に、  
先頭のBOM部分の3バイトを除去する処理を追加することで、`UTF-8 BOMなし`で書き出すことを実現しています。

<div class="code-box">
<div class="title">UTF-8(BOMなし)で書き出す</div>
<div class="copy-button">Copy</div>
<pre>
Sub output_utf8_2()
    <em class="comment">' [参照設定] Microsoft ActiveX Data Objects 6.1 Library</em>
    Dim p_stream As ADODB.Stream
    Set p_stream = New ADODB.Stream
    
    <em class="comment">' 初期設定</em>
    With p_stream
        <em>.Charset = "UTF-8"</em> <em class="comment">' これだけだと UTF-8BOM付き になる…</em>
        .Type = ADODB.StreamTypeEnum.adTypeText
        .LineSeparator = LineSeparatorEnum.adLF
    End With
    
    <em class="comment">' 書き込み</em>
    With p_stream
        .Open
        .WriteText "abc", ADODB.StreamWriteEnum.adWriteLine
        .WriteText "1234", ADODB.StreamWriteEnum.adWriteLine
        .WriteText "あいうえお", ADODB.StreamWriteEnum.adWriteLine

        <em class="comment">' ---------- ここから ----------</em>

        <em class="comment">' タイプをバイナリにして、先頭の3バイトをスキップ</em>
        <em>.Position = 0
        .Type = ADODB.StreamTypeEnum.adTypeBinary</em> <em class="comment">' タイプ変更するにはPosition = 0である必要がある</em>
        <em>.Position = 3</em>
        <em class="comment">' 一時格納用</em>
        <em>Dim p_byteData() As Byte
        p_byteData = .Read
        .Close</em> <em class="comment">' 一旦閉じて</em>
        <em>.Open</em> <em class="comment">' 再度開いて</em>
        <em>.Write p_byteData</em> <em class="comment">' ストリームに書き込む</em>

        <em class="comment">' ---------- ここまで を追加 ----------</em>
        
        .SaveToFile "C:\temp\UTF-8BOMなし.txt", ADODB.SaveOptionsEnum.adSaveCreateOverWrite
        .Close
    End With
End Sub
</pre>
</div>

### 出力結果
<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20210624/20210624014259.png)
</p>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-06-24" updated="2021-06-24" %}</div>
### 参考
- [(いつも隣にITのお仕事) エクセルVBAでBOM無しのUTF-8でCSVファイルなどを出力する方法](https://tonari-it.com/excel-vba-utf8n-bom/)
- [(Wikipedia) Byte order mark - UTF-8](https://en.wikipedia.org/wiki/Byte_order_mark#UTF-8)

### ソース
- [(language-examples) VBA](https://github.com/fumokmm/language-examples/tree/main/VBA)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
