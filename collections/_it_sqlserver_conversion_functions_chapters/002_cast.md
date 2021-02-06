---
chapter_no: 002
chapter_id: cast
chapter_title: CAST
created: 2020-12-22
updated: 2020-01-04
---
CASTが一番シンプルな形になります。  

<div class="code-box">
<div class="title">CASTの構文</div>
<pre>
CAST(expression AS data_type [(length)])  
</pre>
</div>

- `expression`の部分に値が入り、その値を `data_type`の型に変換してくれます
- `length` は型の桁数を指定しますが、省略可能です
- `値 AS 型` という形になるため、英語圏の人にとって読み下しやすい形式なのかもしれません
- 変換元の値は任意なので、どんな型でも構いませんが、マッチングタイプがあって、それに外れると変換エラーとなってしまいますので注意しましょう。([参考：変換表](#explicit-convertion-table)を参照)  
  - 例えば、numericからdateへの変換は「×」になっていますので、エラーなります。

<div class="code-box">
<div class="title">例1 文字列'12.34'をdecimalに変換する</div>
<pre>
CAST('12.34' AS decimal(4, 2)) <em class="comment">-- 12.34</em>
</pre>
</div>

<div class="code-box">
<div class="title">例2 文字列'12.34'をdecimalに変換する</div>
<pre>
CAST('12.34' AS decimal) <em class="comment">-- 12</em>
</pre>
</div>

<div class="code-box">
<div class="title">例3 文字列を日付型に変換する</div>
<pre>
CAST('2020/12/22' AS date) <em class="comment">-- 2020-12-22 (date型)</em>
</pre>
</div>
