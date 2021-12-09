---
title: VBAでよく使う参照設定
article_group_id: reverse-lookup-group
display_order: 80
created: 2021-12-01
updated: 2021-12-09
---
こちらはVBAでよく使う参照設定のメモです。  

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#FileSystemObject">FileSystemObject</a></li>
<li><a href="#ADODB">ADODB</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="FileSystemObject">FileSystemObject</a><a class="heading-anchor-permalink" href="#FileSystemObject">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-01" updated="2021-12-01" %}</div>
みんな大好き`FileSystemObject`です。  

### 必要となる参照設定
<div class="code-box-syntax no-title">
<pre>
Microsoft Scripting Runtime
</pre>
</div>
- `Microsoft Scripting Runtime`を参照設定に追加しておくと、`VBA.Collection`や`Scripting.Dictionary`も使えるようになります。

### 使用例
<div class="code-box">
<div class="title">参照設定している場合</div>
<pre>
Dim p_fso As <em>Scripting.FileSystemObject</em>
Set p_fso = New <em>Scripting.FileSystemObject</em>
</pre>
</div>
参照設定していない場合は、`CreateObject`を使って生成します。
<div class="code-box">
<div class="title">参照設定していない場合</div>
<pre>
Dim p_fso As Object
Set p_fso = CreateObject(<em>"Scripting.FileSystemObject"</em>)
</pre>
</div>

### 参考サイト
- [(インストラクターのネタ帳) FileSystemObjectの参照設定を行う](https://www.relief.jp/docs/fso-vba-references.html)

{% include goto_pagetop.html %}

* * *
## <a name="ADODB">ADODB</a><a class="heading-anchor-permalink" href="#ADODB">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-09" updated="2021-12-09" %}</div>
### 必要となる参照設定
<div class="code-box-syntax no-title">
<pre>
Microsoft ActiveX Data Objects x.x Library
</pre>
</div>

### 使用例 (ADODB.Stream)
<div class="code-box">
<div class="title">参照設定している場合</div>
<pre>
Dim p_stream As <em>ADODB.Stream</em>
Set p_stream = New <em>ADODB.Stream</em>
</pre>
</div>
参照設定していない場合は、`CreateObject`を使って生成します。
<div class="code-box">
<div class="title">参照設定していない場合</div>
<pre>
Dim p_stream As Object
Set p_stream = CreateObject(<em>"ADODB.Stream"</em>)
</pre>
</div>

### 参考サイト
- [(インストラクターのネタ帳) ExcelでADO・ADODBへの参照設定を](https://www.relief.jp/docs/excel-vba-referencing-to-adodb-library.html)
- [(ExcelWork.info) テキストファイル（UTF-8）を読み込み、書き出し（ADODB.Stream）](https://excelwork.info/excel/adodbstream/)

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-01" updated="2021-12-01" %}</div>
### 参考サイト
- [(ExcelWork.info) テキストファイル（UTF-8）を読み込み、書き出し（ADODB.Stream）](https://excelwork.info/excel/adodbstream/)
- [(インストラクターのネタ帳) ExcelでADO・ADODBへの参照設定を](https://www.relief.jp/docs/excel-vba-referencing-to-adodb-library.html)
- [(インストラクターのネタ帳) FileSystemObjectの参照設定を行う](https://www.relief.jp/docs/fso-vba-references.html)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
