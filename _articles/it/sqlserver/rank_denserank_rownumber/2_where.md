---
chapter_no: 2
chapter_id: where
chapter_title: WHERE句で範囲を絞った場合
created: 2021-02-15
updated: 2021-02-15
---
[RANKとDENSE_RANKとROW_NUMBERの振る舞い](#behavior)と同じデータをあらかじめWHERE句で絞った場合、取得結果も変わってくるので注意が必要です。  
あくまで、絞り込んだ結果についての順位付けとなります。
もし、取得した順位を使って絞り込みやソートを行いたい場合は、一度取得結果をサブクエリとして受け取ってから絞り込む必要があります。

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
<em>WHERE Age >= 30</em>  <em class="comment">-- 例として30歳以上の人に絞る</em>
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
		<td>2</td>
		<td>2</td>
		<td>2</td>
	</tr>
	<tr>
		<td>野中 玲奈</td>
		<td>32</td>
		<td>100</td>
		<td>3</td>
		<td>3</td>
		<td>3</td>
	</tr>
</table>
- この3名での順位となる。