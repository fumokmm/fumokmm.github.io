---
chapter_no: 1
chapter_title: ADODB.Streamを利用して普通にやるとUTF-8(BOM付き)になってしまう
created: 2021-06-24
updated: 2021-06-24
---
`ADODB.Stream`では、`Charset`プロパティで文字コードを指定できるのですが、これを`UTF-8`と指定しても`UTF-8 BOM付き`となってしまいます。  
以下は`UTF-8 BOM付き`で書き出されてしまうサンプルコードです。

```:UTF-8(BOM付き)で書き出されてしまう
Sub output_utf8_1()
    {em:comment{' [参照設定] Microsoft ActiveX Data Objects 6.1 Library}em}
    Dim p_stream As ADODB.Stream
    Set p_stream = New ADODB.Stream
    
    ' 初期設定
    With p_stream
        {em{.Charset = "UTF-8"}em} {em:comment{' これだけだと UTF-8BOM付き になる…}em}
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
```

### 出力結果
<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20210624/20210624014303.png)
</p>
