---
title: Gradleでビルドスクリプトを切り出したときのclasspathについて
article_group_id: tips-group
display_order: 10
created: 2023-02-05
updated: 2023-02-05
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#切り出したビルドスクリプトで依存関係を定義する">切り出したビルドスクリプトで依存関係を定義する</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2023-02-05" updated="2023-02-05" %}</div>
ビルドスクリプト中のclasspathはビルドスクリプト単位で有効になるようです。  
例えば、`build.gradle`から、`script1.gradle`というビルドスクリプトを読み込んでいる場合に、  
`script1.gradle`の中で`Groovy`の`YamlSlurper`を使いたかったような場合は、  
以下のように、`script1.gradle`の方で、`dependencies`の定義が必要なようです。

{% include goto_pagetop.html %}

* * *
## <a name="切り出したビルドスクリプトで依存関係を定義する">切り出したビルドスクリプトで依存関係を定義する</a><a class="heading-anchor-permalink" href="#切り出したビルドスクリプトで依存関係を定義する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2023-02-05" updated="2023-02-05" %}</div>
<div class="code-box">
<div class="title">build.gradle</div>
<div class="copy-button">Copy</div>
<pre>
apply from: 'script1.gradle'
</pre>
</div>

<div class="code-box">
<div class="title">script1.gradle</div>
<div class="copy-button">Copy</div>
<pre>
buildscript {
    repositories {
        mavenCentral()
    }
    dependencies {
        classpath 'org.apache.groovy:groovy-all:4.0.8'
        classpath 'org.apache.groovy:groovy-yaml:4.0.8'
    }
}

import groovy.yaml.*
task foo {
    doFirst {
        println("hello")
        <em class="comment">// ここでYamlSlurperが使える！</em>
        def yaml = new YamlSlurper()
        def data = yaml.parseText('''
        key1: value1
        key2: value2
        ''')
        println yaml <em class="comment">// groovy.yaml.YamlSlurper@xxxxxxxx</em>
        println(data.key1) <em class="comment">// Output: value1</em>
    }
}
</pre>
</div>

### 実行結果
<div class="code-box-output">
<div class="title">script1.gradleで定義したfooタスクを実行</div>
<div class="copy-button">Copy</div>
<pre>
$ gradle foo

&gt; Task :foo
hello
groovy.yaml.YamlSlurper@265c5e90
value1

BUILD SUCCESSFUL in 1s
1 actionable task: 1 executed
</pre>
</div>

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
