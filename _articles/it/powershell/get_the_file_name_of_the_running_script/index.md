---
title: PowerShellで実行中のスクリプトのファイル名を取得する
article_group_id: reverse-lookup
display_order: 60
created: 2020-09-18
updated: 2020-09-18
---
`$PSCommandPath`という`自動変数`にスクリプトファイル(.ps1)のパスが格納されているようです。  
これを`\`で分割して最後の要素を取得すれば実行中のスクリプトのファイル名が取得できます。(バージョン3.0以降)

<div class="code-box">
<div class="title">スクリプトファイル(.ps1)のパス</div>
<pre>
$scriptName = Split-Path -Leaf $PSCommandPath
Write-Host $scriptName
</pre>
</div>

## <a name="get-the-file-name-of-the-running-script-reference">参考</a>

- [(バヤシタ) 実行中のスクリプトのファイル名を取得する方法](https://bayashita.com/p/entry/show/207)
