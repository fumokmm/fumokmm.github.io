---
title: PowerShell.exeでPowerShellを実行する
article_group_id: basis-group
display_order: 120
created: 2021-08-10
updated: 2021-08-10
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#PowerShell.exeで実行する">PowerShell.exeで実行する</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="PowerShell.exeで実行する">PowerShell.exeで実行する</a><a class="heading-anchor-permalink" href="#PowerShell.exeで実行する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-10" updated="2021-08-10" %}</div>
- `PowerShell.exe`にオプションとパラメータを指定してPowerShellスクリプトが実行できます。
- `-File`オプションの後に実行したいスクリプトのパスと、そのスクリプトファイルに渡す引数を指定します。
- `-ExecutionPolicy`オプションで[実行ポリシー]({% link _it_articles/powershell/execution_policy.md %})を指定します。
- `-NoLogo`と`-NoProfile`を付けると余分な出力が出ません。

<div class="code-box-syntax no-title">
<div class="copy-button">Copy</div>
<pre>
PowerShell -NoLogo -NoProfile -ExecutionPolicy Unrestricted -File <em>&lt;PowerShellスクリプトのパス&gt;</em> <em class="blue">&lt;パラメータ1&gt; &lt;パラメータ2&gt; ...</em>
</pre>
</div>

### 例
<div class="code-box">
<div class="title">hello.ps1</div>
<div class="copy-button">Copy</div>
<pre>
Write-Host "hello! $($args[0])"
</pre>
</div>

<div class="code-box-output">
<div class="title">コマンドプロンプト</div>
<div class="copy-button">Copy</div>
<pre>
<em class="command">C:\temp&gt;</em>PowerShell -NoLogo -NoProfile -ExecutionPolicy Unrestricted -File <em>.\hello.ps1</em>
hello!

<em class="command">C:\temp&gt;</em>PowerShell -NoLogo -NoProfile -ExecutionPolicy Unrestricted -File <em>.\hello.ps1</em> <em class="blue">world</em>
hello! world
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-10" updated="2021-08-10" %}</div>
### 参照
- [(Microsoft \| Docs) about_PowerShell_exe](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_powershell_exe)

### 関連メモ
- [PowerShellの実行ポリシーのについて]({% link _it_articles/powershell/execution_policy.md %})

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
