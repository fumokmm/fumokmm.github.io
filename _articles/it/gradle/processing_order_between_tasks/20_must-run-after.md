---
chapter_no: 20
chapter_id: must-run-after
chapter_title: mustRunAfter
created: 2021-05-08
updated: 2021-05-08
---
### mustRunAfterとは
- [dependsOn](#depends-on)でガッチガチにタスク間の依存関係を定義していけば実行順の制御はできるのですが
- 場合によっては常に実行して欲しいわけじゃないタスクとかもあったりますね。
- 例えばJavaのビルドなどで、ちょっとクラス名を変更したからコンパイルする前にクリーンしておいてから実行したいとかです。
- このケースを考えた場合、`taskCompile`に`dependsOn`で`taskClean`を指定してしまうと、どんな時でもクリーンされてしまうようになってしまい、うまくいきません。
- そこで登場するのが`mustRunAfter`です。

### mustRunAfterは、タスク間の実行順を強制する
- 例えば`taskB`は必ず、`taskA`の後に実行して欲しいような場合、以下のようにします。
<div class="code-box no-title">
<pre>
taskB.mustRunAfter(taskA)
</pre>
</div>
そして、以下のように実行するタスクを指定してGradleを起動することで、
`taskA -> taskB`という実行順が保証されます。
<div class="code-box-output no-title">
<pre>
$ gradle taskA taskB
</pre>
</div>

### 似たようなのに shouldRunAfter というのもある
- `mustRunAfter`の方は厳密で、`shouldRunAfter`の方はサイクル実行とか並列実行時は従わないことがあるよってことみたいです。([参考](https://stackoverflow.com/questions/36794690/what-is-the-difference-between-mustrunafter-and-shouldrunafter-in-task-ordering))
- 込み入ったことをやらないのであれば、`mustRunAfter`で良いのではと思います。