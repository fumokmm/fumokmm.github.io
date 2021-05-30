---
title: PowerShellの文法
article_group_id: basis-group
display_order: 10
created: 2021-05-16
updated: 2021-05-28
---

## <a name="index">目次</a>

<ul id="index_ul">
<li><a href="#basis">1. 基礎</a></li>
<li><a href="#reference">参考</a></li>
</ul>

* * *
## <a name="basis">1. 基礎</a><a href="#basis">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-16" updated="2021-05-28" %}</div>
### コンソールに文字表示
`Write-Host`コマンドレットを使用します。
<div class="code-box no-title">
<pre>
<em>Write-Host</em> <em class="blue">"Hello world"</em>
</pre>
</div>

### コメント
コメントには`#`を使用します。
<div class="code-box no-title">
<pre>
<em class="comment"># ここはコメント</em>
</pre>
</div>

複数行コメントには`<#`と`#>`を使用します。
<div class="code-box no-title">
<pre>
<em class="comment">&lt;#
ここは複数行
コメントです。
#&gt;</em>
</pre>
</div>

### 式の途中で改行する
式の途中で改行するには<code>バッククォート(`)</code>を使用します。
ちなみに[Windows Batchの方]({% link _it_articles/windows_batch/grammar.md %}#basis)では`サーカムフレックス(^)`を利用していましたね。
<div class="code-box no-title">
<pre>
New-Item "c:\temp\myfile.txt" <em>`</em>
    -type file <em>`</em>
    -value "test"
</pre>
</div>

パイプ`(|)`を後ろに置く場合は<code>バッククォート(`)</code>無しで改行できます。
<div class="code-box no-title">
<pre>
Get-Process <em>|</em>
   Where-Object {$_.CPU -gt 500} <em>|</em>
   Select-Object -first 3 
</pre>
</div>

- 参考：[ソースコードの式の途中で改行する方法](https://bayashita.com/p/entry/show/87)

### 変数宣言
PowerShellでは変数は頭に`$`を付けて宣言します。
変数宣言をしていなくても使用可能で、どのような型でも代入が可能です。
<div class="code-box no-title">
<pre>
<em>$a</em> = 1
<em>$items</em> = Get-ChildItem # コマンドレットの戻り値を格納
</pre>
</div>

型を明示的に指定することも可能です。型は`[型]`という形式で`$`の前に付けます。
<div class="code-box no-title">
<pre>
<em>[int]</em>$i = 10
</pre>
</div>

明示的に型を指定した場合、その型以外を代入しようとするとエラーとなります。
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

### スコープ
- PowerShellはダイナミックスコープを採用しています。
- スコープを生成するものは、以下の3種類。
  - 関数の実行
  - スクリプト ブロックの実行
  - スクリプト ファイルの実行
- 以下のようなものはスコープを生成しません。
  - `if` や `for` といった制御構文
  - `try` - `catch` - `finally`
  - `begin` - `process` - `end`

スコープについては詳しくは[こちら](https://tech.blog.aerie.jp/entry/powershell-advent-calendar-2018-18)がとても参考になります。

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

スコープについては詳しくは[こちら](https://tech.blog.aerie.jp/entry/powershell-advent-calendar-2018-18)がとても参考になります。

{% include goto_pagetop.html %}

* * *
## <a name="reference">参考</a><a href="#reference">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-16" updated="2021-05-16" %}</div>
- [(PowerShell Scripting Weblog) PowerShell基礎文法最速マスター](http://winscript.jp/powershell/202)
- [(鷲ノ巣) PowerShell のスコープ完全に理解した](https://tech.blog.aerie.jp/entry/powershell-advent-calendar-2018-18)
- [(バヤシタ) ソースコードの式の途中で改行する方法](https://bayashita.com/p/entry/show/87)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
