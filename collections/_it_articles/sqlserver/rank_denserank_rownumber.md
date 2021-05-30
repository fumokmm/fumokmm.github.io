---
title: SQL ServerのRANK, DENSE_RANK, ROW_NUMBERの違い
article_group_id: sql-group
display_order: 45
created: 2021-02-15
updated: 2021-02-15
---
※メモの中で出てくる人物名は仮名です。たまたま同性同名の方がいらっしゃいましたらごめんなさい。

## <a name="index">目次</a><a href="#目次">§</a>

<ul id="index_ul">
<li><a href="#behavior">RANKとDENSE_RANKとROW_NUMBERの振る舞い</a></li>
<li><a href="#partition-by">PARTITION BY句で区切って順位付けする</a></li>
<li><a href="#reference">参考</a></li>
</ul>

* * *
## <a name="behavior">RANKとDENSE_RANKとROW_NUMBERの振る舞い</a><a href="#behavior">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-02-15" updated="2021-02-15" %}</div>
RANKとDENSE_RANKとROW_NUMBERはそれぞれ似ているけどちょっとだけ違うので違いをメモしておきます。

### データ
以下のようなデータを持つテーブル`User`があるとします。
<table class="normal">
	<tr>
		<th>Name</th>
		<th>Age</th>
		<th>Score</th>
	</tr>
	<tr>
		<td>川村 千治</td>
		<td>39</td>
		<td>70</td>
	</tr>
	<tr>
		<td>北島 永寿</td>
		<td>43</td>
		<td>80</td>
	</tr>
	<tr>
		<td>永田 祐美</td>
		<td>27</td>
		<td>80</td>
	</tr>
	<tr>
		<td>三上 なつみ</td>
		<td>18</td>
		<td>75</td>
	</tr>
	<tr>
		<td>野中 玲奈</td>
		<td>32</td>
		<td>100</td>
	</tr>
</table>

Scoreについて、`RANK`、`DENSE_RANK`、`ROW_NUMBER`をそれぞれ取得すると以下のようになります。
<div class="code-box">
<div class="title">SQL</div>
<pre>
SELECT [Name]
      ,[Age]
      ,[Score]
      <em>,RANK() OVER(ORDER BY Score) AS RANK</em>
      <em>,DENSE_RANK() OVER(ORDER BY Score) AS DENSE_RANK</em>
      <em>,ROW_NUMBER() OVER(ORDER BY Score) AS ROW_NUMBER</em>
FROM [dbo].[User]
</pre>
</div>

### 取得結果
<table class="normal">
	<tr>
		<th>Name</th>
		<th>Age</th>
		<th>Score</th>
		<th>RANK</th>
		<th>DENSE_RANK</th>
		<th>ROW_NUMBER</th>
	</tr>
	<tr>
		<td>川村 千治</td>
		<td>39</td>
		<td>70</td>
		<td>1</td>
		<td>1</td>
		<td>1</td>
	</tr>
	<tr>
		<td>北島 永寿</td>
		<td>43</td>
		<td>80</td>
		<td>3</td>
		<td>3</td>
		<td>3</td>
	</tr>
	<tr>
		<td>永田 祐美</td>
		<td>27</td>
		<td>80</td>
		<td>3</td>
		<td>3</td>
		<td>4</td>
	</tr>
	<tr>
		<td>三上 なつみ</td>
		<td>18</td>
		<td>75</td>
		<td>2</td>
		<td>2</td>
		<td>2</td>
	</tr>
	<tr>
		<td>野中 玲奈</td>
		<td>32</td>
		<td>100</td>
		<td>5</td>
		<td>4</td>
		<td>5</td>
	</tr>
</table>

それぞれは以下のような特徴がある。

- `RANK`は同率があった場合順位は同じになり、その次の順位は飛ばします。
  - 上記の例だと、3位が2名いるため、4位が飛ばされています。
- `DENSE_RANK`も同率があった場合は順位は同じになりますが、その次の順位は飛ばしません。
  - 上記の例では、野中さんが4位となっています。
- `ROW_NUMBER`は、同率があっても同じ順位にはならず、出現順でカウントします。
  - (注意) 出現順は不定なので、上記の例では、たとえば北島さんと永田さんは2名ともスコアは80で順位はひっくり返ることもあります。
    - ちゃんと順序付けしたい場合は、OVER句のORDER BYできちんと指定する必要があります。
      - 例) OVER(ORDER BY Score, Age) …スコアで並べ替えた後、同率ならAgeでも並べ替えるため、順位は一意に決まる。

{% include goto_pagetop.html %}

