---
title: Gradleのプロジェクトプロパティ
display_order: 30
created: 2021-05-18
updated: 2021-05-18
---
コマンドラインからタスクにプロパティを渡したい場合があります。  
そんな時は、以下のようにすると渡すことができます。

<div class="code-box-syntax">
<div class="title">形式</div>
<pre>
-P<em>&lt;プロパティ名&gt;</em>=<em class="blue">&lt;値&gt;</em>
もしくは
--project-prop <em>&lt;プロパティ名&gt;</em>=<em class="blue">&lt;値&gt;</em>
</pre>
</div>

## タスク実行時にコマンドラインからプロパティを指定する
<div class="code-box-output no-title">
<pre>
$ gradle writeProp <em>-PpropA=100</em>
</pre>
</div>

複数指定する場合は`-P`や`--project-prop`を連ねて書きます。
<div class="code-box-output no-title">
<pre>
$ gradle writeProp <em>-PpropA=100</em> <em>-PpropB=200</em> <em>--project-prop propC=300</em>
</pre>
</div>

## スクリプト内でプロパティを参照する
- プロパティ値を参照するには、`project.<プロパティ名>`とします。
- プロパティ定義があるか確認するには、`project.hasProperty(<プロパティ名>)`を利用します。
<div class="code-box no-title">
<pre>
task writeProp {
    doLast {
        <em class="comment">// propAがある場合だけ出力する</em>
        if (<em>project.hasProperty('propA')</em>) {
            <em class="comment">// プロパティ値を出力</em>
            println "propA=${<em>project.propA</em>}"
        }
    }
}
</pre>
</div>

## 参考
- [(Qiita) Gradle (build.gradle) 読み書き入門](https://qiita.com/hatimiti/items/a127311d739c9d3e0045)
- [(Gradle User Manual) Command-Line Interface](https://docs.gradle.org/current/userguide/command_line_interface.html)
- [(Gradle User Manual) Project properties](https://docs.gradle.org/current/userguide/build_environment.html#sec:project_properties)
