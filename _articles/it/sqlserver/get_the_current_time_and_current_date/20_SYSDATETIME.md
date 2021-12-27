---
chapter_no: 20
chapter_title: SYSDATETIME()
created: 2021-12-27
updated: 2021-12-27
---
### マイクロ秒まで取得
```syntax
SYSDATETIME()
```
- 戻りの型は`datetime2`。

### 例
```
SELECT {em{SYSDATETIME()}em};
```
```output:取得結果
2021-12-27 21:21:53.7943457
```

### 参照
- [(Microsoft \| Docs) SYSDATETIME (Transact-SQL)](https://docs.microsoft.com/ja-jp/sql/t-sql/functions/sysdatetime-transact-sql)
