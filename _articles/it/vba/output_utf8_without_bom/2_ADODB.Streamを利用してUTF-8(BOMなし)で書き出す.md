---
chapter_no: 2
chapter_title: ADODB.Streamを利用してUTF-8(BOMなし)で書き出す
created: 2021-06-24
updated: 2021-06-24
---
`UTF-8`の`BOM`は`0xEF`,`0xBB`,`0xBF`という3バイトの並びがファイルの先頭に付いているものなので、これを除去できれば`BOMなし`にできます。  
ということで、基本的には、`UTF-8 BOM付き`で出力する内容の書き込みをする部分まで行った後に、  
先頭のBOM部分の3バイトを除去する処理を追加することで、`UTF-8 BOMなし`で書き出すことを実現しています。

```:UTF-8(BOMなし)で書き出す
Sub output_utf8_2()
    {em:comment{' [参照設定] Microsoft ActiveX Data Objects 6.1 Library}em}
    Dim p_stream As ADODB.Stream
    Set p_stream = New ADODB.Stream
    
    {em:comment{' 初期設定}em}
    With p_stream
        {em{.Charset = "UTF-8"}em} {em:comment{' これだけだと UTF-8BOM付き になる…}em}
        .Type = ADODB.StreamTypeEnum.adTypeText
        .LineSeparator = LineSeparatorEnum.adLF
    End With
    
    {em:comment{' 書き込み}em}
    With p_stream
        .Open
        .WriteText "abc", ADODB.StreamWriteEnum.adWriteLine
        .WriteText "1234", ADODB.StreamWriteEnum.adWriteLine
        .WriteText "あいうえお", ADODB.StreamWriteEnum.adWriteLine

        {em:comment{' ---------- ここから ----------}em}

        {em:comment{' タイプをバイナリにして、先頭の3バイトをスキップ}em}
        {em{.Position = 0
        .Type = ADODB.StreamTypeEnum.adTypeBinary}em} {em:comment{' タイプ変更するにはPosition = 0である必要がある}em}
        {em{.Position = 3}em}
        {em:comment{' 一時格納用}em}
        {em{Dim p_byteData() As Byte
        p_byteData = .Read
        .Close}em} {em:comment{' 一旦閉じて}em}
        {em{.Open}em} {em:comment{' 再度開いて}em}
        {em{.Write p_byteData}em} {em:comment{' ストリームに書き込む}em}

        {em:comment{' ---------- ここまで を追加 ----------}em}
        
        .SaveToFile "C:\temp\UTF-8BOMなし.txt", ADODB.SaveOptionsEnum.adSaveCreateOverWrite
        .Close
    End With
End Sub
```

### 出力結果
<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20210624/20210624014259.png)
</p>
