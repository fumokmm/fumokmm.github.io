---
title: PowerShellの文法
article_group_id: basis-group
display_order: 10
created: 2021-05-16
updated: 2021-08-11
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<div style="column-count: 2;">
    <ul id="index_ul">
        <li><a href="#基礎文法">基礎文法</a>
            <ul>
                <li><a href="#Hello World">Hello World</a></li>
                <li><a href="#コメント">コメント</a></li>
                <li><a href="#式の途中で改行する">式の途中で改行する</a></li>
                <li><a href="#変数宣言">変数宣言</a></li>
                <li><a href="#スコープ">スコープ</a></li>
                <li><a href="#型">型</a></li>
                <li><a href="#演算子">演算子</a></li>
                <li><a href="#条件分岐">条件分岐</a></li>
            </ul>
        </li>
        <li><a href="#文字列">文字列</a>
            <ul>
                <li><a href="#複数行文字列">複数行文字列</a></li>
            </ul>
        </li>
        <li><a href="#関数">関数</a>
            <ul>
                <li><a href="#関数宣言">関数宣言</a></li>
                <li><a href="#可変長引数">可変長引数</a></li>
                <li><a href="#値渡し、参照渡し">値渡し、参照渡し</a></li>
                <li><a href="#引数のデフォルト値">引数のデフォルト値</a></li>
            </ul>
        </li>
        <li><a href="#参照・参考">参照・参考</a>
            <ul>
                <li><a href="#参考">参考</a></li>
            </ul>
        </li>
    </ul>
</div>

## <a name="基礎文法">基礎文法</a><a class="heading-anchor-permalink" href="#基礎文法">§</a>
* * *
## <a name="Hello World">Hello World</a><a class="heading-anchor-permalink" href="#Hello World">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-16" updated="2021-05-28" %}</div>
### コンソールに文字表示
- `Write-Host`コマンドレットを使用します。
<div class="code-box no-title">
<pre>
<em>Write-Host</em> <em class="blue">"Hello world"</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="コメント">コメント</a><a class="heading-anchor-permalink" href="#コメント">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-16" updated="2021-05-28" %}</div>
- コメントには`#`を使用します。
<div class="code-box no-title">
<pre>
<em class="comment"># ここはコメント</em>
</pre>
</div>

- 複数行コメントには`<#`と`#>`を使用します。
<div class="code-box no-title">
<pre>
<em class="comment">&lt;#
ここは複数行
コメントです。
&gt;</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="式の途中で改行する">式の途中で改行する</a><a class="heading-anchor-permalink" href="#式の途中で改行する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-16" updated="2021-05-28" %}</div>
式の途中で改行するには<code>バッククォート(`)</code>を使用します。
ちなみに[Windows Batchの方]({% link _it_articles/windows_batch/grammar.md %}#式の途中で改行する)では`サーカムフレックス(^)`を利用していましたね。
<div class="code-box no-title">
<pre>
New-Item "c:\temp\myfile.txt" <em>`</em>
    -type file <em>`</em>
    -value "test"
</pre>
</div>

- パイプ`(|)`を後ろに置く場合は<code>バッククォート(`)</code>無しで改行できます。
<div class="code-box no-title">
<pre>
Get-Process <em>|</em>
   Where-Object {$_.CPU -gt 500} <em>|</em>
   Select-Object -first 3 
</pre>
</div>

