---
chapter_no: 1
chapter_title: NULLのソート順
created: 2021-05-26
updated: 2021-05-26
---
SQL ServerにはOracleのような`nulls first`や`nulls last`がありません。  
SQL ServerでNULLのソート順を指定するには、`CASE句`を使いましょう。
<div class="code-box no-title">
<pre>
ORDER BY
  <em>CASE WHEN</em> <em class="blue">[項目]</em> <em>IS NULL THEN 0 ELSE 1 END</em>,
  <em class="blue">[項目]</em>
</pre>
</div>
- 項目が`NULL`の場合`0`となり、`NULL`でなければ`1`となります。
  - → `NULL`のデータが先に並び、その後`NULL`でないデータが並びます(`nulls first`)
- 逆順にしたい場合は`0`と`1`をひっくり返すか、`DESC`を付けて下さい。

