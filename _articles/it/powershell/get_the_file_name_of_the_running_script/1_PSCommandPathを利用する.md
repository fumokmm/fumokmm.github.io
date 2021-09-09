---
chapter_no: 1
chapter_title: $PSCommandPathを利用する
created: 2020-09-18
updated: 2021-07-25
---
PowerShell v3以降向け。  
`$PSCommandPath`という`自動変数`にスクリプトファイル(.ps1)のパスが格納されているようです。  
これを`\`で分割して最後の要素を取得すれば実行中のスクリプトのファイル名が取得できます。

```
# スクリプトファイル(.ps1)のパス
$scriptName1 = Split-Path -Leaf {em{$PSCommandPath}em}
Write-Host $scriptName1
```

### 参考
- [(バヤシタ) 実行中のスクリプトのファイル名を取得する方法](https://bayashita.com/p/entry/show/207)