* * *
## <a name="partition-by">PARTITION BY句で区切って順位付けする</a><a href="#partition-by">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-02-15" updated="2021-02-15" %}</div>
[RANKとDENSE_RANKとROW_NUMBERの振る舞い](#behavior)で使ったテーブルをちょっと加工して、  
以下のようなデータを持つテーブル`User`を準備します。

<table class="normal">
	<tr>
		<th>Name</th>
		<th>Age</th>
		<th>Score</th>
		<th>Class</th>
	</tr>
	<tr>
		<td>川村 千治</td>
		<td>39</td>
		<td>70</td>
		<td>A</td>
	</tr>
	<tr>
		<td>永田 祐美</td>
		<td>27</td>
		<td>80</td>
		<td>A</td>
	</tr>
	<tr>
		<td>野中 玲奈</td>
		<td>32</td>
		<td>100</td>
		<td>A</td>
	</tr>
	<tr>
		<td>増田 保平</td>
		<td>22</td>
		<td>50</td>
		<td>B</td>
	</tr>
	<tr>
		<td>上原 さゆみ</td>
		<td>27</td>
		<td>70</td>
		<td>B</td>
	</tr>
	<tr>
		<td>浅井 れいや</td>
		<td>33</td>
		<td>80</td>
		<td>B</td>
	</tr>
	<tr>
		<td>竹中 沙耶香</td>
		<td>24</td>
		<td>60</td>
		<td>C</td>
	</tr>
	<tr>
		<td>三上 なつみ</td>
		<td>20</td>
		<td>60</td>
		<td>C</td>
	</tr>
	<tr>
		<td>緒方 利浩</td>
		<td>18</td>
		<td>60</td>
		<td>C</td>
	</tr>
	<tr>
		<td>北島 永寿</td>
		<td>43</td>
		<td>80</td>
		<td>C</td>
	</tr>
</table>

このデータについて、Class別に順位付けしたい場合、以下のようにOVER句の中で、`PARTITION BY`で区切りたい列を指定します。

<div class="code-box">
<div class="title">SQL</div>
<pre>
SELECT [Name]
      ,[Age]
      ,[Score]
      ,[Class]
      ,RANK() OVER(<em>PARTITION BY</em> Class ORDER BY Score) AS RANK
      ,DENSE_RANK() OVER(<em>PARTITION BY</em> Class ORDER BY Score) AS DENSE_RANK
      ,ROW_NUMBER() OVER(<em>PARTITION BY</em> Class ORDER BY Score, Age DESC) AS ROW_NUMBER
FROM [dbo].[User]
ORDER BY [Class], [Score]
</pre>
</div>

### 取得結果
<table class="normal">
	<tr>
		<th>Name</th>
		<th>Age</th>
		<th>Score</th>
		<th>Class</th>
		<th>RANK</th>
		<th>DENSE_RANK</th>
		<th>ROW_NUMBER</th>
	</tr>
	<tr>
		<td>川村 千治</td>
		<td>39</td>
		<td>70</td>
		<td>A</td>
		<td>1</td>
		<td>1</td>
		<td>1</td>
	</tr>
	<tr>
		<td>永田 祐美</td>
		<td>27</td>
		<td>80</td>
		<td>A</td>
		<td>2</td>
		<td>2</td>
		<td>2</td>
	</tr>
	<tr>
		<td>野中 玲奈</td>
		<td>32</td>
		<td>100</td>
		<td>A</td>
		<td>3</td>
		<td>3</td>
		<td>3</td>
	</tr>
	<tr>
		<td>増田 保平</td>
		<td>22</td>
		<td>50</td>
		<td>B</td>
		<td>1</td>
		<td>1</td>
		<td>1</td>
	</tr>
	<tr>
		<td>上原 さゆみ</td>
		<td>27</td>
		<td>70</td>
		<td>B</td>
		<td>2</td>
		<td>2</td>
		<td>2</td>
	</tr>
	<tr>
		<td>浅井 れいや</td>
		<td>33</td>
		<td>80</td>
		<td>B</td>
		<td>3</td>
		<td>3</td>
		<td>3</td>
	</tr>
	<tr>
		<td>竹中 沙耶香</td>
		<td>24</td>
		<td>60</td>
		<td>C</td>
		<td>1</td>
		<td>1</td>
		<td>1</td>
	</tr>
	<tr>
		<td>三上 なつみ</td>
		<td>20</td>
		<td>60</td>
		<td>C</td>
		<td>1</td>
		<td>1</td>
		<td>2</td>
	</tr>
	<tr>
		<td>緒方 利浩</td>
		<td>18</td>
		<td>60</td>
		<td>C</td>
		<td>1</td>
		<td>1</td>
		<td>3</td>
	</tr>
	<tr>
		<td>北島 永寿</td>
		<td>43</td>
		<td>80</td>
		<td>C</td>
		<td>4</td>
		<td>2</td>
		<td>4</td>
	</tr>
</table>

- 結果として、Classごとの順位付けした結果が取得されます。
- 上記例のROW_NUMBERは、OVER句内のORDER BYの2番目でAgeにDESCで指定しているので、ClassがCの竹中さん、三上さん、緒方さんは年齢の上の人の方からROW_NUMBERが振られます。

{% include goto_pagetop.html %}

* * *
## <a name="reference">参考</a><a href="#reference">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-02-15" updated="2021-02-15" %}</div>
- [集計関数（RANK,DENSE_RANK,ROW_NUMBER）の結果の違い](https://www.projectgroup.info/tips/SQLServer/MSSQL_00000044.html)
- [(Qiita) 分析関数（ウインドウ関数）をわかりやすく説明してみた](https://qiita.com/tlokweng/items/fc13dc30cc1aa28231c5)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
