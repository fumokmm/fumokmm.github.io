---
chapter_no: 4
chapter_id: create-an-empty-directory-instead-of-an-empty-file
chapter_title: 空ファイルではなく空ディレクトリを作成する
created: 2021-04-30
updated: 2021-04-30
---
ちょっと脇道に逸れますが、`New-Item`で作成できるので関連として紹介します。  

空ファイルではなくて、空ディレクトリを作成するには`-ItemType`で`Directory`を指定します。
<div class="code-box-syntax">
<div class="title">空ディレクトリを作成する</div>
<pre>
New-Item &lt;ファイルのパス&gt; <em>-ItemType</em> <em class="blue">Directory</em>
</pre>
</div>
