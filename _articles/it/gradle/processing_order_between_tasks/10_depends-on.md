---
chapter_no: 10
chapter_id: depends-on
chapter_title: dependsOn
created: 2021-05-08
updated: 2021-05-08
---
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
