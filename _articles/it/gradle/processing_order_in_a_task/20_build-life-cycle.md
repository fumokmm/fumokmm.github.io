---
chapter_no: 20
chapter_id: build-life-cycle
chapter_title: ビルドライフサイクル
created: 2021-05-08
updated: 2021-05-08
---
Gradleの実行は大きく３つのフェーズに分かれています。
スクリプト中のどこに記述するかによって、どのフェーズで実行されるかが異なるので注意が必要です。

<table class="normal">
	<tr>
		<th markdown="span">フェーズ</th>
		<th markdown="span">内容</th>
	</tr>
	<tr>
		<td markdown="span">初期化フェーズ  
		(Initialization)</td>
		<td markdown="span">プロジェクトがシングルかマルチかなどを判定し、 Projectオブジェクトを生成します。</td>
	</tr>
	<tr>
		<td markdown="span">設定フェーズ  
		(Configuration)</td>
		<td markdown="span">ビルドスクリプトを実行して、Projectオブジェクトを構築していきます。</td>
	</tr>
	<tr>
		<td markdown="span">実行フェーズ  
		(Execution)</td>
		<td markdown="span">コマンドラインで指定されたタスクを実際に実行します。</td>
	</tr>
</table>