---
chapter_no: 3
chapter_id: include-the-specified-string-in-the-file
chapter_title: 指定した文字列をファイルに含める
created: 2021-04-30
updated: 2021-04-30
---
空ファイルではなくて、指定した文字列が入っているファイルを作成するには、`-Value`オプションを利用します。
<div class="code-box-syntax">
<div class="title">ファイルを作成する(指定した文字列をファイルに含める)</div>
<pre>
New-Item &lt;ファイルのパス&gt; <em>-Value</em> <em class="blue">&lt;含めたい文字列&gt;</em>
</pre>
</div>

### 例：test.txtにabcという文字列が入ったファイルを作成する
<div class="code-box-output">
<div class="title">PowerShell</div>
<pre>
PS C:\Users\fumo&gt; <em class="command">New-Item C:\temp\test.txt -Value abc</em>
</pre>
</div>

<div class="code-box-output">
<div class="title">C:\temp\test.txt</div>
<pre>
abc
</pre>
</div>
