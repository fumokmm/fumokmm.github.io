---
chapter_no: 030
chapter_id: data-type
chapter_title: 2. データ型
created: 2010-06-05
updated: 2021-04-01
---
### すべてがObject(プリミティブはない)
`1`、 `1.0f`などのJavaでのプリミティブは  `java.lang.Integer`や、`java.lang.Float`などのラッパーでラッピングされているため、  
通常のリテラルのように利用することが可能となります。

### 数値型リテラル
数値型リテラルとして利用できるものは、以下表のようになります。
<table class="normal">
	<tr>
		<th markdown="span">型</th>
		<th markdown="span">エイリアス</th>
		<th markdown="span">リテラル例</th>
	</tr>
	<tr>
		<td markdown="span">java.lang.Integer</td>
		<td markdown="span">int</td>
		<td markdown="span">15, 0x1234ffff</td>
	</tr>
	<tr>
		<td markdown="span">java.lang.Long</td>
		<td markdown="span">long</td>
		<td markdown="span">100L, 200l*9</td>
	</tr>
	<tr>
		<td markdown="span">java.lang.Float</td>
		<td markdown="span">float</td>
		<td markdown="span">1.23f, 4.56F</td>
	</tr>
	<tr>
		<td markdown="span">java.lang.Double</td>
		<td markdown="span">double</td>
		<td markdown="span">15, 0x1234ffff</td>
	</tr>
	<tr>
		<td markdown="span">java.lang.BigInteger</td>
		<td markdown="span">-</td>
		<td markdown="span">123g, 456G</td>
	</tr>
	<tr>
		<td markdown="span">java.lang.BigDecimal</td>
		<td markdown="span">-</td>
		<td markdown="span">1.23, 4.56, 1.4E4, 2.8e4, 1.23g, 1.23G</td>
	</tr>
</table>
