---
title: PowerShellをStrictモードで実行する
article_group_id: basis-group
display_order: 110
created: 2021-08-05
updated: 2021-08-05
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#Strictモードの設定と解除">Strictモードの設定と解除</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="Strictモードの設定と解除">Strictモードの設定と解除</a><a class="heading-anchor-permalink" href="#Strictモードの設定と解除">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-05" updated="2021-08-05" %}</div>
- `Set-PSDebug`コマンドで`-Strict`を呼び出すと*Strictモード*になります。
  - Strictモード中は未割当の変数があるとエラーになるようになります。
- `Set-PSDebug`コマンドで`-Off`を呼び出すと、*Strictモード*が解除されます。

<div class="code-box-output no-title">
<pre>
<em class="command">PS C:\temp&gt;</em> Set-PSDebug -Strict
<em class="command">PS C:\temp&gt;</em> $newValue
<em>変数 '$newValue' は、設定されていないために取得できません。
発生場所 行:1 文字:1
+ $newValue
+ ~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (newValue:String) []、RuntimeException
    + FullyQualifiedErrorId : VariableIsUndefined</em>
 
<em class="command">PS C:\temp&gt;</em> Set-PSDebug -Off
<em class="command">PS C:\temp&gt;</em> $newValue
<em class="command">PS C:\temp&gt;</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-05" updated="2021-08-05" %}</div>
- [(Microsoft \| Docs) Set-PSDebug](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/set-psdebug)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
