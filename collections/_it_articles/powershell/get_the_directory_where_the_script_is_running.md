---
title: PowerShellで実行中のスクリプトのあるディレクトリを取得
article_group_id: reverse-lookup
display_order: 50
created: 2020-09-18
updated: 2020-10-15
---
`$PSScriptRoot`という`自動変数`にスクリプトファイル(.ps1)がどこに置かれているかが格納されているようです。(バージョン3.0以降)

<div class="code-box">
<div class="title">スクリプトファイル(.ps1)がどこに置かれているか</div>
<pre>
Write-Host $PSScriptRoot
</pre>
</div>

## <a name="get-the-directory-where-the-script-is-running-reference">参考</a>

- [(Windows にまつわる e.t.c.) スクリプトフォルダーの取得](https://www.vwnet.jp/Windows/PowerShell/pwd.htm)

{% include footnotes_link.html %}
