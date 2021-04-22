---
chapter_no: 1
chapter_id: index
chapter_title: INDEX
created: 2021-02-03
updated: 2021-02-15
---
インデックス関連

<div class="code-box-syntax">
<div class="title">インデックス(nonclustered)の作成</div>
<pre>
CREATE INDEX &lt;インデックス名&gt; ON &lt;テーブル名&gt; (&lt;列&gt;);
</pre>
</div>

<div class="code-box-syntax">
<div class="title">clusteredなインデックスの作成</div>
<pre>
CREATE <em>CLUSTERED</em> INDEX &lt;インデックス名&gt; ON &lt;データベース名&gt;.&lt;スキーマ名&gt;.&lt;テーブル名&gt; (&lt;列&gt;);
</pre>
</div>
`CLUSTERED`を付けるとクラスタードなインデックスを作成できます。テーブル名の部分はデータベース・スキーマ名・テーブル名の3パート指定もできます。

<div class="code-box-syntax">
<div class="title">ユニークインデックス(nonclustered)の作成</div>
<pre>
CREATE <em>UNIQUE</em> INDEX &lt;インデックス名&gt; ON &lt;テーブル名&gt; (&lt;列1&gt; DESC, &lt;列2&gt; ASC, &lt;列3&gt; DESC);
</pre>
</div>
列定義は複数指定できます。また各列に並べ方も(ASC:昇順, DESC:降順)指定できます。

### 参考
- [(Microsoft \| Docs) CREATE INDEX (Transact-SQL)](https://docs.microsoft.com/ja-jp/sql/t-sql/statements/create-index-transact-sql?view=sql-server-ver15)