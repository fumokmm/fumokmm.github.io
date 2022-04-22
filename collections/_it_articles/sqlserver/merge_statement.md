---
title: SQL ServerのMERGE文
article_group_id: sql-group
display_order: 60
created: 2022-04-22
updated: 2022-04-22
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#MERGE文">MERGE文</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-22" updated="2022-04-22" %}</div>
移送元テーブル(A)と、移送先テーブル(B)があったとします。  
- AにもBにも同じキーがあった場合は、UPDATE文
- Aにあって、Bにないキーの場合は、INSERT文
- Aになくて、Bにあるキーの場合は、DELETE文

を一つのSQLで実現できるのがMERGE文です。

<table class="normal">
	<tr>
		<th markdown="span">キー</th>
		<th markdown="span">移送元テーブル(A)</th>
		<th markdown="span">移送先テーブル(B)</th>
		<th markdown="span">実行されるSQL</th>
	</tr>
	<tr>
		<td markdown="span">KEY1が・・・</td>
		<td markdown="span">ある</td>
		<td markdown="span">ある</td>
		<td markdown="span">WHEN MATCHED THEN UPDATE...</td>
	</tr>
	<tr>
		<td markdown="span">KEY2が・・・</td>
		<td markdown="span">ある</td>
		<td markdown="span">ない</td>
		<td markdown="span">WHEN NOT MATCHED BY TARGET THEN INSERT...</td>
	</tr>
	<tr>
		<td markdown="span">KEY3が・・・</td>
		<td markdown="span">ない</td>
		<td markdown="span">ある</td>
		<td markdown="span">WHEN NOT MATCHED BY SOURCE THEN DELETE...</td>
	</tr>
</table>

{% include goto_pagetop.html %}

* * *
## <a name="MERGE文">MERGE文</a><a class="heading-anchor-permalink" href="#MERGE文">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-22" updated="2022-04-22" %}</div>
<div class="code-box-syntax no-title">
<pre>
MERGE INTO
    &lt;対象テーブル&gt; tgt
USING
  (
    SELECT
      KEY,
      XXXX,
      YYYY,
        :
    FROM
      &lt;データ取得元テーブルなど&gt;
  ) src
ON
  src.KEY = tgt.KEY
WHEN MATCHED THEN
  UPDATE SET
    XXXX = src.XXXX,
    YYYY = src.YYYY,
      :
WHEN NOT MATCHED BY TARGET THEN
  INSERT (
    KEY,
    XXXX,
    YYYY,
    　:
  )
  VALUES (
    src.KEY,
    src.XXXX,
    src.YYYY,
      :
  )
WHEN NOT MATCHED BY SOURCE THEN
  DELETE 
;
</pre>
</div>
### 解説
- `MERGE INTO`に<対象テーブル>（→tgt）を記載します。
  - 後で出てくるUPDATE, INSERT, DELETEされる対象はここで記載したテーブルとなります。
- `USING`に更新元データ（→src）を取得します。
  - ここでは設定したい値を取得してくるSELECT文を書きます。
  - 実態のあるテーブルから持ってきてもいいし、何ならSELECTは全部自分で値を決め打ちで書いてもいいです。
  - この時、更新対象行とマッチさせられるキーとなる項目も取得しておきましょう。
- `ON`で＜対象テーブル(tgt)＞と<データ取得元テーブルなど(src)>を紐付けます。
- 以降の`WHEN～`部分には、ONの条件に合致する対象テーブル(tgt)の行に対する処理を書きます。
- `WHEN MATCHED THEN`にはUPDATE文を指定します。
  - UPDATE SETの部分のみでOKです。
  - UPDATE対象はtgtなので、左辺は列名のみ記載します。
- `WHEN NOT MATCHED BY TARGET THEN`にはINSERT文を指定します。
    - INTOは不要です。
    - INSERT項目部分の対象はtgtなので、列名のみ記載します。
- `WHEN NOT MATCHED BY SOURCE THEN`
  - DELETE文を指定します。
    - DELETEのみでOKです。
    - DELETE対象はtgtです。
- `WHEN～`は3つすべて書かなくてもOKです。
  - 必要に応じて、`UPDATE`と`INSERT`や、`INSERT`と`DELETE`など組み合わせて設定することができます。
  

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-22" updated="2022-04-22" %}</div>
### 参照
- [(Microsoft \| Docs) MERGE (Transact-SQL)](https://docs.microsoft.com/ja-jp/sql/t-sql/statements/merge-transact-sql?view=sql-server-ver15)

### 参考サイト
- [(JOHOBASE) SQLServerのMERGEでINSERT/UPDATE/DELETEを1回のSQLで実行する](https://johobase.com/sqlserver-merge-insert-update-delete/)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
