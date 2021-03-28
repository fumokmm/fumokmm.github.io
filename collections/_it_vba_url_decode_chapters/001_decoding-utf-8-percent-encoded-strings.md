---
chapter_no: 001
chapter_id: decoding-utf-8-percent-encoded-strings
chapter_title: UTF-8でパーセントエンコードされた文字列をデコードする(簡易版)
created: 2019-12-16
updated: 2021-03-29
---
当メモは2019-12-16に[投稿されたもの](https://npnl.hatenablog.jp/entry/2019/12/16/193140)を加筆修正し、再掲したものです。

Excel VBAでUTF-8でパーセントエンコードされた文字列をデコードする必要があり、ちょっと調べてみたらADODB.Streamを使うと出来そうだったのでやってみた。

### 環境
Windows 10 (バージョン 1903) 64bit
Excel Office365 MSO (16.0.12228.20322) 64bit

### コード
<div class="code-box">
<div class="title">PercentDecode</div>
<pre>
Option Explicit

'''
' UTF-8でパーセントエンコードされた文字列をデコードします
'
' @param percentEncodedStr UTF-8でパーセントエンコードされた文字列
' @return デコードした文字列
'
' ※ADODB.Streamを利用するため、ツール &gt; 参照設定で
' 「Microsoft ActiveX Data Objects 6.1 Library」を追加してください。
'
Public Function PercentDecode(percentEncodedStr As String) As String
  ' 空文字なら空文字を返却
  If IsEmpty(percentEncodedStr) Then
    PercentDecode = ""
    Exit Function
  End If

  ' ストリームをオープン
  Dim objStm As ADODB.Stream
  Set objStm = New ADODB.Stream
  objStm.Open
  
  ' ストリームをリセット
  objStm.Position = 0
  objStm.SetEOS
  
  ' バイナリを書き込み
  objStm.Type = ADODB.adTypeBinary
  objStm.Write ToHexBytes(percentEncodedStr)
  
  ' UTF-8でテキスト読み込み
  objStm.Position = 0
  objStm.Type = ADODB.adTypeText
  objStm.Charset = "UTF-8"
  PercentDecode = objStm.ReadText() ' 結果返却
  
  ' ストリームをクローズ
  objStm.Close
  Set objStm = Nothing
End Function

'''
' UTF-8でパーセントエンコードされた文字列をバイト配列に変換します
'
' @param percentEncodedStr UTF-8でパーセントエンコードされた文字列
' @return バイト配列
'
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
PercentDecodeがパブリック関数になっているので、こちらをExcelの数式などとして利用するだけ。引数はパーセントエンコードされた文字列を受け取り、戻り値はデコードした文字列となる。

### デモ
f:id:fumokmm:20191216192520g:plain
注意
なお、すべての文字が3バイトにパーセントエンコードされていた場合しか想定していません。また、例外処理なども省略しています。あくまでテスト用ということで利用する際はもうちょっとアレンジが必要。

参考