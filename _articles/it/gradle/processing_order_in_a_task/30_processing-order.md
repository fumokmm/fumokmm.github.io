---
chapter_no: 30
chapter_id: processing-order
chapter_title: 処理順序
created: 2021-05-08
updated: 2021-05-08
---
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