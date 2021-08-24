---
title: PowerShellで環境変数を取得・設定する
article_group_id: reverse-lookup-group
display_order: 100
created: 2021-08-24
updated: 2021-08-24
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#ユーザーの環境変数">ユーザーの環境変数</a></li>
<li><a href="#システムの環境変数">システムの環境変数</a></li>
<li><a href="#全取得">全取得</a></li>
<li><a href="#PATHへの追加">PATHへの追加</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="ユーザーの環境変数">ユーザーの環境変数</a><a class="heading-anchor-permalink" href="#ユーザーの環境変数">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-24" updated="2021-08-24" %}</div>
- 取得には`GetEnvironmentVariable`を利用します。
- 設定には`SetEnvironmentVariable`を利用します。
- `EnvironmentVariableTarget`には`User`を指定します。

### 取得
<div class="code-box no-title">
<pre>
[System.Environment]::GetEnvironmentVariable(<em>&lt;変数名&gt;</em>, [System.EnvironmentVariableTarget]::<em class="orange">User</em>)
</pre>
</div>
もしくは
<div class="code-box">
<div class="title">省略して書いた場合</div>
<pre>
[Environment]::GetEnvironmentVariable(<em>&lt;変数名&gt;</em>, <em class="orange">'User'</em>)
</pre>
</div>

### 設定
<div class="code-box no-title">
<pre>
[System.Environment]::SetEnvironmentVariable(<em>&lt;変数名&gt;</em>, <em class="blue">&lt;値&gt;</em>, [System.EnvironmentVariableTarget]::<em class="orange">User</em>)
</pre>
</div>
もしくは
<div class="code-box">
<div class="title">省略して書いた場合</div>
<pre>
[Environment]::SetEnvironmentVariable(<em>&lt;変数名&gt;</em>, <em class="blue">&lt;値&gt;</em>, <em class="orange">'User'</em>)
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="システムの環境変数">システムの環境変数</a><a class="heading-anchor-permalink" href="#システムの環境変数">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-24" updated="2021-08-24" %}</div>
- 取得には`GetEnvironmentVariable`を利用します。
- 設定には`SetEnvironmentVariable`を利用します。
- `EnvironmentVariableTarget`には`Machine`を指定[^machine]します。

### 取得
<div class="code-box no-title">
<pre>
[System.Environment]::GetEnvironmentVariable(<em>&lt;変数名&gt;</em>, [System.EnvironmentVariableTarget]::<em class="orange">Machine</em>)
</pre>
</div>
もしくは
<div class="code-box">
<div class="title">省略して書いた場合</div>
<pre>
[Environment]::GetEnvironmentVariable(<em>&lt;変数名&gt;</em>, <em class="orange">'Machine'</em>)
</pre>
</div>

### 設定
<div class="code-box no-title">
<pre>
[System.Environment]::SetEnvironmentVariable(<em>&lt;変数名&gt;</em>, <em class="blue">&lt;値&gt;</em>, [System.EnvironmentVariableTarget]::<em class="orange">Machine</em>)
</pre>
</div>
もしくは
<div class="code-box">
<div class="title">省略して書いた場合</div>
<pre>
[Environment]::SetEnvironmentVariable(<em>&lt;変数名&gt;</em>, <em class="blue">&lt;値&gt;</em>, <em class="orange">'Machine'</em>)
</pre>
</div>

[^machine]: システムとかじゃなくて、マシーンなんですね。

{% include goto_pagetop.html %}

* * *
## <a name="全取得">全取得</a><a class="heading-anchor-permalink" href="#全取得">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-24" updated="2021-08-24" %}</div>
- 全取得には`GetEnvironmentVariables`や`envドライブ`を利用します。

### GetEnvironmentVariables
<div class="code-box no-title">
<pre>
[Environment]::<em>GetEnvironmentVariables</em>()
</pre>
</div>

### envドライブ
<div class="code-box no-title">
<pre>
Get-ChildItem <em>env:</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="PATHへの追加">PATHへの追加</a><a class="heading-anchor-permalink" href="#PATHへの追加">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-24" updated="2021-08-24" %}</div>
`GetEnvironmentVariable`で変数`PATH`を取得してきた後、変数に値を文字列として追加し、再度`SetEnvironmentVariable`にて設定します。

<div class="code-box no-title">
<pre>
$path = [System.Environment]::GetEnvironmentVariable('PATH', [System.EnvironmentVariableTarget]::User)
$path += ';' + 'C:\path\to\anywhere'
[System.Environment]::SetEnvironmentVariable('PATH', $path, [System.EnvironmentVariableTarget]::User)
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-24" updated="2021-08-24" %}</div>
### 参考サイト
- [(Qiita) Windowsの環境変数をPowerShellで書き変える](https://qiita.com/mmorita/items/4c44363faf74a7105199)
- [(Qiita) Windows環境変数の設定に「SETX」コマンドを使ってはいけない理由](https://qiita.com/jeyei/items/05ce2739501832463b3b)
- [(Qiita)PowerShellで環境変数PATHにパスを追加・削除・置換する ](https://qiita.com/gx3n-inue/items/00ee48996e973050a440)
- [(WIN.JUST4FUN.BIZ)  PowerShellで環境変数一覧を表示する方法・Get-ChildItem env:](https://win.just4fun.biz/?PowerShell/%E7%92%B0%E5%A2%83%E5%A4%89%E6%95%B0%E4%B8%80%E8%A6%A7%E3%82%92%E8%A1%A8%E7%A4%BA%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95%E3%83%BBGet-ChildItem+env:)
- [(Microsoft \| Docs) about_Environment_Variables](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_environment_variables)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
