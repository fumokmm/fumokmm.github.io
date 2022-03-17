---
chapter_no: 10
chapter_title: PowerShellのスクリプトの引数
sub_category_id: powershell
created: 2022-03-17
updated: 2022-03-17
---
- PowerShellの場合、通常の方法と、`Param()`を使う方法があります。

### 通常の方法
- スクリプトの引数は自動的に`$Args[]`に格納されます。
- 第1引数は`$Args[0]`、第2引数は`$Args[1]`という形式で取得できます。
```:test1.ps1
Write-Host {em{$Args[0]}em}
Write-Host {em:blue{$Args[1]}em}
```
```output:実行結果
{em:command{PS C:\temp>}em} .\test1.ps1 {em{aaa}em} {em:blue{100}em}
aaa
100
```

### Param()
- Paramを使ってあらかじめ引数を宣言しておくことができます。
```:test2.ps1
Param({em{$Arg1}em}, {em:blue{$Arg2}em}) {em:comment{#第一引数を$Arg1, 第二引数を$Arg2に格納する}em}
Write-Host {em{$Arg1}em}
Write-Host {em:blue{$Arg2}em}
```
- 通常に呼び出したり、明示的に名前を指定して呼び出したりできます。
```output:実行結果
{em:command{PS C:\temp>}em} .\test2.ps1 {em{aaa}em} {em:blue{100}em}
aaa
100
{em:command{PS C:\temp>}em} .\test2.ps1 {em{-Arg1 aaa}em} {em:blue{-Arg2 100}em}
aaa
100
{em:command{PS C:\temp>}em} .\test2.ps1 {em:blue{-Arg2 100}em} {em{-Arg1 aaa}em}
aaa
100
```

### スイッチ
- オプション指定したかどうかを`bool型`で受け取る引数を作成できます(Paramを使います)。
- 引数に`switch`という型を指定します。
```:test3.ps1
Param(
    {em{[switch]}em} $dev,
    {em{[switch]}em} $stg,
    {em{[switch]}em} $prd
)
Write-Host $dev
Write-Host $stg
Write-Host $prd
```
- `-dev`, `-stg`などの環境を表すようなスイッチを想定しています。
- 例えば、`-stg`と指定してスクリプトを実行すると、$stgの値が`$true`となります。
```output:実行結果
{em:command{PS C:\temp>}em} .\test3.ps1
False
False
False
{em:command{PS C:\temp>}em} .\test3.ps1 {em{-stg}em}
False
{em{True}em}
False
{em:command{PS C:\temp>}em} .\test3.ps1 {em{-dev -stg -prd}em}
{em{True
True
True}em}
```
- その他、引数の型を宣言したり、初期値をセットしたり、必須パラメータにしたりといろいろ指定できますが割愛します。
- 詳細は参考サイトをご覧ください。

### 参考サイト
- [(マイクロソフ党ブログ) Powershellで引数を受け取る](https://microsoftou.com/ps-arguments/)
- [(Windows にまつわる e.t.c.) PowerShell スクリプト引数(Param)の Tips](http://www.vwnet.jp/windows/PowerShell/Param.htm)