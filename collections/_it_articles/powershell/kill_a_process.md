---
title: PowerShellでプロセスを強制終了させる
article_group_id: reverse-lookup-group
display_order: 110
created: 2022-02-16
updated: 2022-02-16
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#プロセス名で強制終了させる">プロセス名で強制終了させる</a></li>
<li><a href="#プロセスIDで強制終了させる">プロセスIDで強制終了させる</a></li>
<li><a href="#補足">補足</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-16" updated="2022-02-16" %}</div>
- PowerShellでプロセスを強制終了させるためには、`Stop-Process`コマンドレットを利用します。

{% include goto_pagetop.html %}

* * *
## <a name="プロセス名で強制終了させる">プロセス名で強制終了させる</a><a class="heading-anchor-permalink" href="#プロセス名で強制終了させる">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-16" updated="2022-02-16" %}</div>
<div class="code-box-syntax no-title">
<pre>
<em>Stop-Process</em> <em class="command">-Name</em> <em class="blue">&lt;プロセス名&gt;</em>
</pre>
</div>
- 注意としては、同じ名前のプロセスが複数存在した場合、一気に終了されることです。
  - 一気に終了されては困る場合、[プロセスID](#プロセスIDで強制終了させる)を指定して終了させてください。

### 例：メモ帳のプロセスを停止
<div class="code-box-output no-title">
<pre>
Stop-Process -Name <em>notepad</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="プロセスIDで強制終了させる">プロセスIDで強制終了させる</a><a class="heading-anchor-permalink" href="#プロセスIDで強制終了させる">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-16" updated="2022-02-16" %}</div>
<div class="code-box-syntax no-title">
<pre>
<em>Stop-Process</em> <em class="command">-ID</em> <em class="blue">&lt;プロセスID&gt;</em>
</pre>
</div>
- 注意としては、同じ名前のプロセスが複数存在した場合、一気に終了されることです。
  - 一気に終了されては困る場合、[プロセスID](#プロセスIDで強制終了させる)を指定して終了させてください。

### 例：プロセスIDが9999のプロセスを停止
<div class="code-box-output no-title">
<pre>
Stop-Process -ID <em>9999</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="補足">補足</a><a class="heading-anchor-permalink" href="#補足">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-16" updated="2022-02-16" %}</div>
プロセス名やプロセスIDを調べるには、`Get-Process`コマンドレットを利用してください。

<div class="code-box">
<div class="title">例：winで始まる名前のプロセスを表示</div>
<pre>
Get-Process -Name <em>win*</em>
</pre>
</div>
<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
Handles  NPM(K)    PM(K)      WS(K)     CPU(s)     Id  SI ProcessName
-------  ------    -----      -----     ------     --  -- -----------
    252      29     8616       8060       0.16  13776   2 Win32Bridge.Server
    662      36    27868      84424       1.36  12312   2 WindowsTerminal
    157      11     1436       5532               860   0 wininit
    287      14     2816       2444              8464   2 winlogon
</pre>
</div>
- `ProcessName`がプロセス名となります。
- `Id`がプロセスIDとなります。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-16" updated="2022-02-16" %}</div>
### 参考サイト
- [(チェシャわら) 【Stop-Process】PowerShellでプロセスを強制終了させる方法とは？](https://cheshire-wara.com/powershell/ps-cmdlets/system-service/stop-process/)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
