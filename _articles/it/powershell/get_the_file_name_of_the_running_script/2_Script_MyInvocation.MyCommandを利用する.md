---
chapter_no: 2
chapter_title: $Script:MyInvocation.MyCommandを利用する
created: 2021-07-25
updated: 2021-07-25
---
PowerShell v2以前向け。  
`$Script:MyInvocation.MyCommand.Path`にはスクリプトファイルのフルパスが、  
`$Script:MyInvocation.MyCommand.Name`にはスクリプトファイル名が格納されているようですので、  
以下のようにすればファイル名が取得できます。

```
# スクリプトファイル(.ps1)のパス
$scriptName2 = Split-Path -Leaf {em{$Script:MyInvocation.MyCommand}em}{em:blue{.Path}em}
Write-Host $scriptName2

# スクリプトファイル名
$scriptName3 = {em{$Script:MyInvocation.MyCommand}em}{em:blue{.Name}em}
Write-Host $scriptName3
```

### 参考
- [(Windows にまつわる e.t.c.) スクリプトフォルダーの取得](https://www.vwnet.jp/Windows/PowerShell/pwd.htm)
