---
chapter_no: 20
chapter_title: PowerShellで作成
created: 2021-12-24
updated: 2021-12-24
---
```syntax
New-Item -Value {em{<リンク先フォルダ>}em} -Path {em{<シンボリックリンクの配置先>}em} -Name {em{<シンボリックリンク名>}em} {em:blue{-ItemType SymbolicLink}em}
```
PowerShellの場合は、ファイル、フォルダへのシンボリックリンクのどちらもこの書式で記述できます。

### 例
```
New-Item -Value "C:\Program Files\Java\jdk-13.0.1" -Path "C:\temp" -Name "java-currentver" -ItemType SymbolicLink
```
