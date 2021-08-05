---
chapter_no: 1
chapter_title: Strictモードの設定と解除
created: 2021-08-05
updated: 2021-08-05
---
- `Set-PSDebug`コマンドで`-Strict`を呼び出すと*Strictモード*になります。
  - Strictモード中は未割当の変数があるとエラーになるようになります。
- `Set-PSDebug`コマンドで`-Off`を呼び出すと、*Strictモード*が解除されます。

```output
{em:command{PS C:\temp>}em} Set-PSDebug -Strict
{em:command{PS C:\temp>}em} $newValue
{em{変数 '$newValue' は、設定されていないために取得できません。
発生場所 行:1 文字:1
+ $newValue
+ ~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (newValue:String) []、RuntimeException
    + FullyQualifiedErrorId : VariableIsUndefined}em}
 
{em:command{PS C:\temp>}em} Set-PSDebug -Off
{em:command{PS C:\temp>}em} $newValue
{em:command{PS C:\temp>}em}
```
