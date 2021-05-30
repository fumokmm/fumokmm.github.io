---
title: Gradleのタスク内の処理順序
display_order: 10
created: 2021-05-08
updated: 2021-05-08
---
Gradleの処理順序は難しい…。

## <a name="index">目次</a>

<ul id="index_ul">
<li><a href="#operating-environment">動作環境</a></li>
<li><a href="#build-life-cycle">ビルドライフサイクル</a></li>
<li><a href="#processing-order">処理順序</a></li>
<li><a href="#reference">参照</a></li>
</ul>

* * *
## <a name="operating-environment">動作環境</a><a href="#operating-environment">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-08" updated="2021-05-08" %}</div>
`WSL`上の`Ubuntu 20.04.1 LTS`にて、`Gradle 7.0`で動作確認しています。

{% include goto_pagetop.html %}

* * *
## <a name="build-life-cycle">ビルドライフサイクル</a><a href="#build-life-cycle">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-08" updated="2021-05-08" %}</div>
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

{% include goto_pagetop.html %}

* * *
## <a name="processing-order">処理順序</a><a href="#processing-order">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-08" updated="2021-05-08" %}</div>
ここでは、サンプルのビルドスクリプトで、[ビルドライフサイクル](#build-life-cycle)で言うところの`設定フェーズ`と`実行フェーズ`の処理順序を見て行きます。  

<div class="code-box">
<div class="title">build.gradle</div>
<pre>
<em>task helloA {
    println 'Hello 1'</em>

    <em class="blue">doLast {
        println 'Hello 2'
    }</em>

    <em class="blue">doFirst {
        println 'Hello 3'
    }</em>

    <em>println 'Hello 4'
}</em>

<em>task helloB {
    println 'Hello 5'</em>

    <em class="blue">doLast {
        println 'Hello 6'
    }</em>

    <em>println 'Hello 7'
}</em>
</pre>
</div>

- 赤文字部分が`設定フェーズ`で、青文字部分が`実行フェーズ`で実行される部分となります。
  - `設定フェーズ`部分はスクリプト実行の際に常に実行されます(起動タスクとして指定しなくても)。
    - `設定フェーズ`はタスクの設定をするためのフェーズなので、こういう挙動になっているものと思われます。
  - `doFirst`と`doLast`で囲んだ部分が`実行フェーズ`で実行されることになります(起動タスクとして指定した場合に実行されます)。
    - `設定フェーズ`ではこの部分は実行されません。



以下が、`helloA`タスクと`helloB`タスクを実行した際の結果です。
<div class="code-box-output">
<div class="title">実行結果</div>
<pre>
<em class="command">$ gradle helloA</em>

<em>&gt; Configure project :
Hello 1
Hello 4
Hello 5
Hello 7</em>

<em class="blue">&gt; Task :helloA
Hello 3
Hello 2</em>

BUILD SUCCESSFUL in 710ms
1 actionable task: 1 executed

<em class="command">$ gradle helloB</em>

<em>&gt; Configure project :
Hello 1
Hello 4
Hello 5
Hello 7</em>

<em class="blue">&gt; Task :helloB
Hello 6</em>

BUILD SUCCESSFUL in 659ms
1 actionable task: 1 executed
</pre>
</div>
- 結果を見てみると、設定フェーズ(Configure project)では、1, 4, 5, 7が、`helloA`でも`helloB`でも実行されていることが分かります。
- しかし、実行フェーズ(`Task :helloA`、`Task :helloB`)では、それぞれのタスクで`doFirst`、`doLast`で指定した部分のみ実行されていることが分かります。
  - `doFirst`と`doLast`を両方指定した場合は名前からもわかる通り、*`doFirst`の方が先に実行されます*(`helloA`の出力結果参照)。
  - `doFirst`や`doLast`を2回以上指定した場合、*後から指定した方がより最初、より最後に実行されます*(`doFirst`はキューの先頭に`Action`を突っ込んでいて、`doLast`はキューの末尾に`Action`を突っ込んでいるイメージです)。

{% include goto_pagetop.html %}

* * *
## <a name="reference">参照</a><a href="#reference">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-08" updated="2021-05-08" %}</div>
- [(Qiita) Gradle のタスク定義のあれこれ](https://qiita.com/opengl-8080/items/0a192b62ee87d8ac7578)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
