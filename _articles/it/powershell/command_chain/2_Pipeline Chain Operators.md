---
chapter_no: 2
chapter_title: Pipeline Chain Operators(&& と ||)を使う
created: 2021-08-13
updated: 2021-08-13
---
PowerShell 7からはBashとかと同じようなPipeline Chain Operatorsが使えるようになったみたいです。

### &&演算子
- `&&`は前のコマンドが*成功*した場合、後のコマンドを実行します。

```syntax
<コマンド1> {em{&&}em} <コマンド2>
```

### ||演算子
- `||`は前のコマンドが*失敗*した場合、後のコマンドを実行します。(`&&`の逆)

```syntax
<コマンド1> {em{||}em} <コマンド2>
```
