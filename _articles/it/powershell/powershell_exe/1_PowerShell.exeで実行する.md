---
chapter_no: 1
chapter_title: PowerShell.exeで実行する
created: 2021-08-10
updated: 2021-08-10
---
- `PowerShell.exe`にオプションとパラメータを指定してPowerShellスクリプトが実行できます。
- `-File`オプションの後に実行したいスクリプトのパスと、そのスクリプトファイルに渡す引数を指定します。
- `-ExecutionPolicy`オプションで[実行ポリシー]({% link _it_articles/powershell/execution_policy.md %})を指定します。
- `-NoLogo`と`-NoProfile`を付けると余分な出力が出ません。

```syntax
PowerShell -NoLogo -NoProfile -ExecutionPolicy Unrestricted -File {em{<PowerShellスクリプトのパス>}em} {em:blue{<パラメータ1> <パラメータ2> ...}em}
```

### 例
```:hello.ps1
Write-Host "hello! $($args[0])"
```

```output:コマンドプロンプト
{em:command{C:\temp>}em}PowerShell -NoLogo -NoProfile -ExecutionPolicy Unrestricted -File {em{.\hello.ps1}em}
hello!

{em:command{C:\temp>}em}PowerShell -NoLogo -NoProfile -ExecutionPolicy Unrestricted -File {em{.\hello.ps1}em} {em:blue{world}em}
hello! world
```
