---
title: VBAでプロシージャ呼び出し時の括弧について
display_order: 60
created: 2021-04-07
updated: 2021-04-07
---
VBAでプロシージャ呼び出し時、括弧を付けなければいけなかったり、付けなくても大丈夫だったりと分かりづらいのでまとめました。

## <a name="index">目次</a>

<ul id="index_ul">
<li><a href="#procedure-calls">プロシージャ呼び出し</a></li>
<li><a href="#summary">まとめ</a></li>
<li><a href="#reference">参考</a></li>
</ul>

* * *
## <a name="procedure-calls">プロシージャ呼び出し</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-04-07" updated="2021-04-07" %}</div>
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

{% include goto_pagetop.html %}

* * *
## <a name="summary">まとめ</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-04-07" updated="2021-04-07" %}</div>
### 戻り値なしの時
- 戻り値なしの時は、基本的には括弧を省略する。
- 戻り値なしの時にも括弧を使いたい場合は、頭にCallを付ける。
- ただし、頭にCallを付けると、引数がない場合場合を除き、基本的には括弧が必要になるので注意。

### 戻り値ありの時
- 戻り値ありの時には、基本的に括弧は省略できない。(括弧は必須)
- ただし、引数がなしの場合に限り括弧を省略できる。(括弧を付けてもよい)
- 逆に、戻り値ありの時にはCallは使えない。(使わない) (一部例外あり)
  - 例外: Call 構文を使用して、ネイティブまたはユーザー定義の関数を呼び出す場合、関数の戻り値は破棄されます。

### スタイルの使い分け
- 関数呼び出しといったら括弧が付きものの文化で育った人は、Callを使うといいかも。
- 逆に戻り値あり、なしで書き方を明確に使い分けたい派の人は、出来る限り括弧を省略するスタイルを採用してみるといいかも。

{% include goto_pagetop.html %}

* * *
## <a name="reference">参考</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-04-07" updated="2021-04-07" %}</div>
- [(Microsoft \| Docs) Call ステートメント](https://docs.microsoft.com/ja-jp/office/vba/language/reference/user-interface-help/call-statement)
- [(Microsoft \| Docs) Sub プロシージャと Function プロシージャの呼び出し](https://docs.microsoft.com/ja-jp/office/vba/language/concepts/getting-started/calling-sub-and-function-procedures)
- [(Microsoft \| Docs) コードでかっこを使用する](https://docs.microsoft.com/ja-jp/office/vba/language/concepts/getting-started/using-parentheses-in-code)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
