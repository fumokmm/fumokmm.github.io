---
chapter_no: 1
chapter_title: $PSScriptRootを利用する
created: 2020-09-18
updated: 2021-08-13
---
PowerShell v3以降向け。  
`$PSScriptRoot`という`自動変数`にスクリプトファイル(.ps1)がどこに置かれているかが格納されているようです。

```:scriptdir.ps1
Write-Host {em{$PSScriptRoot}em}
```

```output:実行結果
{em:command{PS C:\temp>}em} .\scriptdir.ps1
C:\temp
```
- Windows Batchの`%~dp0`とは違って、末尾に`\`は付きません。

### 参考
- [(Windows にまつわる e.t.c.) スクリプトフォルダーの取得](https://www.vwnet.jp/Windows/PowerShell/pwd.htm)
