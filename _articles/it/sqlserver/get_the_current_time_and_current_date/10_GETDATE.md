---
chapter_no: 10
chapter_title: GETDATE()
created: 2021-12-27
updated: 2021-12-27
---
### ミリ秒まで取得
```syntax
GETDATE()
```
- 戻りの型は`datetime`。

### 例
```
SELECT {em{GETDATE()}em};
```
```output:取得結果
2021-12-27 21:17:21.800
```

### 日付だけ取得
日付だけ取得するには、`date`にキャストするとよい。

### 例
```
SELECT {em:blue{CAST(}em}{em{GETDATE()}em} {em:blue{AS DATE}em});
```
```output:取得結果
2021-12-27
```

### 参照
- [(Microsoft \| Docs) GETDATE (Transact-SQL)](https://docs.microsoft.com/ja-jp/sql/t-sql/functions/getdate-transact-sql)