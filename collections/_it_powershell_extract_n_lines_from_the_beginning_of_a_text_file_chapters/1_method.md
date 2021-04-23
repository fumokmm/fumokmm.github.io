---
chapter_no: 1
chapter_id: method
chapter_title: やり方
created: 2021-04-23
updated: 2021-04-23
---
<div class="code-box-syntax">
<div class="title">書式</div>
<pre>
Get-Content <em>&lt;ファイルのパス&gt;</em> -TotalCount <em>&lt;取得したい行数&gt;</em>
</pre>
</div>

### 例：test.txtの先頭から6行だけ取り出す
<div class="code-box-input">
<div class="title">C:\temp\test.txt</div>
<pre>
aaa
bbb
ccc
ddd
eee
fff
ggg
hhh
...
...
</pre>
</div>

<div class="code-box-output">
<div class="title">実行結果</div>
<pre>
PS C:\Users\fumo&gt; <em class="command">Get-Content C:\temp\test.txt -TotalCount 6</em>
<em>aaa
bbb
ccc
ddd
eee
fff</em>
PS C:\Users\fumo&gt;
</pre>
</div>
