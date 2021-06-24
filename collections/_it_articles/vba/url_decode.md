---
title: VBAでURLデコード
article_group_id: reverse-lookup
display_order: 50
created: 2021-03-29
updated: 2021-03-29
---
こちらはVBAでURLデコードを行う方法についてのメモです。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#decoding-utf-8-percent-encoded-strings">UTF-8でパーセントエンコードされた文字列をデコードする(簡易版)</a></li>
</ul>

* * *
## <a name="decoding-utf-8-percent-encoded-strings">UTF-8でパーセントエンコードされた文字列をデコードする(簡易版)</a><a class="heading-anchor-permalink" href="#decoding-utf-8-percent-encoded-strings">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2019-12-16" updated="2021-03-29" %}</div>
当メモは2019-12-16に[投稿されたもの](https://npnl.hatenablog.jp/entry/2019/12/16/193140)を加筆修正し、再掲したものです。

Excel VBAでUTF-8でパーセントエンコードされた文字列をデコードする必要があり、  
ちょっと調べてみたら`ADODB.Stream`を使うと出来そうだったのでやってみた。

### 環境
- Windows 10 (バージョン 1903) 64bit
- Excel Office365 MSO (16.0.12228.20322) 64bit

### コード
<div class="code-box">
<div class="title">PercentDecode</div>
<pre>
Option Explicit

<em class="comment">'''
' UTF-8でパーセントエンコードされた文字列をデコードします
'
' @param percentEncodedStr UTF-8でパーセントエンコードされた文字列
' @return デコードした文字列
'
' ※ADODB.Streamを利用するため、ツール &gt; 参照設定で
' 「Microsoft ActiveX Data Objects 6.1 Library」を追加してください。
'</em>
Public Function PercentDecode(percentEncodedStr As String) As String
  <em class="comment">' 空文字なら空文字を返却</em>
  If IsEmpty(percentEncodedStr) Then
    PercentDecode = ""
    Exit Function
  End If

  <em class="comment">' ストリームをオープン</em>
  Dim objStm As ADODB.Stream
  Set objStm = New ADODB.Stream
  objStm.Open
  
  <em class="comment">' ストリームをリセット</em>
  objStm.Position = 0
  objStm.SetEOS
  
  <em class="comment">' バイナリを書き込み</em>
  objStm.Type = ADODB.adTypeBinary
  objStm.Write ToHexBytes(percentEncodedStr)
  
  <em class="comment">' UTF-8でテキスト読み込み</em>
  objStm.Position = 0
  objStm.Type = ADODB.adTypeText
  objStm.Charset = "UTF-8"
  PercentDecode = objStm.ReadText() <em class="comment">' 結果返却</em>
  
  <em class="comment">' ストリームをクローズ</em>
  objStm.Close
  Set objStm = Nothing
End Function

<em class="comment">'''
' UTF-8でパーセントエンコードされた文字列をバイト配列に変換します
'
' @param percentEncodedStr UTF-8でパーセントエンコードされた文字列
' @return バイト配列
'</em>
Private Function ToHexBytes(percentEncodedStr As String) As Byte()
  Dim size As Long
  size = Len(percentEncodedStr) / 3
  
  Dim bytes() As Byte
  ReDim bytes(0 To size - 1)
  Dim i As Long
  For i = 0 To size - 1
    bytes(i) = Val("&amp;H" &amp; Mid(percentEncodedStr, (i * 3) + 2, 2))
  Next i

  ToHexBytes = bytes
End Function
</pre>
</div>

### 使い方
`PercentDecode`がパブリック関数になっているので、こちらをExcelの数式などとして利用するだけです。  
引数はパーセントエンコードされた文字列を受け取り、戻り値はデコードした文字列となります。

### デモ
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20191216/20191216192520.gif)

### 注意
なお、すべての文字が3バイトにパーセントエンコードされていた場合しか想定していません。  
また、例外処理なども省略しています。あくまでテスト用ということで利用する際はもうちょっとアレンジが必要です。  
利用される際はご注意下さい。

### 参考
- [(hakeの日記) EXCEL VBAメモ - UTF-8バイト列を文字に変換する](https://hake.hatenablog.com/entry/20161117/p1)
- [(Non Soft) ADODB.Streamによる文字コード変換のサンプル(VB6)](http://nonsoft.la.coocan.jp/SoftSample/SampleModADOS.html)
- [(インストラクターのネタ帳) URLデコードを行う](https://www.relief.jp/docs/003799.html)

### 元記事
- [元記事](https://npnl.hatenablog.jp/entry/2019/12/16/193140)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
