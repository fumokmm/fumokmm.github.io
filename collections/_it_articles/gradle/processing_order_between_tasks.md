---
title: Gradleのタスク間の処理順序
display_order: 20
created: 2021-05-08
updated: 2021-05-08
---
- とあるタスクAとタスクBがあったとき、この二つのタスクの実行時の依存関係を定義したい時があります。
- 例えばJavaのビルドなどで、Jarを作る前にはコンパイルが終わっている前提であるとかです。
- そんな時、Gradleでは[dependsOn](#depends-on)を使います。

## <a name="index">目次</a>

<ul id="index_ul">
<li><a href="#depends-on">dependsOn</a></li>
<li><a href="#must-run-after">mustRunAfter</a></li>
<li><a href="#reference">参照</a></li>
</ul>

* * *
## <a name="depends-on">dependsOn</a><a href="#depends-on">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-08" updated="2021-05-08" %}</div>
### dependsOnとは
- `dependsOn`はタスクに定義するもので、*このタスクは他のタスクが依存してますよ～*というのを定義してあげるものです。
- もうちょっと分かりやすく言うと、*このタスクが実行される時、依存しているタスクが実行されている前提ですよ～、実行されてなきゃ困りますよ～*という感じです。

<div class="code-box no-title">
<pre>
taskA.dependsOn(taskB)
</pre>
</div>
- こんな感じにすると、`taskA`の実行時は`taskB`がゼッタイ実行されているのです。

### dependsOnに複数の依存タスクを指定すると…
- `dependsOn`では、複数のタスクを指定できます。
- ただ、ここで注意しないといけないのは、*複数指定したタスクたちの実行順序が定まらない*ということです。
<div class="code-box no-title">
<pre>
taskA.dependsOn(taskB, taskC, taskD, ...)
</pre>
</div>
- `taskA`の実行時は`taskB`と`taskC`と`taskD`が実行されているけど、`taskB`と`taskC`と`taskD`の実行順は不定。
- `taskB`と`taskC`と`taskD`間でも`dependsOn`でタスクの依存関係が指定されていればそれに従います。

{% include goto_pagetop.html %}

* * *
## <a name="must-run-after">mustRunAfter</a><a href="#must-run-after">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-08" updated="2021-05-08" %}</div>
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

{% include goto_pagetop.html %}

* * *
## <a name="reference">参照</a><a href="#reference">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-08" updated="2021-05-08" %}</div>
- [(Qiita) Gradle のタスク定義のあれこれ](https://qiita.com/opengl-8080/items/0a192b62ee87d8ac7578)
- [(日々常々) Gradleのタスクは順番ちゃんとしよう](https://irof.hateblo.jp/entry/2019/12/13/172428)
- [(stack overflow) What is the difference between mustRunAfter and shouldRunAfter in task ordering in Gradle?](https://stackoverflow.com/questions/36794690/what-is-the-difference-between-mustrunafter-and-shouldrunafter-in-task-ordering)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
