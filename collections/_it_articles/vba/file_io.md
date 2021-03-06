---
title: VBAでFile I/O
article_group_id: basis-group
display_order: 30
created: 2020-11-29
updated: 2020-11-29
---
こちらはVBAでFile I/Oを行う方法のメモです。  
なお、サンプル上ではオブジェクト階層をフルで書いていますが、  
省略すると訳が分からなくなるのでサンプルではあえてそうしています。  
慣れてきたら適宜省略して下さい。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#ADODB.Streamを利用してファイルの読み込みを行う">ADODB.Streamを利用してファイルの読み込みを行う</a></li>
<li><a href="#ADODB.Streamを利用してファイルの書き込みを行う">ADODB.Streamを利用してファイルの書き込みを行う</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="ADODB.Streamを利用してファイルの読み込みを行う">ADODB.Streamを利用してファイルの読み込みを行う</a><a class="heading-anchor-permalink" href="#ADODB.Streamを利用してファイルの読み込みを行う">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-11-29" updated="2020-11-29" %}</div>
<div class="code-box">
<div class="title">読み込みサンプル1</div>
<pre>
Public Sub FileIORead1()
    <em class="comment">' [参照設定] Microsoft ActiveX Data Objects 6.1 Library</em>
    Dim p_adodbStream As ADODB.Stream
    Set p_adodbStream = New ADODB.Stream
    
    p_adodbStream.Open
    p_adodbStream.Type = <a href="https://docs.microsoft.com/en-us/sql/ado/reference/ado-api/streamtypeenum?view=sql-server-ver15">ADODB.StreamTypeEnum</a>.adTypeText
    p_adodbStream.Charset = "Shift_JIS"
    p_adodbStream.LoadFromFile "C:\temp\in.txt"
    
    Dim p_line As String
    Do Until p_adodbStream.EOS
        p_line = p_adodbStream.ReadText(<a href="https://docs.microsoft.com/en-us/sql/ado/reference/ado-api/streamreadenum?view=sql-server-ver15">ADODB.StreamReadEnum</a>.adReadLine)
        Debug.Print "[" &amp; p_line &amp; "]"
    Loop
    
    p_adodbStream.Close
End Sub
</pre>
</div>

<div class="code-box-input">
<div class="title">in.txt</div>
<pre>
abc
1234
あいうえお
</pre>
</div>

<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
[abc]
[1234]
[あいうえお]
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="ADODB.Streamを利用してファイルの書き込みを行う">ADODB.Streamを利用してファイルの書き込みを行う</a><a class="heading-anchor-permalink" href="#ADODB.Streamを利用してファイルの書き込みを行う">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-11-29" updated="2020-11-29" %}</div>
<div class="code-box">
<div class="title">書き込みサンプル1</div>
<pre>
Public Sub FileIOWrite1()
    <em class="comment">' [参照設定] Microsoft ActiveX Data Objects 6.1 Library</em>
    Dim p_adodbStream As ADODB.Stream
    Set p_adodbStream = New ADODB.Stream
    
    p_adodbStream.Open
    p_adodbStream.Type = <a href="https://docs.microsoft.com/en-us/sql/ado/reference/ado-api/streamtypeenum?view=sql-server-ver15">ADODB.StreamTypeEnum</a>.adTypeText
    p_adodbStream.Charset = "Shift_JIS"
    
    p_adodbStream.WriteText "abc", <a href="https://docs.microsoft.com/en-us/sql/ado/reference/ado-api/streamwriteenum?view=sql-server-ver15">ADODB.StreamWriteEnum</a>.adWriteLine
    p_adodbStream.WriteText "1234", <a href="https://docs.microsoft.com/en-us/sql/ado/reference/ado-api/streamwriteenum?view=sql-server-ver15">ADODB.StreamWriteEnum</a>.adWriteLine
    p_adodbStream.WriteText "あいうえお", <a href="https://docs.microsoft.com/en-us/sql/ado/reference/ado-api/streamwriteenum?view=sql-server-ver15">ADODB.StreamWriteEnum</a>.adWriteLine
   
    p_adodbStream.SaveToFile "C:\temp\out.txt", <a href="https://docs.microsoft.com/en-us/sql/ado/reference/ado-api/saveoptionsenum?view=sql-server-ver15">ADODB.SaveOptionsEnum</a>.adSaveCreateOverWrite
    p_adodbStream.Close
End Sub
</pre>
</div>

<div class="code-box-output">
<div class="title">out.txt</div>
<pre>
abc
1234
あいうえお
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-11-29" updated="2020-11-29" %}</div>
- [(SugiBlog) ADODB.Streamを使ったテキストファイルの読み書き](https://k-sugi.sakura.ne.jp/it_synthesis/windows/vb/3650/)
- [(インストラクターのネタ帳) ExcelでADO・ADODBへの参照設定を](https://www.relief.jp/docs/excel-vba-referencing-to-adodb-library.html)
- [(ExcelWork.info) テキストファイル（UTF-8）を読み込み、書き出し（ADODB.Stream）](https://excelwork.info/excel/adodbstream/)
- [(Microsoft Docs) StreamTypeEnum](https://docs.microsoft.com/en-us/sql/ado/reference/ado-api/streamtypeenum?view=sql-server-ver15)
- [(Microsoft Docs) StreamReadEnum](https://docs.microsoft.com/en-us/sql/ado/reference/ado-api/streamreadenum?view=sql-server-ver15)
- [(Microsoft Docs) StreamWriteEnum](https://docs.microsoft.com/en-us/sql/ado/reference/ado-api/streamwriteenum?view=sql-server-ver15)
- [(Microsoft Docs) SaveOptionsEnum](https://docs.microsoft.com/en-us/sql/ado/reference/ado-api/saveoptionsenum?view=sql-server-ver15)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
