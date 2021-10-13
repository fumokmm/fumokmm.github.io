---
chapter_no: 1
chapter_title: open関数
created: 2021-10-13
updated: 2021-10-13
---
`open関数`を使います。  
色々オプションがあるので良く使うものをとりあえず。
```syntax
f = open(<file>, <mode>)
```
- `<file>`には開くファイル名を指定します。
- `<mode>`にはファイルを開くモード(文字列で指定)を指定します。
- モードに指定できるものは以下。
<table class="normal">
	<tr>
		<th markdown="span">モード</th>
		<th markdown="span">説明</th>
	</tr>
	<tr>
		<td markdown="span">r</td>
		<td markdown="span">読み込み用(ファイルが存在しない場合はエラー)</td>
	</tr>
	<tr>
		<td markdown="span">r+</td>
		<td markdown="span">読み込みおよび書き込み用(ファイルが存在しない場合はエラー)</td>
	</tr>
	<tr>
		<td markdown="span">w</td>
		<td markdown="span">書き込み用(ファイルの中身をクリア)</td>
	</tr>
	<tr>
		<td markdown="span">w+</td>
		<td markdown="span">読み込みおよび書き込み用(ファイルの中身をクリア)</td>
	</tr>
	<tr>
		<td markdown="span">a</td>
		<td markdown="span">書き込み用(ファイルの末尾に追加)</td>
	</tr>
	<tr>
		<td markdown="span">a+</td>
		<td markdown="span">読み込みおよび書き込み用(ファイルの末尾に追加)</td>
	</tr>
	<tr>
		<td markdown="span">x</td>
		<td markdown="span">書き込み用(ファイルが存在している場合はエラー)</td>
	</tr>
	<tr>
		<td markdown="span">x+</td>
		<td markdown="span">読み込みおよび書き込み用(ファイルが存在している場合はエラー)</td>
	</tr>
	<tr>
		<td markdown="span">b</td>
		<td markdown="span">バイナリモード</td>
	</tr>
	<tr>
		<td markdown="span">t</td>
		<td markdown="span">テキストモード</td>
	</tr>
</table>

### 例
```:読み取りで開く
f = open('sample.txt', 'r')
```
