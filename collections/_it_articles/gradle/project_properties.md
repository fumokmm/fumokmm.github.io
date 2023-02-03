---
title: Gradleのプロジェクトプロパティ
article_group_id: basis-group
display_order: 30
created: 2021-05-18
updated: 2021-05-18
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#タスク実行時にコマンドラインからプロパティを指定する">タスク実行時にコマンドラインからプロパティを指定する</a></li>
<li><a href="#スクリプト内でプロパティを参照する">スクリプト内でプロパティを参照する</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-18" updated="2021-05-18" %}</div>
コマンドラインからタスクにプロパティを渡したい場合があります。  
そんな時は、以下のようにすると渡すことができます。

<div class="code-box">
<div class="title">形式</div>
<div class="copy-button">Copy</div>
<pre>
-P<em>プロパティ名</em>=<em class="blue">値</em>
もしくは
--project-prop <em>プロパティ名</em>=<em class="blue">値</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="タスク実行時にコマンドラインからプロパティを指定する">タスク実行時にコマンドラインからプロパティを指定する</a><a class="heading-anchor-permalink" href="#タスク実行時にコマンドラインからプロパティを指定する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-18" updated="2021-05-18" %}</div>
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
$ gradle writeProp <em>-PpropA=100</em>
</pre>
</div>

複数指定する場合は`-P`や`--project-prop`を連ねて書きます。
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
$ gradle writeProp <em>-PpropA=100</em> <em>-PpropB=200</em> <em>--project-prop propC=300</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="スクリプト内でプロパティを参照する">スクリプト内でプロパティを参照する</a><a class="heading-anchor-permalink" href="#スクリプト内でプロパティを参照する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-18" updated="2021-05-18" %}</div>
- プロパティ値を参照するには、`project.<プロパティ名>`とします。
- プロパティ定義があるか確認するには、`project.hasProperty(<プロパティ名>)`を利用します。

<div class="code-box no-title">
<div class="copy-button">Copy</div>
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

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-18" updated="2021-05-18" %}</div>
### 公式サイト（リファレンス）
- [(Gradle User Manual) Command-Line Interface](https://docs.gradle.org/current/userguide/command_line_interface.html)
- [(Gradle User Manual) Project properties](https://docs.gradle.org/current/userguide/build_environment.html#sec:project_properties)

### 参考サイト
- [(Qiita) Gradle (build.gradle) 読み書き入門](https://qiita.com/hatimiti/items/a127311d739c9d3e0045)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
