---
chapter_no: 140
chapter_group: 基礎文法
chapter_title: 条件分岐 - If-Then-Elseステートメント
created: 2021-09-14
updated: 2021-09-14
---
### If-Then-Else
```syntax
{em{If}em} {em:blue{<条件式>}em} {em{Then}em}
    {em:orange{処理1}em}
{em{Else}em}
    {em:orange{処理2}em}
{em{End If}em}
```
- `If`に続いて`<条件式>`を記述します。
- `条件式`が`True`であれば`Then`に続く`処理1`が実行されます。
- `条件式`が`False`であれば`Else`に続く`処理2`が実行されます。
- `Else句`は省略可能です。

- 条件には`ブール式`または`数値式`を指定します。  
  - `数値式`の場合、`0`は`False`、`0以外`はすべて`True`と判定されます。

以下のように一行に記述することもできます。  
```syntax
{em{If}em} {em:blue{<条件>}em} {em{Then}em} {em:orange{処理1}em} {em{Else}em} {em:orange{<処理2>}em}
```
- 一行に記述した場合、末尾の`End If`は省略可能です。

### If-ElseIf
あとで書きます。
