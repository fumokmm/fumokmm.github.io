---
chapter_no: 2
chapter_title: ADODB.Streamを利用してファイルの書き込みを行う
created: 2020-11-29
updated: 2020-11-29
---
```:書き込みサンプル1
Public Sub FileIOWrite1()
    {em:comment{' [参照設定] Microsoft ActiveX Data Objects 6.1 Library}em}
    Dim p_adodbStream As ADODB.Stream
    Set p_adodbStream = New ADODB.Stream
    
    p_adodbStream.Open
    p_adodbStream.Type = {link:https://docs.microsoft.com/en-us/sql/ado/reference/ado-api/streamtypeenum?view=sql-server-ver15{ADODB.StreamTypeEnum}link}.adTypeText
    p_adodbStream.Charset = "Shift_JIS"
    
    p_adodbStream.WriteText "abc", {link:https://docs.microsoft.com/en-us/sql/ado/reference/ado-api/streamwriteenum?view=sql-server-ver15{ADODB.StreamWriteEnum}link}.adWriteLine
    p_adodbStream.WriteText "1234", {link:https://docs.microsoft.com/en-us/sql/ado/reference/ado-api/streamwriteenum?view=sql-server-ver15{ADODB.StreamWriteEnum}link}.adWriteLine
    p_adodbStream.WriteText "あいうえお", {link:https://docs.microsoft.com/en-us/sql/ado/reference/ado-api/streamwriteenum?view=sql-server-ver15{ADODB.StreamWriteEnum}link}.adWriteLine
   
    p_adodbStream.SaveToFile "C:\temp\out.txt", {link:https://docs.microsoft.com/en-us/sql/ado/reference/ado-api/saveoptionsenum?view=sql-server-ver15{ADODB.SaveOptionsEnum}link}.adSaveCreateOverWrite
    p_adodbStream.Close
End Sub
```

```output:out.txt
abc
1234
あいうえお
```
