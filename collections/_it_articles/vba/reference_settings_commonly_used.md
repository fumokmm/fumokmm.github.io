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
<li><a href="#RegExp">RegExp</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="FileSystemObject">FileSystemObject</a><a class="heading-anchor-permalink" href="#FileSystemObject">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-01" updated="2021-12-09" %}</div>
みんな大好き`FileSystemObject`です。ファイルやディレクトリ操作のモジュールです。

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
DB操作したり、テキスト操作したりするモジュールです。

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
## <a name="RegExp">RegExp</a><a class="heading-anchor-permalink" href="#RegExp">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-09" updated="2021-12-09" %}</div>
正規表現モジュールです。

### 必要となる参照設定
<div class="code-box-syntax no-title">
<pre>
Microsoft VBScript Regular Expressions 5.5
</pre>
</div>

### 使用例
<div class="code-box">
<div class="title">参照設定している場合</div>
<pre>
Dim p_re As <em>VBScript_RegExp_55.RegExp</em>
Set p_re = New <em>VBScript_RegExp_55.RegExp</em>
</pre>
</div>
参照設定していない場合は、`CreateObject`を使って生成します。
<div class="code-box">
<div class="title">参照設定していない場合</div>
<pre>
Dim p_re As Object
Set p_re = CreateObject(<em>"VBScript.RegExp"</em>)
</pre>
</div>

### 参考サイト
- [(Qiita) VBAの正規表現の参照設定の5.5 と 1.0の違い](https://qiita.com/Q11Q/items/56db596629a124f94b7e)
- [(侍エンジニアブログ)【VBA入門】正規表現で文字列を抽出、置換する方法(RegExp)](https://www.sejuku.net/blog/33541)

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-01" updated="2021-12-01" %}</div>
### 参考サイト
- [(ExcelWork.info) テキストファイル（UTF-8）を読み込み、書き出し（ADODB.Stream）](https://excelwork.info/excel/adodbstream/)
- [(Qiita) VBAの正規表現の参照設定の5.5 と 1.0の違い](https://qiita.com/Q11Q/items/56db596629a124f94b7e)
- [(インストラクターのネタ帳) ExcelでADO・ADODBへの参照設定を](https://www.relief.jp/docs/excel-vba-referencing-to-adodb-library.html)
- [(インストラクターのネタ帳) FileSystemObjectの参照設定を行う](https://www.relief.jp/docs/fso-vba-references.html)
- [(侍エンジニアブログ)【VBA入門】正規表現で文字列を抽出、置換する方法(RegExp)](https://www.sejuku.net/blog/33541)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
