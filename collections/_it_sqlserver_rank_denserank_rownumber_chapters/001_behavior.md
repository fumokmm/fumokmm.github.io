---
chapter_no: 001
chapter_id: behavior
chapter_title: RANKとDENSE_RANKとROW_NUMBERの振る舞い
created: 2021-02-15
updated: 2021-02-15
---
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
