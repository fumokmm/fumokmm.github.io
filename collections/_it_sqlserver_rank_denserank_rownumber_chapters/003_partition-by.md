---
chapter_no: 002
chapter_id: partition-by
chapter_title: PARTITION BY句で区切って順位付けする
created: 2021-02-15
updated: 2021-02-15
---
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
