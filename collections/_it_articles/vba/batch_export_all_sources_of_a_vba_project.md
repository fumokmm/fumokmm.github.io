---
title: VBAプロジェクトの全ソースを一括エクスポートする
display_order: 70
created: 2020-05-04
updated: 2021-05-19
---
当メモは2020-05-04に[投稿されたもの](https://npnl.hatenablog.jp/entry/2020/05/04/185054)を加筆修正し、再掲したものです。  

## <a name="index">目次</a><a href="#目次">§</a>

<ul id="index_ul">
<li><a href="#はじめに">はじめに</a></li>
<li><a href="#想定読者">想定読者</a></li>
<li><a href="#準備">準備</a></li>
<li><a href="#方法">方法</a></li>
<li><a href="#信頼性に欠けるというエラーが出た場合は？">信頼性に欠けるというエラーが出た場合は？</a></li>
<li><a href="#まとめ">まとめ</a></li>
<li><a href="#reference">参考</a></li>
</ul>

* * *
## <a name="はじめに">はじめに</a><a href="#はじめに">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-05-04" updated="2021-05-19" %}</div>
VBAプロジェクトのソースって、他のJavaやCなどのプログラミング言語と違って、ExcelやAccessでVisual Studio Editor(VBE)をわざわざ開かないと閲覧・編集できないし、バージョン管理もしづらいですよね。  
そんなとき、ソースを右クリックし「ファイルのエクスポート」をすることができますが、これがファイル単位でしか行えないから非常に不便、みなさんそんな風に感じませんか？そこで、この記事では、そんな悩み多きVBAプロジェクトで、全ソースを一括でエクスポートする方法をご紹介します。

なお、この記事ではExcelを例にご紹介しています。Accessなどでも同様のことを行いたい場合は少しの修正で対応が可能になると思います。

{% include goto_pagetop.html %}

* * *
## <a name="想定読者">想定読者</a><a href="#想定読者">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-05-04" updated="2021-05-19" %}</div>
この記事はある程度VBAのスキルがある読者を想定しています。少なくてもVBAプロジェクトのソースをエクスポートして、ソース管理したいな・・・と思えるくらいの人を想定しています。

{% include goto_pagetop.html %}

* * *
## <a name="準備">準備</a><a href="#準備">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-05-04" updated="2021-05-19" %}</div>
まずはVBAプロジェクトの下準備が必要です。具体的には以下の参照設定にチェックが付けられているか確認して下さい。
- Microsoft Visual Basic for Applications Extensibility 5.3
- Microsoft Scripting Runtime

<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20200504/20200504182529.png)  
（Microsoft Visual Basic for Applications Extensibility 5.3への参照設定にチェックを付ける）
</p>

<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20200504/20200504182726.png)  
（Microsoft Scripting Runtimeへの参照設定にチェックを付ける）
</p>

{% include goto_pagetop.html %}

* * *
## <a name="方法">方法</a><a href="#方法">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-05-04" updated="2021-05-19" %}</div>
- １．まずVBEを開きます。(`Alt + F11`)
- ２．標準モジュールで新規モジュールを作成します。例では`ExportModule`という名前で作成しました。(名前は任意)

<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20200504/20200504183504.png)
</p>

### ソースはこちら
<div class="code-box">
<div class="title">ExportModule</div>
<pre>
Option Explicit

Sub ExportMacroSource()
    ' [参照設定] Microsoft Visual Basic for Applications Extensibility 必要
    ' [参照設定] Microsoft Scripting Rungime 必要

    Dim p_fso As Scripting.FileSystemObject
    Set p_fso = New Scripting.FileSystemObject
    
    Dim p_macroDir As String
    p_macroDir = p_fso.BuildPath(Application.ActiveWorkbook.Path, "MacroSource")
    If Not p_fso.FolderExists(p_macroDir) Then
        p_fso.CreateFolder p_macroDir
    End If

    Dim p_vbComp As VBIDE.VBComponent
    Dim p_typeLabel As String
    Dim p_extension As String
    Dim p_outputFileName As String
    For Each p_vbComp In Application.VBE.ActiveVBProject.VBComponents
        ' タイプから拡張子を特定
        Select Case p_vbComp.Type
            Case vbext_ct_ActiveXDesigner
                p_typeLabel = "ActiveXDesigner"
                p_extension = "cls"
            
            Case vbext_ct_ClassModule
                p_typeLabel = "ClassModule"
                p_extension = "cls"
            
            Case vbext_ct_Document
                p_typeLabel = "Document"
                p_extension = "cls"
            
            Case vbext_ct_MSForm
                p_typeLabel = "MSForm"
                p_extension = "frm"
            
            Case vbext_ct_StdModule
                p_typeLabel = "StdModule"
                p_extension = "bas"
        End Select
    
        ' エクスポート実施
        p_outputFileName = p_fso.BuildPath(p_macroDir, p_vbComp.Name & "." & p_extension)
        Debug.Print "[export] " & p_outputFileName
        p_vbComp.Export Filename:=p_outputFileName
     
    Next p_vbComp
    
    Debug.Print "Finish export."

End Sub
</pre>
</div>

- ３．`ExportModule`を開いているエディタ上で、`F5`をクリック (実行)します。
- ４．イミディエイトウィンドウにも出力結果が出力されます。

<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20200504/20200504184452.png)  
（イミディエイトウィンドウの出力結果）
</p>

- ５．Excelファイルが置いてあるパスと同じパスに「MacroSource」というフォルダが作成されVBAプロジェクトの全ソースが一括エクスポートされます。

<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20200504/20200504184612.png)
</p>

注意として、２回出力するとソースは上書きされますのでご注意下さい。 あとは、お好きなソース管理システムにコミットして下さい。


{% include goto_pagetop.html %}

* * *
## <a name="信頼性に欠けるというエラーが出た場合は？">信頼性に欠けるというエラーが出た場合は？</a><a href="#信頼性に欠けるというエラーが出た場合は？">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-05-04" updated="2021-05-19" %}</div>
実行時に「信頼性に欠ける」というエラーが出た場合、「開発者向けのマクロ設定」の「VBA プロジェクト オブジェクト モデルへのアクセスを信頼する」のチェックボックスにチェックを付けてから実行してみて下さい。

<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20200504/20200504184101.png)  
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20200504/20200504184134.png)  
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20200504/20200504184150.png)  
</p>

{% include goto_pagetop.html %}

* * *
## <a name="まとめ">まとめ</a><a href="#まとめ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-05-04" updated="2021-05-19" %}</div>
ここではVBAプロジェクトで、全ソースを一括でエクスポートする方法をご紹介しました。 アドインにするなどすればもっと便利にできると思いますが、サクっと一括エクスポートできる環境を整えたい場合には、ぜひ今回ご紹介した方法を利用してみて下さいね！

{% include goto_pagetop.html %}

* * *
## <a name="reference">参考</a><a href="#reference">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-05-04" updated="2021-05-19" %}</div>
### 元記事
- [(No Programming, No Life) 【VBA】VBAプロジェクトの全ソースを一括エクスポートする](https://npnl.hatenablog.jp/entry/2020/05/04/185054)

### 参考
- [(mofu犬blog) MS Access のVBAモジュールを全てエクスポート](http://mofuken.blogspot.com/2014/06/ms-access-vba.html)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
