---
chapter_no: 11
chapter_id: stuff
chapter_title: 補足1 STUFF関数
created: 2020-11-07
updated: 2020-11-07
---
`STUFF関数`は、引数を4つ取る関数で、指定した文字列(第1引数)の、指定した位置(第2引数)から、指定した文字数(第3引数)分を、置換文字列(第4引数)に置き換える関数です。以下のような感じになります。

<div class="code-box">
<div class="title">STUFF関数</div>
<pre>
SELECT
    <em>STUFF(</em>'abcdefg', 2, 3, '**new**'<em>)</em> AS "結果";
</pre>
</div>

<div class="code-box">
<div class="title">結果</div>
<pre>
a**new**efg
</pre>
</div>
