---
title: PowerShellのTips
created: 2020-09-18
updated: 2020-09-18
---
ここではPowerShellのちょっとしたTipsをまとめておきます。

## <a name="index">目次</a>

- [実行中のスクリプトのあるディレクトリを取得](#get-the-directory-where-the-script-is-running)
- [実行中のスクリプトのファイル名を取得](#get-the-file-name-of-the-running-script)

### <a name="get-the-directory-where-the-script-is-running">実行中のスクリプトのあるディレクトリを取得</a>

`$PSScriptRoot`という`自動変数`にスクリプトファイル(.ps1)がどこに置かれているかが格納されているようです。(バージョン3.0以降)

<pre class="code">
Write-Host $PSScriptRoot
</pre>

#### <a name="get-the-directory-where-the-script-is-running-reference">参考</a>

- [スクリプトフォルダーの取得](https://www.vwnet.jp/Windows/PowerShell/pwd.htm)

### <a name="get-the-file-name-of-the-running-script">実行中のスクリプトのファイル名を取得</a>

`$PSCommandPath`という`自動変数`にスクリプトファイル(.ps1)のパスが格納されているようです。  
これを`\`で分割して最後の要素を取得すれば実行中のスクリプトのファイル名が取得できます。(バージョン3.0以降)

<pre class="code">
$scriptName = Split-Path -Leaf $PSCommandPath
Write-Host $scriptName
</pre>

#### <a name="get-the-file-name-of-the-running-script-reference">参考</a>

- [実行中のスクリプトのファイル名を取得する方法](https://bayashita.com/p/entry/show/207)
