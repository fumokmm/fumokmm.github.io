---
chapter_no: 1
chapter_title: PRINT
created: 2021-08-02
updated: 2021-08-02
---
- `@変数名`で宣言した変数に設定した文字列などを出力するには、`PRINT`を利用します。
```
DECLARE {em{@nm}em} as nvarchar(40)
SET {em{@nm}em} = 'fumo'
PRINT 'こんにちは!' + {em{@nm}em} + 'さん'
```

### 出力結果
```output
こんにちは!fumoさん
```
