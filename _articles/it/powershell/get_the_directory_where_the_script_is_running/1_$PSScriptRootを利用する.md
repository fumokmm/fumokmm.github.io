---
chapter_no: 1
chapter_title: $PSScriptRootを利用する
created: 2020-09-18
updated: 2021-07-25
---
PowerShell v3以降向け。  
`$PSScriptRoot`という`自動変数`にスクリプトファイル(.ps1)がどこに置かれているかが格納されているようです。

```:スクリプトファイル(.ps1)がどこに置かれているか
Write-Host {em{$PSScriptRoot}em}
```

### 参考
- [(Windows にまつわる e.t.c.) スクリプトフォルダーの取得](https://www.vwnet.jp/Windows/PowerShell/pwd.htm)
