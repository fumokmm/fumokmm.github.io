---
chapter_no: 001
chapter_id: procedure-calls
chapter_title: プロシージャ呼び出し
created: 2021-04-08
updated: 2021-04-08
---
まずは用語です。

<table class="normal">
	<tr>
		<th markdown="span">プロシージャ</th>
		<th markdown="span">説明</th>
	</tr>
	<tr>
		<td markdown="span">Subプロシージャ</td>
		<td markdown="span">戻り値なしの処理を宣言するときに使う</td>
	</tr>
	<tr>
		<td markdown="span">Functionプロシージャ</td>
		<td markdown="span">戻り値ありの処理を宣言するときに使う</td>
	</tr>
</table>

<div class="code-box">
<div class="title">サンプルコード</div>
<pre>
<em class="comment">' プロシージャを定義する</em>
Sub sub0()
Sub sub1(s1 As String)
Sub sub2(s1 As String, s2 As String)
Function func0() As String
Function func1(s1 As String) As String
Function func2(s1 As String, s2 As String) As String

<em class="comment">' 呼び出し</em>

sub0
sub1 "a"
sub2 "a", "b"

<em class="comment">' これはNG(括弧を付けたい場合は、頭にCallがいる)
' sub0()
' sub1("a")
' sub2("a", "b")</em>

<em class="comment">' 括弧を付けたい場合は、頭にCallを付ける</em>
Call sub0() <em class="comment">' → 自動フォーマッターで、Call sub0 にされてしまう…</em>
Call sub0
Call sub1("a")
Call sub2("a", "b")

Dim res As String
res = func0
res = func0() <em class="comment">' → 戻り値ありの場合は、引数が0個の場合、括弧を付けても付けなくてもよい</em>
res = func1("a")
res = func2("a", "b")

<em class="comment">' これはNG(戻り値ありの場合は、Callは付けられない)
' Call res = func0
' Call res = func0()
' Call res = func1("a")
' Call res = func2("a", "b")</em>
</pre>
</div>
