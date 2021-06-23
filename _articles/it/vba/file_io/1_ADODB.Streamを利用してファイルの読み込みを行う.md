---
chapter_no: 1
chapter_title: ADODB.Streamを利用してファイルの読み込みを行う
created: 2020-11-29
updated: 2020-11-29
---
```:読み込みサンプル1
Public Sub FileIORead1()
    {em:comment{' [参照設定] Microsoft ActiveX Data Objects 6.1 Library}em}
    Dim p_adodbStream As ADODB.Stream
    Set p_adodbStream = New ADODB.Stream
    
    p_adodbStream.Open
    p_adodbStream.Type = {link:https://docs.microsoft.com/en-us/sql/ado/reference/ado-api/streamtypeenum?view=sql-server-ver15{ADODB.StreamTypeEnum}link}.adTypeText
    p_adodbStream.Charset = "Shift_JIS"
    p_adodbStream.LoadFromFile "C:\temp\in.txt"
    
    Dim p_line As String
    Do Until p_adodbStream.EOS
        p_line = p_adodbStream.ReadText({link:https://docs.microsoft.com/en-us/sql/ado/reference/ado-api/streamreadenum?view=sql-server-ver15{ADODB.StreamReadEnum}link}.adReadLine)
        Debug.Print "[" & p_line & "]"
    Loop
    
    p_adodbStream.Close
End Sub
```

```input:in.txt
abc
1234
あいうえお
```

```output:出力結果
[abc]
[1234]
[あいうえお]
```