### 参考
- [(バヤシタ) ソースコードの式の途中で改行する方法](https://bayashita.com/p/entry/show/87)

{% include goto_pagetop.html %}

* * *
## <a name="変数宣言">変数宣言</a><a class="heading-anchor-permalink" href="#変数宣言">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-16" updated="2021-07-26" %}</div>
- PowerShellでは変数は頭に`$`を付けて宣言します。
- 変数宣言をしていなくても使用可能で、どのような型でも代入が可能です。
<div class="code-box no-title">
<pre>
<em>$a</em> = 1
<em>$items</em> = Get-ChildItem <em class="comment"># コマンドレットの戻り値を格納</em>
</pre>
</div>

- 型を明示的に指定することも可能です。型は`[型]`という形式で`$`の前に付けます。
  - 指定できる型については[型]({% link _it_articles/powershell/grammar.md %}#型)を参照。
<div class="code-box no-title">
<pre>
<em>[int]</em>$i = 10
</pre>
</div>

- 明示的に型を指定した場合、その型以外を代入しようとするとエラーとなります。
<div class="code-box-output">
<div class="title">違う方を代入しようとするとエラーになる</div>
<pre>
<em class="command">PS C:\Users\fumo&gt;</em> [int]$i = 10
<em class="command">PS C:\Users\fumo&gt;</em> $i = 'a'
<em>値 "a" を型 "System.Int32" に変換できません。エラー: "入力文字列の形式が正しくありません。"
発生場所 行:1 文字:1
+ $i = 'a'
+ ~~~~~~~~
    + CategoryInfo          : MetadataError: (:) [], ArgumentTransformationMetadataException
    + FullyQualifiedErrorId : RuntimeException</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="スコープ">スコープ</a><a class="heading-anchor-permalink" href="#スコープ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-16" updated="2021-05-28" %}</div>
- PowerShellはダイナミックスコープを採用しています。
- スコープを生成するものは、以下の3種類。
  - 関数の実行
  - スクリプト ブロックの実行
  - スクリプト ファイルの実行
- 以下のようなものはスコープを生成しません。
  - `if` や `for` といった制御構文
  - `try` - `catch` - `finally`
  - `begin` - `process` - `end`

### 明示的なスコープの読み取り
- スコープの種類は、`global`、`script`、`local`、`private`の4種類あります。
- スコープ修飾子を指定しなかった場合は`local`となります。
<div class="code-box no-title">
<pre>
<em>$global</em>:x = 10
<em>$script</em>:x = 20
<em>$local</em>:x = 30
</pre>
</div>
- `global`はコンソール上でのスコープです。(一番外側)
- `script`はスクリプト内(.ps1)でのスコープです。
- `local`はスコープのところで書いた*スコープが生成される範囲内`でのスコープです。
- `private`だけちょっと毛色が違っていて、宣言したスコープよりも子のスコープから見えなくなるものです。

- スコープについては詳しくは[こちら](https://tech.blog.aerie.jp/entry/powershell-advent-calendar-2018-18)がとても参考になります。

{% include goto_pagetop.html %}

* * *
## <a name="型">型</a><a class="heading-anchor-permalink" href="#型">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-26" updated="2021-07-26" %}</div>
- PowerShellの型とそのエイリアスです。

<table class="normal">
	<tr>
		<th markdown="span">エリアス</th>
		<th markdown="span">.NET Framework</th>
	</tr>
	<tr>
		<td markdown="span">byte</td>
		<td markdown="span">System.Byte</td>
	</tr>
	<tr>
		<td markdown="span">int</td>
		<td markdown="span">System.Int32</td>
	</tr>
	<tr>
		<td markdown="span">long</td>
		<td markdown="span">System.Int64</td>
	</tr>
	<tr>
		<td markdown="span">double</td>
		<td markdown="span">System.Double</td>
	</tr>
	<tr>
		<td markdown="span">decimal</td>
		<td markdown="span">System.Decimal</td>
	</tr>
	<tr>
		<td markdown="span">char</td>
		<td markdown="span">System.Char</td>
	</tr>
	<tr>
		<td markdown="span">bool</td>
		<td markdown="span">System.Boolean</td>
	</tr>
	<tr>
		<td markdown="span">string</td>
		<td markdown="span">System.String</td>
	</tr>
	<tr>
		<td markdown="span">array</td>
		<td markdown="span">System.Array</td>
	</tr>
	<tr>
		<td markdown="span">xml</td>
		<td markdown="span">System.Xml.XmlDocument</td>
	</tr>
	<tr>
		<td markdown="span">type</td>
		<td markdown="span">System.Type</td>
	</tr>
	<tr>
		<td markdown="span">DateTime</td>
		<td markdown="span">System.DateTime</td>
	</tr>
</table>

### 参考
- [(Windows にまつわる e.t.c.)  PowerShellの演算子](https://www.vwnet.jp/Windows/PowerShell/Ope/OpeListg.htm)

{% include goto_pagetop.html %}

* * *
## <a name="演算子">演算子</a><a class="heading-anchor-permalink" href="#演算子">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-26" updated="2021-07-26" %}</div>
### 比較演算子
<table class="normal">
	<tr>
		<th markdown="span">PowerShell</th>
		<th markdown="span">C系言語</th>
		<th markdown="span">説明</th>
	</tr>
	<tr>
		<td markdown="span">-eq</td>
		<td markdown="span">==</td>
		<td markdown="span">等しい</td>
	</tr>
	<tr>
		<td markdown="span">-ne</td>
		<td markdown="span">!=</td>
		<td markdown="span">等しくない</td>
	</tr>
	<tr>
		<td markdown="span">-gt</td>
		<td markdown="span">></td>
		<td markdown="span">より大きい</td>
	</tr>
	<tr>
		<td markdown="span">-ge</td>
		<td markdown="span">>=</td>
		<td markdown="span">以上</td>
	</tr>
	<tr>
		<td markdown="span">-lt</td>
		<td markdown="span"><</td>
		<td markdown="span">より小さい</td>
	</tr>
	<tr>
		<td markdown="span">-le</td>
		<td markdown="span"><=</td>
		<td markdown="span">以下</td>
	</tr>
	<tr>
		<td markdown="span">-like</td>
		<td markdown="span">なし</td>
		<td markdown="span">ワイルドカードと等しい</td>
	</tr>
	<tr>
		<td markdown="span">-notlike</td>
		<td markdown="span">なし</td>
		<td markdown="span">ワイルドカードと等しくない</td>
	</tr>
	<tr>
		<td markdown="span">-match</td>
		<td markdown="span">なし</td>
		<td markdown="span">正規表現と等しい</td>
	</tr>
	<tr>
		<td markdown="span">-notmatch</td>
		<td markdown="span">なし</td>
		<td markdown="span">正規表現と等しくない</td>
	</tr>
</table>

### 算術演算子
<table class="normal">
	<tr>
		<th markdown="span">PowerShell</th>
		<th markdown="span">C系言語</th>
		<th markdown="span">説明</th>
	</tr>
	<tr>
		<td markdown="span">+</td>
		<td markdown="span">+</td>
		<td markdown="span">加算</td>
	</tr>
	<tr>
		<td markdown="span">-</td>
		<td markdown="span">-</td>
		<td markdown="span">減算/符号反転</td>
	</tr>
	<tr>
		<td markdown="span">*</td>
		<td markdown="span">*</td>
		<td markdown="span">乗算</td>
	</tr>
	<tr>
		<td markdown="span">/</td>
		<td markdown="span">/</td>
		<td markdown="span">除算</td>
	</tr>
	<tr>
		<td markdown="span">%</td>
		<td markdown="span">%</td>
		<td markdown="span">余剰</td>
	</tr>
	<tr>
		<td markdown="span">[Math]::Pow(x,y)</td>
		<td markdown="span">pow(x,y)</td>
		<td markdown="span">べき乗(xのy乗)</td>
	</tr>
	<tr>
		<td markdown="span">=</td>
		<td markdown="span">=</td>
		<td markdown="span">代入</td>
	</tr>
	<tr>
		<td markdown="span">+=</td>
		<td markdown="span">+=</td>
		<td markdown="span">加算代入</td>
	</tr>
	<tr>
		<td markdown="span">-=</td>
		<td markdown="span">-=</td>
		<td markdown="span">減算代入</td>
	</tr>
	<tr>
		<td markdown="span">*=</td>
		<td markdown="span">*=</td>
		<td markdown="span">乗算代入</td>
	</tr>
	<tr>
		<td markdown="span">/=</td>
		<td markdown="span">/=</td>
		<td markdown="span">除算代入</td>
	</tr>
	<tr>
		<td markdown="span">%=</td>
		<td markdown="span">%=</td>
		<td markdown="span">剰余代入</td>
	</tr>
	<tr>
		<td markdown="span">++</td>
		<td markdown="span">++</td>
		<td markdown="span">インクリメント</td>
	</tr>
	<tr>
		<td markdown="span">--</td>
		<td markdown="span">--</td>
		<td markdown="span">デクリメント</td>
	</tr>
</table>

### 論理演算子
<table class="normal">
	<tr>
		<th markdown="span">PowerShell</th>
		<th markdown="span">C系言語</th>
		<th markdown="span">説明</th>
	</tr>
	<tr>
		<td markdown="span">-and</td>
		<td markdown="span">&&</td>
		<td markdown="span">AND</td>
	</tr>
	<tr>
		<td markdown="span">-or</td>
		<td markdown="span">||</td>
		<td markdown="span">OR</td>
	</tr>
	<tr>
		<td markdown="span">-not または !</td>
		<td markdown="span">!</td>
		<td markdown="span">NOT</td>
	</tr>
</table>

### ビット演算子
<table class="normal">
	<tr>
		<th markdown="span">PowerShell</th>
		<th markdown="span">C系言語</th>
		<th markdown="span">説明</th>
	</tr>
	<tr>
		<td markdown="span">-band</td>
		<td markdown="span">&</td>
		<td markdown="span">AND</td>
	</tr>
	<tr>
		<td markdown="span">-bor</td>
		<td markdown="span">|</td>
		<td markdown="span">OR</td>
	</tr>
	<tr>
		<td markdown="span">-bnot</td>
		<td markdown="span">!</td>
		<td markdown="span">NOT</td>
	</tr>
	<tr>
		<td markdown="span">-bxor</td>
		<td markdown="span">^</td>
		<td markdown="span">XOR</td>
	</tr>
	<tr>
		<td markdown="span">-shl</td>
		<td markdown="span">&lt;&lt;</td>
		<td markdown="span">左シフト</td>
	</tr>
	<tr>
		<td markdown="span">-shr</td>
		<td markdown="span">&gt;&gt;</td>
		<td markdown="span">右シフト</td>
	</tr>
</table>

### 型演算
<table class="normal">
	<tr>
		<th markdown="span">PowerShell</th>
		<th markdown="span">説明</th>
	</tr>
	<tr>
		<td markdown="span">$a -is [型]</td>
		<td markdown="span">型と等しい</td>
	</tr>
	<tr>
		<td markdown="span">$a -isnot [型]</td>
		<td markdown="span">型と等しくない</td>
	</tr>
	<tr>
		<td markdown="span">$a -as [型]</td>
		<td markdown="span">型へキャスティング、失敗時は $null</td>
	</tr>
	<tr>
		<td markdown="span">[型]$a</td>
		<td markdown="span">型へキャスティング(失敗時はエラー)</td>
	</tr>
</table>
- 指定できる型については[型]({% link _it_articles/powershell/grammar.md %}#型)を参照。

### 参考
- [(Windows にまつわる e.t.c.)  PowerShellの演算子](https://www.vwnet.jp/Windows/PowerShell/Ope/OpeListg.htm)

{% include goto_pagetop.html %}

* * *
## <a name="条件分岐">条件分岐</a><a class="heading-anchor-permalink" href="#条件分岐">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-11" updated="2021-08-11" %}</div>
### if-elseif-else
<div class="code-box-syntax">
<div class="title">if</div>
<pre>
<em>if</em> (Boolean_expression) {
   // Executes when the Boolean expression is true
}
</pre>
</div>

<div class="code-box-syntax">
<div class="title">if-else</div>
<pre>
<em>if</em> (Boolean_expression) {
   // Executes when the Boolean expression is true
} <em>else</em> {
   // Executes when the Boolean expression is false
}
</pre>
</div>

<div class="code-box-syntax">
<div class="title">if-elseif-else</div>
<pre>
<em>if</em> (Boolean_expression 1) {
   // Executes when the Boolean expression 1 is true
} <em>elseif</em> (Boolean_expression 2) {
   // Executes when the Boolean expression 2 is true
} <em>elseif</em> (Boolean_expression 3) {
   // Executes when the Boolean expression 3 is true
} <em>else</em> {
   // Executes when the none of the above condition is true.
}
</pre>
</div>

### 例
<div class="code-box no-title">
<pre>
$filesize = 2MB

<em>if</em> ($filesize -lt 1MB) {
    Write-Host "1MBより小さい"
} <em>elseif</em> ($filesize -lt 2MB) {
    Write-Host "2MBより小さい"
} <em>else</em> {
    Write-Host "2MB以上"
}
</pre>
</div>
- この例の場合、`$filesize`が2MB以上のため、`else`に入り、`2MB以上`と出力されます。
- `-lt`は`比較演算子`です。利用可能な比較演算子は[演算子](#演算子)を参照ください。

<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
2MB以上
</pre>
</div>

### 参考
- [(tutorialspoint) Powershell - If Else Statement](https://www.tutorialspoint.com/powershell/if_else_statement_in_powershell.htm)

{% include goto_pagetop.html %}

## <a name="文字列">文字列</a><a class="heading-anchor-permalink" href="#文字列">§</a>
* * *
## <a name="複数行文字列">複数行文字列</a><a class="heading-anchor-permalink" href="#複数行文字列">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-30" updated="2021-07-30" %}</div>
- いわゆるヒアドキュメントです。
- PowerShellでは`@"`と`"@`で囲むか、`@'`と`'@`で囲みます。
- ダブルクォーテーションを使用した場合、文字列内の変数は展開されます。

<div class="code-box">
<div class="title">0017_string.ps1</div>
<pre>
$a = 'あいう'

<em class="comment"># 変数展開あり</em>
$str1 = <em>@"
ヒアドキュメントでは複数行のテキストを
１つの文字列として扱います。
変数`$aの値は$($a)です。
"@</em>

<em class="comment"># 変数展開なし</em>
$str2 = <em>@'
ヒアドキュメントでは複数行のテキストを
１つの文字列として扱います。
変数`$aの値は$($a)です。
'@</em>

Write-Host $str1
Write-Host ('-' * 20)
Write-Host $str2
</pre>
</div>

### 出力結果
<div class="code-box no-title">
<pre>
<em class="command">PS C:\temp&gt;</em> .\0017_string.ps1
ヒアドキュメントでは複数行のテキストを
１つの文字列として扱います。
変数<em class="blue">$a</em>の値は<em class="blue">あいう</em>です。
--------------------
ヒアドキュメントでは複数行のテキストを
１つの文字列として扱います。
変数<em class="blue">`$a</em>の値は<em class="blue">$($a)</em>です。
</pre>
</div>

### 参考
- [(バヤシタ) ヒアドキュメントを使って複数行を 1 つの文字列にする](https://bayashita.com/p/entry/show/50)

{% include goto_pagetop.html %}

## <a name="関数">関数</a><a class="heading-anchor-permalink" href="#関数">§</a>
* * *
## <a name="関数宣言">関数宣言</a><a class="heading-anchor-permalink" href="#関数宣言">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-20" updated="2021-07-25" %}</div>
- 関数は`function`キーワードを使って宣言します。  
- 引数を書く位置は、変数名の後の`()`の中か、本体の先頭部分の`Param()`の中のどちらかです[^arguments-position]。
- 戻り値は`return`キーワードのを使って書きます。
<div class="code-box-syntax no-title">
<pre>
<em class="comment"># 引数なし</em>
function <em>関数名</em> {
    <em class="comment"># 処理本体</em>
    return <em class="blue">戻り値</em>
}

function <em>関数名</em>() {
    <em class="comment"># 処理本体</em>
    return <em class="orange">戻り値</em>
}

<em class="comment"># 引数あり</em>
function <em>関数名</em>(<em class="blue">引数1, 引数2, …</em>) {
    <em class="comment"># 処理本体</em>
    return <em class="orange">戻り値</em>
}

function <em>関数名</em> {
    <em class="blue">Param(
        引数1,
        引数2,
        …
    )</em>
    <em class="comment"># 処理本体</em>
    return <em class="orange">戻り値</em>
}
</pre>
</div>
[^arguments-position]: 両方に書くと「function の宣言に引数が指定されている場合、param ステートメントを使用できません。」というエラーになります。

{% include goto_pagetop.html %}

* * *
## <a name="可変長引数">可変長引数</a><a class="heading-anchor-permalink" href="#可変長引数">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-20" updated="2021-07-20" %}</div>
- 可変長引数は変数`$args`という配列に渡されます。  
- 普通に引数を渡した関数内でも`$args`で配列は参照できます。
  - その際、普通の引数に指定した方に先に値が割り当てられていき、*残った部分が`$args`に割り当てられます*。

<div class="code-box">
<div class="title">function_variable_length_parameter.ps1</div>
<pre>
function foo {
    Write-Host <em>$args</em>.Count
    foreach($i in $args) {
        Write-Host $i
    }
}

function bar(<em class="blue">$a, $b</em>) {
    Write-Host "$(<em>$args</em>.Count) a=<em class="blue">$a</em> b=<em class="blue">$b</em>"
    foreach($i in $args) {
        Write-Host $i
    }
}

# 呼び出し
Write-Host '--- call foo'
foo a b あいう
Write-Host '--- call bar 1'
bar 10 20 a b c あいう  <em class="comment"># $a, $bに10, 20が割り当てられ、それ以降が$argsに割り当てられる</em>
Write-Host '--- call bar 2'
bar 10 20  <em class="comment"># $a, $bに10, 20が割り当てられ、$argsには何も割り当てられず空リストになる</em>
</pre>
</div>

<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
<em class="command">PS C:\temp&gt;</em> .\function_variable_length_parameter.ps1
--- call foo
3
a
b
あいう
--- call bar 1
4 a=10 b=20
a
b
c
あいう
--- call bar 2
0 a=10 b=20
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="値渡し、参照渡し">値渡し、参照渡し</a><a class="heading-anchor-permalink" href="#値渡し、参照渡し">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-20" updated="2021-07-20" %}</div>
- 値渡しは通常の操作です。関数の中で書き換えても呼び出し元の方の変数へは影響が及びません。
- 参照渡しをするには、変数にを`ref型`に変換(`[ref]`を付ける)して渡します。
  - 以下の例では、受け取る引数の方も`[ref]`を付けていますが、これは必須ではありません(省略可)。
  - ただ、明示的に`[ref]`を付けておいたほうが、参照渡しであることが分かりやすいので、付けておいたほうがいいかもしれません。

<div class="code-box">
<div class="title">function_args_byval_byref.ps1</div>
<pre>
<em class="comment"># 値渡し</em>
function byVal($arg) {
    $arg = 'Good bye!'
    Write-Host "in function(byVal): $arg"
}

<em class="comment"># 参照渡し</em>
function byRef(<em class="blue">[ref]</em>$arg) {
    $arg<em>.Value</em> = 'Good bye!'
    Write-Host "in function(byRef): $($arg.Value)"
}
function byRef2($arg) {
    $arg<em>.Value</em> += '!!'
    Write-Host "in function(byRef2): $($arg.Value)"
}

$str = 'Hello'
$str
byVal $str  <em class="comment"># 値渡し</em>
$str  <em class="comment"># =&gt; Hello のまま</em>

byRef(<em class="blue">[ref]</em>$str)　<em class="comment"># 参照渡し</em>
$str  <em class="comment"># =&gt; Good bye! に書き換わっている</em>
byRef2(<em class="blue">[ref]</em>$str)　<em class="comment"># 参照渡し</em>
$str  <em class="comment"># =&gt; Good bye!!! に書き換わっている</em>
</pre>
</div>

<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
<em class="command">PS C:\temp&gt;</em> .\function_args_byval_byref.ps1
Hello
in function(byVal): Good bye!
Hello
in function(byRef): Good bye!
Good bye!
in function(byRef2): Good bye!!!
Good bye!!!
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="引数のデフォルト値">引数のデフォルト値</a><a class="heading-anchor-permalink" href="#引数のデフォルト値">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-20" updated="2021-07-20" %}</div>
- 引数のデフォルト値を設定できます。
- 関数呼び出しの時に省略すると、その値が設定されます。
- 明示的に指定して上書きすることもできます。
<div class="code-box">
<div class="title">function_args_default_value.ps1</div>
<pre>
function foo($arg <em>= 10</em>) {
    Write-Host "値は$($arg)です。"
}
function bar($arg1, $arg2 <em>= 10</em>) {
    Write-Host "値は$($arg1)と$($arg2)です。"
}

foo       <em class="comment"># =&gt; 省略しているので、デフォルト値の10が出力される</em>
foo 20    <em class="comment"># =&gt; 上書きして、20が出力される</em>

bar 15    <em class="comment"># =&gt; $arg1に15が入って、$arg2はデフォルト値の10が入る</em>
bar 15 25 <em class="comment"># =&gt; $arg1に15が入って、$arg2は上書きして25が入る</em>
</pre>
</div>

<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
<em class="command">PS C:\temp&gt;</em> .\function_args_default_value.ps1       
値は10です。
値は20です。
値は15と10です。
値は15と25です。
</pre>
</div>

{% include goto_pagetop.html %}

## <a name="参照・参考">参照・参考</a><a class="heading-anchor-permalink" href="#参照・参考">§</a>
* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-16" updated="2021-08-11" %}</div>
### 参考サイト
- [(hakeの日記) PowerShell - 関数（可変長引数）](https://hake.hatenablog.com/entry/20161227/p1)
- [(hakeの日記) PowerShell - 関数（値渡しと参照渡し）](https://hake.hatenablog.com/entry/20161230/p1)
- [(HIRO's.NET) 03.引数を省略可能にするには](https://hiros-dot.net/PowerShell/function/func03.htm)
- [(HIRO's.NET) 06.値渡しと参照渡し](https://hiros-dot.net/PowerShell/function/func06.htm)
- [(PowerShell Scripting Weblog) PowerShell基礎文法最速マスター](http://winscript.jp/powershell/202)
- [(tutorialspoint) Powershell - If Else Statement](https://www.tutorialspoint.com/powershell/if_else_statement_in_powershell.htm)
- [(Windows にまつわる e.t.c.)  PowerShellの演算子](https://www.vwnet.jp/Windows/PowerShell/Ope/OpeListg.htm)
- [(バヤシタ) ソースコードの式の途中で改行する方法](https://bayashita.com/p/entry/show/87)
- [(バヤシタ) ヒアドキュメントを使って複数行を 1 つの文字列にする](https://bayashita.com/p/entry/show/50)
- [(鷲ノ巣) PowerShell のスコープ完全に理解した](https://tech.blog.aerie.jp/entry/powershell-advent-calendar-2018-18)

### ソース
- [(language-examples) 0005_if.ps1](https://github.com/fumokmm/language-examples/blob/main/PowerShell/0005_if.ps1)
- [(language-examples) 0015_operator.ps1](https://github.com/fumokmm/language-examples/blob/main/PowerShell/0015_operator.ps1)
- [(language-examples) 0017_string.ps1](https://github.com/fumokmm/language-examples/blob/main/PowerShell/0017_string.ps1)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
